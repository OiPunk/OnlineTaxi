package com.online.taxi.task;

import com.online.taxi.constatnt.ChargingCategoryEnum;
import com.online.taxi.dao.DynamicDiscountRuleDao;
import com.online.taxi.dao.OrderRulePriceDao;
import com.online.taxi.dao.OrderRulePriceDetailDao;
import com.online.taxi.dao.OrderRulePriceTagDao;
import com.online.taxi.dto.DriveMeter;
import com.online.taxi.dto.PriceMeter;
import com.online.taxi.dto.TimeMeter;
import com.online.taxi.dto.valuation.charging.KeyRule;
import com.online.taxi.dto.valuation.charging.Rule;
import com.online.taxi.dto.valuation.charging.TagPrice;
import com.online.taxi.dto.valuation.discount.DiscountCondition;
import com.online.taxi.dto.valuation.discount.DiscountPrice;
import com.online.taxi.entity.OrderRulePrice;
import com.online.taxi.entity.OrderRulePriceDetail;
import com.online.taxi.entity.OrderRulePriceTag;
import com.online.taxi.util.PriceHelper;
import com.online.taxi.util.TimeSlice;
import com.online.taxi.util.UnitConverter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

/**
 * 计价服务异步任务
 *
 * @date 2018/8/14
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ValuationTask {

    @NonNull
    private OrderRulePriceDao orderRulePriceDao;

    @NonNull
    private OrderRulePriceDetailDao orderRulePriceDetailDao;

    @NonNull
    private OrderRulePriceTagDao orderRulePriceTagDao;

    @NonNull
    private DynamicDiscountRuleDao dynamicDiscountRuleDao;

    /**
     * 计算基本价格
     *
     * @param driveMeter 行驶信息
     * @return 基本价格
     */
    @Async
    public CompletableFuture<OrderRulePrice> calcMasterPrice(DriveMeter driveMeter) {
        OrderRulePrice rulePrice = new OrderRulePrice();
        Rule rule = driveMeter.getRule();

        //key信息
        rulePrice.setOrderId(driveMeter.getOrder() != null ? driveMeter.getOrder().getId() : driveMeter.getCurrentPriceRequestDto().getOrderId());
        rulePrice.setCategory(driveMeter.getChargingCategoryEnum().getCodeAsString());
        rulePrice.setTotalDistance(UnitConverter.meterToKilo(driveMeter.getTotalDistance()));
        rulePrice.setTotalTime(UnitConverter.secondToMinute(driveMeter.getTotalTime()));
        rulePrice.setCityCode(rule.getKeyRule().getCityCode());
        rulePrice.setCityName(rule.getKeyRule().getCityName());
        rulePrice.setServiceTypeId(rule.getKeyRule().getServiceTypeId());
        rulePrice.setServiceTypeName(rule.getKeyRule().getServiceTypeName());
        rulePrice.setChannelId(rule.getKeyRule().getChannelId());
        rulePrice.setChannelName(rule.getKeyRule().getChannelName());
        rulePrice.setCarLevelId(rule.getKeyRule().getCarLevelId());
        rulePrice.setCarLevelName(rule.getKeyRule().getCarLevelName());

        //基础价格
        rulePrice.setBasePrice(rule.getBasicRule().getBasePrice());
        rulePrice.setBaseKilo(rule.getBasicRule().getKilos());
        rulePrice.setBaseMinute(rule.getBasicRule().getMinutes());
        rulePrice.setLowestPrice(rule.getBasicRule().getLowestPrice());
        rulePrice.setPerKiloPrice(rule.getPriceRule().getPerKiloPrice());
        rulePrice.setPerMinutePrice(rule.getPriceRule().getPerMinutePrice());

        //夜间价格
        rulePrice.setNightTime(0D);
        rulePrice.setNightDistance(0D);
        rulePrice.setNightPrice(BigDecimal.ZERO);
        if (rule.getNightRule().getStart() != null && rule.getNightRule().getEnd() != null) {
            rulePrice.setNightStart(rule.getNightRule().getStart());
            rulePrice.setNightEnd(rule.getNightRule().getEnd());
            rulePrice.setNightPerKiloPrice(rule.getNightRule().getPerKiloPrice());
            rulePrice.setNightPerMinutePrice(rule.getNightRule().getPerMinutePrice());

            //计算夜间价格
            TimeMeter.TimePriceUnit unit = generateTimePriceUnit(driveMeter);
            unit.setStart(UnitConverter.dateToLocalTime(rulePrice.getNightStart()));
            unit.setEnd(UnitConverter.dateToLocalTime(rulePrice.getNightEnd()));
            unit.setPerMeterPrice(UnitConverter.kiloToMeterPrice(rulePrice.getNightPerKiloPrice()));
            unit.setPerSecondPrice(UnitConverter.minuteToSecondPrice(rulePrice.getNightPerMinutePrice()));
            TimeMeter.TimePriceResult result = TimeMeter.measure(generateTimeSlice(driveMeter), unit);
            rulePrice.setNightTime(UnitConverter.secondToMinute(result.getDuration()));
            rulePrice.setNightDistance(UnitConverter.meterToKilo(result.getDistance()));
            rulePrice.setNightPrice(PriceHelper.add(result.getDistancePrice(), result.getTimePrice()));
        }

        //远途价格
        rulePrice.setBeyondStartKilo(rule.getBeyondRule().getStartKilo());
        rulePrice.setBeyondPerKiloPrice(rule.getBeyondRule().getPerKiloPrice());
        rulePrice.setBeyondDistance(PriceHelper.subtract(rulePrice.getTotalDistance(), rulePrice.getBeyondStartKilo()).doubleValue());
        rulePrice.setBeyondPrice(PriceHelper.multiply(rulePrice.getBeyondPerKiloPrice(), rulePrice.getBeyondDistance()));

        return new AsyncResult<>(rulePrice).completable();
    }

    /**
     * 计算分段计时价格
     *
     * @param driveMeter 行驶信息
     * @return 分段计时价格
     */
    @Async
    public CompletableFuture<List<OrderRulePriceDetail>> calcDetailPrice(DriveMeter driveMeter) {
        //行驶开始到结束的时间片
        TimeSlice totalSlice = generateTimeSlice(driveMeter);

        //根据时间段计算价格
        List<OrderRulePriceDetail> details = Optional.ofNullable(driveMeter.getRule().getPriceRule().getTimeRules()).orElse(new ArrayList<>()).stream().map(r -> {
            OrderRulePriceDetail detail = new OrderRulePriceDetail();
            detail.setOrderId(driveMeter.getOrder() != null ? driveMeter.getOrder().getId() : driveMeter.getCurrentPriceRequestDto().getOrderId());
            detail.setCategory(driveMeter.getChargingCategoryEnum().getCodeAsString());
            detail.setStartHour(r.getStart());
            detail.setEndHour(r.getEnd());
            detail.setPerKiloPrice(r.getPerKiloPrice());
            detail.setPerMinutePrice(r.getPerMinutePrice());

            //设置计算用参数
            TimeMeter.TimePriceUnit unit = generateTimePriceUnit(driveMeter);
            unit.setStart(LocalTime.of(detail.getStartHour(), 0, 0));
            unit.setEnd(LocalTime.of(detail.getEndHour(), 0, 0).minusSeconds(1));
            unit.setPerMeterPrice(UnitConverter.kiloToMeterPrice(detail.getPerKiloPrice()));
            unit.setPerSecondPrice(UnitConverter.minuteToSecondPrice(detail.getPerMinutePrice()));

            //获取计算结果
            TimeMeter.TimePriceResult result = TimeMeter.measure(totalSlice, unit);
            detail.setDuration(UnitConverter.secondToMinute(result.getDuration()));
            detail.setTimePrice(PriceHelper.resetScale(result.getTimePrice()));
            detail.setDistance(UnitConverter.meterToKilo(result.getDistance()));
            detail.setDistancePrice(PriceHelper.resetScale(result.getDistancePrice()));

            return detail;
        }).collect(Collectors.toList());

        return new AsyncResult<>(details).completable();
    }

    /**
     * 计算其他价格
     *
     * @param driveMeter 驾驶参数
     * @param master     基础计价任务结果
     * @param details    分段计价任务结果
     */
    public void calcOtherPrice(DriveMeter driveMeter, OrderRulePrice master, List<OrderRulePriceDetail> details) {
        //是否采用基础套餐的计费规则
        if (driveMeter.getRule().getBasicRule().isBasicCharging()) {
            master.setRestDistance(0D);
            master.setRestDistancePrice(BigDecimal.ZERO);
            master.setRestDuration(0D);
            master.setRestDurationPrice(BigDecimal.ZERO);

            master.setPath(PriceHelper.subtract(master.getTotalDistance(), master.getBaseKilo()).doubleValue());
            master.setPathPrice(PriceHelper.multiply(master.getPerKiloPrice(), master.getPath()));
            master.setDuration(PriceHelper.subtract(master.getTotalTime(), master.getBaseMinute()).doubleValue());
            master.setDurationPrice(PriceHelper.multiply(master.getPerMinutePrice(), master.getDuration()));
        } else {
            //计算时间段外的价格
            master.setRestDistance(PriceHelper.subtract(master.getTotalDistance(), details.stream().mapToDouble(OrderRulePriceDetail::getDistance).sum()).doubleValue());
            master.setRestDistancePrice(PriceHelper.multiply(master.getPerKiloPrice(), master.getRestDistance()));
            master.setRestDuration(PriceHelper.subtract(master.getTotalTime(), details.stream().mapToDouble(OrderRulePriceDetail::getDuration).sum()).doubleValue());
            master.setRestDurationPrice(PriceHelper.multiply(master.getPerMinutePrice(), master.getRestDuration()));

            master.setPath(master.getTotalDistance());
            master.setPathPrice(PriceHelper.add(master.getRestDistancePrice(), details.stream().map(OrderRulePriceDetail::getDistancePrice).reduce(BigDecimal.ZERO, BigDecimal::add)));
            master.setDuration(master.getTotalTime());
            master.setDurationPrice(PriceHelper.add(master.getRestDurationPrice(), details.stream().map(OrderRulePriceDetail::getTimePrice).reduce(BigDecimal.ZERO, BigDecimal::add)));
        }

    }

    /**
     * 计算动态调价
     *
     * @param driveMeter 行驶信息
     * @return 动态调价的结果
     */
    public DiscountPrice calcDiscount(DriveMeter driveMeter) {
        KeyRule keyRule = driveMeter.getRule().getKeyRule();
        LocalDateTime start = UnitConverter.dateToLocalDateTime(driveMeter.getOrder() != null ? driveMeter.getOrder().getOrderStartTime() : new Date(driveMeter.getCurrentPriceRequestDto().getStartTime()));

        DiscountCondition condition = new DiscountCondition();
        condition.setCityCode(keyRule.getCityCode());
        condition.setServiceTypeId(keyRule.getServiceTypeId());
        condition.setCarLevelId(keyRule.getCarLevelId());
        condition.setTotalDistance(UnitConverter.meterToKilo(driveMeter.getTotalDistance()));
        condition.setStartHour(start.getHour());
        condition.setStartDate(start.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        condition.setStartWeekDay(start.getDayOfWeek().getValue());
        return dynamicDiscountRuleDao.findDiscountByCondition(condition);
    }

    /**
     * 计算标签价格
     *
     * @param driveMeter 驾驶参数
     * @return 标签价格
     */
    public BigDecimal calcTagPrice(DriveMeter driveMeter) {
        BigDecimal totalPrice = BigDecimal.ZERO;
        //计算标签价格
        if (driveMeter.getRule().getTagPrices() != null) {
            totalPrice = driveMeter.getRule().getTagPrices().stream().map(TagPrice::getPrice).reduce(totalPrice, BigDecimal::add);
        }
        return totalPrice;
    }

    /**
     * 更新数据库
     *
     * @param chargingCategory 计价规则种类
     * @param priceMeter       价格集合类DTO
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateToDb(ChargingCategoryEnum chargingCategory, PriceMeter priceMeter) {
        if (chargingCategory != ChargingCategoryEnum.Forecast && chargingCategory != ChargingCategoryEnum.Settlement) {
            return;
        }

        OrderRulePrice master = priceMeter.getRulePrice();
        List<OrderRulePriceDetail> details = priceMeter.getRulePriceDetails();
        List<TagPrice> tagPrices = priceMeter.getTagPrices();

        int orderId = master.getOrderId();
        orderRulePriceDao.deleteByOrderIdAndCategory(orderId, chargingCategory);
        orderRulePriceDetailDao.deleteByOrderIdAndCategory(orderId, chargingCategory);
        orderRulePriceTagDao.deleteByOrderIdAndCategory(orderId, chargingCategory);

        //添加创建时间
        Date now = new Date();
        master.setCreateTime(now);

        //更新计费明细表
        orderRulePriceDao.insert(master);

        //更新分段计时计费明细表
        if (details != null && !details.isEmpty()) {
            details.forEach(detail -> detail.setCreateTime(now));
            orderRulePriceDetailDao.insert(details);
        }

        //更新标签计费明细表
        if (tagPrices != null && !tagPrices.isEmpty()) {
            List<OrderRulePriceTag> priceTags = tagPrices.stream().map(tagPrice -> {
                OrderRulePriceTag orderRulePriceTag = new OrderRulePriceTag();
                orderRulePriceTag.setOrderId(orderId);
                orderRulePriceTag.setCategory(chargingCategory.getCodeAsString());
                orderRulePriceTag.setTagName(tagPrice.getName());
                orderRulePriceTag.setTagPrice(tagPrice.getPrice());
                orderRulePriceTag.setCreateTime(now);
                return orderRulePriceTag;
            }).collect(Collectors.toList());
            orderRulePriceTagDao.insert(priceTags);
        }
    }

    /**
     * 行驶开始到结束的时间片
     *
     * @param driveMeter 行驶信息
     * @return 时间片
     */
    private TimeSlice generateTimeSlice(DriveMeter driveMeter) {
        TimeSlice totalSlice = new TimeSlice();
        totalSlice.setX(driveMeter.getStartDateTime());
        totalSlice.setY(totalSlice.getX().plusSeconds((long) Math.ceil(driveMeter.getTotalTime())));
        return totalSlice;
    }

    /**
     * 生成计算用参数
     *
     * @param driveMeter 行驶信息
     * @return 计算用参数实例
     */
    private TimeMeter.TimePriceUnit generateTimePriceUnit(DriveMeter driveMeter) {
        TimeMeter.TimePriceUnit unit = null;
        switch (driveMeter.getChargingCategoryEnum()) {
            case Forecast:
                BigDecimal speed = BigDecimal.valueOf(driveMeter.getTotalDistance()).divide(BigDecimal.valueOf(driveMeter.getTotalTime()), 5, RoundingMode.DOWN);
                unit = TimeMeter.TimePriceUnit.instanceByForecast(speed.doubleValue());
                break;
            case Settlement:
            case RealTime:
                int carId = driveMeter.getOrder() != null ? driveMeter.getOrder().getCarId() : driveMeter.getCurrentPriceRequestDto().getCarId();
                String cityCode = driveMeter.getRule().getKeyRule().getCityCode();
                unit = TimeMeter.TimePriceUnit.instanceBySettlement(driveMeter.getChargingCategoryEnum(), driveMeter.getRequestTask(), carId, cityCode);
                break;
            default:
                break;
        }
        return unit;
    }
}
