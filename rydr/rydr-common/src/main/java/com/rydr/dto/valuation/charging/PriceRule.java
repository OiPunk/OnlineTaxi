package com.rydr.dto.valuation.charging;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Pricing method
 *
 * @date 2018/8/14
 */
@Data
public class PriceRule {

    /**
     * Extra distance unit price (yuan/km)
     */
    private BigDecimal perKiloPrice;

    /**
     * Extra time unit price (yuan/minute)
     */
    private BigDecimal perMinutePrice;

    /**
     * Time-segmented billing rules
     */
    private List<TimeRule> timeRules;
}
