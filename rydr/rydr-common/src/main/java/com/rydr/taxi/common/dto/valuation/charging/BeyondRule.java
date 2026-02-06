package com.rydr.taxi.dto.valuation.charging;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Long-distance service fee
 *
 * @date 2018/8/14
 */
@Data
public class BeyondRule {

    /**
     * Long-distance starting kilometer threshold (km)
     */
    private Double startKilo;

    /**
     * Long-distance unit price (yuan/km)
     */
    private BigDecimal perKiloPrice;
}
