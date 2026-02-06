package com.rydr.taxi.dto.valuation.charging;

import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * Time-segmented billing rule
 *
 * @date 2018/8/14
 */
@Data
@Accessors(chain = true)
public class TimeRule {

    /**
     * Billing time period - start time point
     */
    private Integer start;

    /**
     * Billing time period - end time point
     */
    private Integer end;

    /**
     * Extra distance unit price (yuan/km)
     */
    private BigDecimal perKiloPrice;

    /**
     * Extra time unit price (yuan/minute)
     */
    private BigDecimal perMinutePrice;
}
