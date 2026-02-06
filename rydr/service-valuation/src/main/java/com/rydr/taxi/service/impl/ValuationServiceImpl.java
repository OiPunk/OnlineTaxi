package com.rydr.taxi.service.impl;

import com.rydr.taxi.constatnt.ChargingCategoryEnum;
import com.rydr.taxi.dao.OrderDao;
import com.rydr.taxi.dao.cache.PriceCache;
import com.rydr.taxi.dao.cache.RuleCache;
import com.rydr.taxi.dto.DriveMeter;
import com.rydr.taxi.dto.ForecastDetail;
import com.rydr.taxi.dto.PriceMeter;
import com.rydr.taxi.dto.request.CurrentPriceRequestDto;
import com.rydr.taxi.dto.response.CurrentPriceResponseDto;
import com.rydr.taxi.dto.valuation.charging.Rule;
import com.rydr.taxi.dto.valuation.discount.DiscountPrice;
import com.rydr.taxi.entity.OrderRulePrice;
import com.rydr.taxi.entity.OrderRulePriceDetail;
import com.rydr.taxi.service.ValuationService;
import com.rydr.taxi.task.ValuationRequestTask;
import com.rydr.taxi.task.ValuationTask;
import com.rydr.taxi.util.PriceHelper;
import com.rydr.taxi.util.UnitConverter;
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
 * Valuation service
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
        // Set driving parameters
        DriveMeter driveMeter = generateDriveMeter(orderId, ChargingCategoryEnum.Forecast);

        Rule rule = driveMeter.getRule();
        PriceMeter priceMeter = priceCache.get(orderId);
        if (priceMeter == null || rule == null || !ObjectUtils.nullSafeEquals(rule.getId(), priceMeter.getRuleId())) {
            // Calculate price
            priceMeter = generatePriceMeter(driveMeter);
        }

        // Update cache
        priceMeter.setTagPrices(rule != null ? rule.getTagPrices() : null);

        // Calculate tag price
        BigDecimal totalPrice = PriceHelper.add(priceMeter.getBasicPriceValue(), valuationTask.calcTagPrice(driveMeter));
        priceMeter.setTotalPriceValue(totalPrice);

        // Cache result
        priceCache.set(orderId, priceMeter, 1, TimeUnit.HOURS);

        //TODO
        doneForecast(orderId);

        // Return price
        return totalPrice;
    }

    @Override
    public void doneForecast(Integer orderId) {
        // Get cache
        PriceMeter priceMeter = priceCache.get(orderId);

        if (priceMeter == null) {
            throw new RuntimeException(ERR_EXPIRE_FORECAST);
        }

        // Update tag price
        priceMeter.getRulePrice().setTotalPrice(priceMeter.getTotalPriceValue());

        // Update DB
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

        // Get price
        PriceMeter priceMeter = generatePriceMeter(driveMeter);

        // Calculate tag price
        BigDecimal totalPrice = PriceHelper.add(priceMeter.getBasicPriceValue(), valuationTask.calcTagPrice(driveMeter));
        priceMeter.getRulePrice().setTotalPrice(totalPrice);

        // Return price
        CurrentPriceResponseDto currentPriceResponseDto = new CurrentPriceResponseDto();
        currentPriceResponseDto.setDistance(driveMeter.getDistance().getDistance()).setPrice(totalPrice);
        return currentPriceResponseDto;
    }

    @Override
    public BigDecimal calcSettlementPrice(Integer orderId) {
        // Set driving parameters
        DriveMeter driveMeter = generateDriveMeter(orderId, ChargingCategoryEnum.Settlement);

        // Get price
        PriceMeter priceMeter = generatePriceMeter(driveMeter);

        // Calculate tag price
        BigDecimal totalPrice = PriceHelper.add(priceMeter.getBasicPriceValue(), valuationTask.calcTagPrice(driveMeter));
        priceMeter.getRulePrice().setTotalPrice(totalPrice);

        // Update DB
        valuationTask.updateToDb(ChargingCategoryEnum.Settlement, priceMeter);

        // Delete cache
        ruleCache.delete(orderId);
        priceCache.delete(orderId);

        // Return price
        return priceMeter.getRulePrice().getTotalPrice();
    }

    /**
     * Define driving parameters
     *
     * @param orderId          order ID
     * @param chargingCategory charging rule category
     * @return object encapsulating driving valuation related request parameters
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
     * Calculate price
     *
     * @param driveMeter driving parameters
     * @return price
     */
    @SneakyThrows
    private PriceMeter generatePriceMeter(DriveMeter driveMeter) {
        // Segmented pricing task
        CompletableFuture<List<OrderRulePriceDetail>> calcPriceDetailFuture = valuationTask.calcDetailPrice(driveMeter);

        // Base pricing task
        CompletableFuture<OrderRulePrice> calcPriceFuture = valuationTask.calcMasterPrice(driveMeter);

        // Calculate final price
        BigDecimal price = calcPriceDetailFuture.thenCombine(calcPriceFuture, (details, master) -> {
            // Calculate other prices
            valuationTask.calcOtherPrice(driveMeter, master, details);

            // Calculate total price
            BigDecimal totalPrice = PriceHelper.add(master.getBasePrice(), master.getNightPrice(), master.getBeyondPrice(), master.getPathPrice(), master.getDurationPrice());

            // Minimum fare supplement
            master.setSupplementPrice(BigDecimal.ZERO);
            if (totalPrice.compareTo(master.getLowestPrice()) < 0) {
                master.setSupplementPrice(PriceHelper.subtract(master.getLowestPrice(), totalPrice));
                totalPrice = master.getLowestPrice();
            }

            // Dynamic pricing adjustment
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

        // Set calculation result
        PriceMeter priceMeter = new PriceMeter();
        priceMeter.setRulePrice(calcPriceFuture.join()).setRulePriceDetails(calcPriceDetailFuture.join())
                .setTagPrices(driveMeter.getRule().getTagPrices()).setBasicPriceValue(price).setRuleId(driveMeter.getRule().getId());

        return priceMeter;
    }

}
