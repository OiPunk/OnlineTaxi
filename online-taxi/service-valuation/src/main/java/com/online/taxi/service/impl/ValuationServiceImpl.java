package com.online.taxi.service.impl;

import com.online.taxi.constatnt.ChargingCategoryEnum;
import com.online.taxi.dao.OrderDao;
import com.online.taxi.dao.cache.PriceCache;
import com.online.taxi.dao.cache.RuleCache;
import com.online.taxi.dto.DriveMeter;
import com.online.taxi.dto.ForecastDetail;
import com.online.taxi.dto.PriceMeter;
import com.online.taxi.dto.request.CurrentPriceRequestDto;
import com.online.taxi.dto.response.CurrentPriceResponseDto;
import com.online.taxi.dto.valuation.charging.Rule;
import com.online.taxi.dto.valuation.discount.DiscountPrice;
import com.online.taxi.entity.OrderRulePrice;
import com.online.taxi.entity.OrderRulePriceDetail;
import com.online.taxi.service.ValuationService;
import com.online.taxi.task.ValuationRequestTask;
import com.online.taxi.task.ValuationTask;
import com.online.taxi.util.PriceHelper;
import com.online.taxi.util.UnitConverter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * 计价服务
 *
 * @date 2018/8/14
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class ValuationServiceImpl implements ValuationService {

    @NonNull
    private OrderDao orderDao;

    @NonNull
    private PriceCache priceCache;

    @NonNull
    private RuleCache ruleCache;

    @NonNull
    private ValuationRequestTask requestTask;

    @NonNull
    private ValuationTask valuationTask;

    @Override
    public BigDecimal calcForecastPrice(Integer orderId) {
        //设置驾驶参数
        DriveMeter driveMeter = generateDriveMeter(orderId, ChargingCategoryEnum.Forecast);

        Rule rule = driveMeter.getRule();
        PriceMeter priceMeter = priceCache.get(orderId);
        if (priceMeter == null || rule == null || !ObjectUtils.nullSafeEquals(rule.getId(), priceMeter.getRuleId())) {
            //计算价格
            priceMeter = generatePriceMeter(driveMeter);
        }

        //更新缓存
        priceMeter.setTagPrices(rule != null ? rule.getTagPrices() : null);

        //计算标签价格
        BigDecimal totalPrice = PriceHelper.add(priceMeter.getBasicPriceValue(), valuationTask.calcTagPrice(driveMeter));
        priceMeter.setTotalPriceValue(totalPrice);

        //缓存结果
        priceCache.set(orderId, priceMeter, 1, TimeUnit.HOURS);

        //TODO
        doneForecast(orderId);

        //返回价格
        return totalPrice;
    }

    @Override
    public void doneForecast(Integer orderId) {
        //获取缓存
        PriceMeter priceMeter = priceCache.get(orderId);

        if (priceMeter == null) {
            throw new RuntimeException(ERR_EXPIRE_FORECAST);
        }

        //更新标签价格
        priceMeter.getRulePrice().setTotalPrice(priceMeter.getTotalPriceValue());

        //更新DB
        valuationTask.updateToDb(ChargingCategoryEnum.Forecast, priceMeter);
    }

    @Override
    public ForecastDetail requestForecastDetail(Integer orderId) {
        Rule rule = ruleCache.get(orderId);
        PriceMeter priceMeter = priceCache.get(orderId);

        if (priceMeter == null || rule == null) {
            throw new RuntimeException(ERR_EXPIRE_FORECAST);
        }

        DecimalFormat currencyFmt = new DecimalFormat("0.00");

        ForecastDetail detail = new ForecastDetail();
        detail.setTotalPrice(currencyFmt.format(priceMeter.getTotalPriceValue()));
        detail.setPath("" + priceMeter.getRulePrice().getPath());
        detail.setPathPrice(currencyFmt.format(priceMeter.getRulePrice().getPathPrice()));
        detail.setDuration("" + priceMeter.getRulePrice().getDuration());
        detail.setDurationPrice(currencyFmt.format(priceMeter.getRulePrice().getDurationPrice()));
        detail.setSupplementPrice(currencyFmt.format(priceMeter.getRulePrice().getSupplementPrice()));
        detail.setBeyondDistance("" + priceMeter.getRulePrice().getBeyondDistance());
        detail.setBeyondPrice(currencyFmt.format(priceMeter.getRulePrice().getBeyondPrice()));
        detail.setNightTime("" + priceMeter.getRulePrice().getNightTime());
        detail.setNightDistance("" + priceMeter.getRulePrice().getNightDistance());
        detail.setNightPrice(currencyFmt.format(priceMeter.getRulePrice().getNightPrice()));
        detail.setRestDistance("" + priceMeter.getRulePrice().getRestDistance());
        detail.setRestDistancePrice(currencyFmt.format(priceMeter.getRulePrice().getRestDistance()));
        detail.setRestDuration("" + priceMeter.getRulePrice().getRestDuration());
        detail.setRestDurationPrice(currencyFmt.format(priceMeter.getRulePrice().getRestDurationPrice()));
        detail.setDynamicDiscountRate("" + priceMeter.getRulePrice().getDynamicDiscountRate());
        detail.setBasePrice(currencyFmt.format(priceMeter.getRulePrice().getBasePrice()));

        List<ForecastDetail.PeriodRule> periodRule = Optional.ofNullable(priceMeter.getRulePriceDetails()).orElse(new ArrayList<>()).stream().map(d -> {
            ForecastDetail.PeriodRule r = new ForecastDetail.PeriodRule();
            r.setStartHour("" + d.getStartHour()).setEndHour("" + d.getEndHour());
            r.setDistance("" + d.getDistance()).setDistancePrice(currencyFmt.format(d.getDistancePrice()));
            r.setDuration("" + d.getDuration()).setTimePrice(currencyFmt.format(d.getTimePrice()));
            return r;
        }).collect(Collectors.toList());
        detail.setPeriodRule(periodRule);

        List<ForecastDetail.TagRule> tagRule = Optional.ofNullable(priceMeter.getTagPrices()).orElse(new ArrayList<>()).stream().map(d -> {
            ForecastDetail.TagRule t = new ForecastDetail.TagRule();
            t.setTagName(d.getName()).setTagPrice(currencyFmt.format(d.getPrice()));
            return t;
        }).collect(Collectors.toList());
        detail.setTagRule(tagRule);

        return detail;
    }

    @Override
    public CurrentPriceResponseDto calcCurrentPrice(CurrentPriceRequestDto dto) {
        LocalDateTime start = UnitConverter.dateToLocalDateTime(new Date(dto.getStartTime()));
        LocalDateTime end = UnitConverter.dateToLocalDateTime(new Date(dto.getEndTime()));

        DriveMeter driveMeter = generateDriveMeter(dto.getOrderId(), ChargingCategoryEnum.RealTime);
        driveMeter.setCurrentPriceRequestDto(dto);
        driveMeter.setDistance(requestTask.requestDistance(dto.getCarId(), driveMeter.getRule().getKeyRule().getCityCode(), start, end));

        //获取价格
        PriceMeter priceMeter = generatePriceMeter(driveMeter);

        //计算标签价格
        BigDecimal totalPrice = PriceHelper.add(priceMeter.getBasicPriceValue(), valuationTask.calcTagPrice(driveMeter));
        priceMeter.getRulePrice().setTotalPrice(totalPrice);

        //返回价格
        CurrentPriceResponseDto currentPriceResponseDto = new CurrentPriceResponseDto();
        currentPriceResponseDto.setDistance(driveMeter.getDistance().getDistance()).setPrice(totalPrice);
        return currentPriceResponseDto;
    }

    @Override
    public BigDecimal calcSettlementPrice(Integer orderId) {
        //设置驾驶参数
        DriveMeter driveMeter = generateDriveMeter(orderId, ChargingCategoryEnum.Settlement);

        //获取价格
        PriceMeter priceMeter = generatePriceMeter(driveMeter);

        //计算标签价格
        BigDecimal totalPrice = PriceHelper.add(priceMeter.getBasicPriceValue(), valuationTask.calcTagPrice(driveMeter));
        priceMeter.getRulePrice().setTotalPrice(totalPrice);

        //更新DB
        valuationTask.updateToDb(ChargingCategoryEnum.Settlement, priceMeter);

        //删除缓存
        ruleCache.delete(orderId);
        priceCache.delete(orderId);

        //返回价格
        return priceMeter.getRulePrice().getTotalPrice();
    }

    /**
     * 定义驾驶参数
     *
     * @param orderId          订单ID
     * @param chargingCategory 计价规则种类
     * @return 封装行驶计价相关的请求参数的对象
     */
    @SneakyThrows
    private DriveMeter generateDriveMeter(Integer orderId, ChargingCategoryEnum chargingCategory) {
        Rule rule = requestTask.requestRule(orderId);
        DriveMeter driveMeter = new DriveMeter(chargingCategory);

        switch (chargingCategory) {
            case Forecast:
                driveMeter.setOrder(orderDao.selectByOrderId(orderId)).setRule(rule).setRequestTask(requestTask);
                driveMeter.setRoute(requestTask.requestRoute(driveMeter));
                break;
            case Settlement:
                driveMeter.setOrder(orderDao.selectByOrderId(orderId)).setRule(rule).setRequestTask(requestTask);
                driveMeter.setDistance(requestTask.requestDistance(driveMeter));
                break;
            case RealTime:
                driveMeter.setRule(rule).setRequestTask(requestTask);
                break;
            default:
                break;
        }

        return driveMeter;
    }

    /**
     * 计算价格
     *
     * @param driveMeter 驾驶参数
     * @return 价格
     */
    @SneakyThrows
    private PriceMeter generatePriceMeter(DriveMeter driveMeter) {
        //分段计价任务
        CompletableFuture<List<OrderRulePriceDetail>> calcPriceDetailFuture = valuationTask.calcDetailPrice(driveMeter);

        //基础计价任务
        CompletableFuture<OrderRulePrice> calcPriceFuture = valuationTask.calcMasterPrice(driveMeter);

        //计算最终价格
        BigDecimal price = calcPriceDetailFuture.thenCombine(calcPriceFuture, (details, master) -> {
            //计算其他价格
            valuationTask.calcOtherPrice(driveMeter, master, details);

            //计算价格合计
            BigDecimal totalPrice = PriceHelper.add(master.getBasePrice(), master.getNightPrice(), master.getBeyondPrice(), master.getPathPrice(), master.getDurationPrice());

            //最低消费补足
            master.setSupplementPrice(BigDecimal.ZERO);
            if (totalPrice.compareTo(master.getLowestPrice()) < 0) {
                master.setSupplementPrice(PriceHelper.subtract(master.getLowestPrice(), totalPrice));
                totalPrice = master.getLowestPrice();
            }

            //动态调价
            DiscountPrice discount = valuationTask.calcDiscount(driveMeter);
            master.setDynamicDiscount(BigDecimal.ZERO);
            master.setDynamicDiscountRate(0D);
            if (null != discount) {
                master.setDynamicDiscountRate(discount.getDiscount());
                if (discount.getDiscount() < 0 || discount.getDiscount() > 1) {
                    throw new RuntimeException(ERR_DISCOUNT_RATE_RANGE);
                }
                master.setDynamicDiscount(PriceHelper.min(discount.getDiscountMaxPrice(), BigDecimal.valueOf(1 - discount.getDiscount()).multiply(totalPrice)));
            }

            totalPrice = PriceHelper.subtract(totalPrice, master.getDynamicDiscount());
            master.setTotalPrice(totalPrice);

            return master.getTotalPrice();
        }).join();

        //设置计算结果
        PriceMeter priceMeter = new PriceMeter();
        priceMeter.setRulePrice(calcPriceFuture.join()).setRulePriceDetails(calcPriceDetailFuture.join())
                .setTagPrices(driveMeter.getRule().getTagPrices()).setBasicPriceValue(price).setRuleId(driveMeter.getRule().getId());

        return priceMeter;
    }

}
