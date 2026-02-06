package com.rydr.taxi.service;

import com.rydr.taxi.dto.ForecastDetail;
import com.rydr.taxi.dto.request.CurrentPriceRequestDto;
import com.rydr.taxi.dto.response.CurrentPriceResponseDto;

import java.math.BigDecimal;

/**
 * Valuation service
 *
 * @date 2018/8/14
 */
public interface ValuationService {

    String ERR_DISCOUNT_RATE_RANGE = "Dynamic pricing discount value is not within the 0-1 range";
    String ERR_EXPIRE_FORECAST = "Forecast has exceeded the validity period";

    /**
     * Calculate forecast price
     *
     * @param orderId order ID
     * @return forecast price
     */
    BigDecimal calcForecastPrice(Integer orderId);

    /**
     * Finish forecast and write to database
     *
     * @param orderId order ID
     */
    void doneForecast(Integer orderId);

    /**
     * Request forecast details
     *
     * @param orderId order ID
     * @return forecast detail DTO
     */
    ForecastDetail requestForecastDetail(Integer orderId);

    /**
     * Request to calculate current price
     *
     * @param dto current price request DTO
     * @return order price
     */
    CurrentPriceResponseDto calcCurrentPrice(CurrentPriceRequestDto dto);

    /**
     * Settle order price
     *
     * @param orderId order ID
     * @return price
     */
    BigDecimal calcSettlementPrice(Integer orderId);
}
