package com.rydr.dto.valuation.charging;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.util.ObjectUtils;

import java.math.BigDecimal;

/**
 * Basic charging
 *
 * @date 2018/8/14
 */
@Data
public class BasicRule {
    /**
     * Minimum price
     */
    private BigDecimal lowestPrice;

    /**
     * Base price
     */
    private BigDecimal basePrice;

    /**
     * Included distance (km)
     */
    private Double kilos;

    /**
     * Included duration (minutes)
     */
    private Double minutes;

    /**
     * Whether to use the basic package charging rule
     *
     * @return true if using the basic package charging rule, false otherwise
     */
    @JsonIgnore
    public boolean isBasicCharging() {
        return !(ObjectUtils.nullSafeEquals(kilos, 0D) && ObjectUtils.nullSafeEquals(minutes, 0D));
    }
}
