package com.online.taxi.controller;

import com.online.taxi.constatnt.BusinessInterfaceStatus;
import com.online.taxi.dto.ForecastDetail;
import com.online.taxi.dto.ResponseResult;
import com.online.taxi.dto.request.CurrentPriceRequestDto;
import com.online.taxi.dto.response.CurrentPriceResponseDto;
import com.online.taxi.dto.valuation.PriceResult;
import com.online.taxi.service.ValuationService;
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
 * 计价规则控制器
 *
 * @date 2018/8/14
 */
@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/valuation")
public class ValuationController {

    private static final String ERR_CALC_FORECAST_PRICE = "订单预估价格计算错误";
    private static final String ERR_DONE_FORECAST = "订单结束预估错误";
    private static final String ERR_CALC_CURRENT_PRICE = "计算订单价格错误";
    private static final String ERR_CALC_SETTLEMENT_PRICE = "订单结算价格计算错误";

    @NonNull
    private ValuationService valuationService;

    /**
     * 订单预估价格计算
     *
     * @param orderId 订单ID
     * @return 预估价格
     */
    @GetMapping("/forecast/{orderId}")
    public ResponseResult forecast(@PathVariable(value = "orderId") Integer orderId) {
        BigDecimal price;
        try {
            price = valuationService.calcForecastPrice(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("{}：orderId={}", ERR_CALC_FORECAST_PRICE, orderId, e);
            return ResponseResult.fail(BusinessInterfaceStatus.FAIL.getCode(), ERR_CALC_FORECAST_PRICE);
        }

        return ResponseResult.success(new PriceResult(Optional.ofNullable(price).orElse(BigDecimal.ZERO).doubleValue()));
    }

    /**
     * 结束预估，写入数据库
     *
     * @param orderId 订单ID
     * @return ResponseResult实例
     */
    @GetMapping("/forecast/done/{orderId}")
    public ResponseResult forecastDone(@PathVariable(value = "orderId") Integer orderId) {
        try {
            valuationService.doneForecast(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("{}：orderId={}", ERR_DONE_FORECAST, orderId, e);
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
            log.error("{}：orderId={}", ERR_DONE_FORECAST, orderId, e);
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
            log.error("{}：orderId={}", ERR_CALC_CURRENT_PRICE, dto.getOrderId(), e);
            return ResponseResult.fail(BusinessInterfaceStatus.FAIL.getCode(), ERR_CALC_CURRENT_PRICE);
        }

        return ResponseResult.success(result);
    }

    /**
     * 订单结算价格计算
     *
     * @param orderId 订单ID
     * @return 结算价格
     */
    @GetMapping("/settlement/{orderId}")
    public ResponseResult settlement(@PathVariable(value = "orderId") Integer orderId) {
        BigDecimal price;
        try {
            price = valuationService.calcSettlementPrice(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("{}：orderId={}", ERR_CALC_SETTLEMENT_PRICE, orderId, e);
            return ResponseResult.fail(BusinessInterfaceStatus.FAIL.getCode(), ERR_CALC_SETTLEMENT_PRICE);
        }

        return ResponseResult.success(new PriceResult(Optional.ofNullable(price).orElse(BigDecimal.ZERO).doubleValue()));
    }

}
