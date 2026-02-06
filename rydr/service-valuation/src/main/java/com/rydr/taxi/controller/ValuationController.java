package com.rydr.taxi.controller;

import com.rydr.taxi.constatnt.BusinessInterfaceStatus;
import com.rydr.taxi.dto.ForecastDetail;
import com.rydr.taxi.dto.ResponseResult;
import com.rydr.taxi.dto.request.CurrentPriceRequestDto;
import com.rydr.taxi.dto.response.CurrentPriceResponseDto;
import com.rydr.taxi.dto.valuation.PriceResult;
import com.rydr.taxi.service.ValuationService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Optional;

/**
 * Valuation rule controller
 *
 * @date 2018/8/14
 */
@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/valuation")
public class ValuationController {

    private static final String ERR_CALC_FORECAST_PRICE = "Error calculating order forecast price";
    private static final String ERR_DONE_FORECAST = "Error finishing order forecast";
    private static final String ERR_CALC_CURRENT_PRICE = "Error calculating order price";
    private static final String ERR_CALC_SETTLEMENT_PRICE = "Error calculating order settlement price";

    @NonNull
    private ValuationService valuationService;

    /**
     * Calculate order forecast price
     *
     * @param orderId order ID
     * @return forecast price
     */
    @GetMapping("/forecast/{orderId}")
    public ResponseResult forecast(@PathVariable(value = "orderId") Integer orderId) {
        BigDecimal price;
        try {
            price = valuationService.calcForecastPrice(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("{}: orderId={}", ERR_CALC_FORECAST_PRICE, orderId, e);
            return ResponseResult.fail(BusinessInterfaceStatus.FAIL.getCode(), ERR_CALC_FORECAST_PRICE);
        }

        return ResponseResult.success(new PriceResult(Optional.ofNullable(price).orElse(BigDecimal.ZERO).doubleValue()));
    }

    /**
     * Finish forecast and write to database
     *
     * @param orderId order ID
     * @return ResponseResult instance
     */
    @GetMapping("/forecast/done/{orderId}")
    public ResponseResult forecastDone(@PathVariable(value = "orderId") Integer orderId) {
        try {
            valuationService.doneForecast(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("{}: orderId={}", ERR_DONE_FORECAST, orderId, e);
            return ResponseResult.fail(BusinessInterfaceStatus.FAIL.getCode(), ERR_DONE_FORECAST);
        }

        return ResponseResult.success();
    }

    @GetMapping("/forecast/detail/{orderId}")
    public ResponseResult forecastDetail(@PathVariable(value = "orderId") Integer orderId) {
        ForecastDetail detail;
        try {
            detail = valuationService.requestForecastDetail(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("{}: orderId={}", ERR_DONE_FORECAST, orderId, e);
            return ResponseResult.fail(BusinessInterfaceStatus.FAIL.getCode(), ERR_DONE_FORECAST);
        }

        return ResponseResult.success(detail);
    }

    @GetMapping("/current_price")
    public ResponseResult calculateCurrentPrice(CurrentPriceRequestDto dto) {
        CurrentPriceResponseDto result;
        try {
            result = valuationService.calcCurrentPrice(dto);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("{}: orderId={}", ERR_CALC_CURRENT_PRICE, dto.getOrderId(), e);
            return ResponseResult.fail(BusinessInterfaceStatus.FAIL.getCode(), ERR_CALC_CURRENT_PRICE);
        }

        return ResponseResult.success(result);
    }

    /**
     * Calculate order settlement price
     *
     * @param orderId order ID
     * @return settlement price
     */
    @GetMapping("/settlement/{orderId}")
    public ResponseResult settlement(@PathVariable(value = "orderId") Integer orderId) {
        BigDecimal price;
        try {
            price = valuationService.calcSettlementPrice(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("{}: orderId={}", ERR_CALC_SETTLEMENT_PRICE, orderId, e);
            return ResponseResult.fail(BusinessInterfaceStatus.FAIL.getCode(), ERR_CALC_SETTLEMENT_PRICE);
        }

        return ResponseResult.success(new PriceResult(Optional.ofNullable(price).orElse(BigDecimal.ZERO).doubleValue()));
    }

}
