package com.rydr.dto.response;

import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * Real-time price DTO
 *
 * @date 2018/11/1
 */
@Data
@Accessors(chain = true)
public class CurrentPriceResponseDto {
    /**
     * Travel distance (unit: meters)
     */
    private double distance;

    /**
     * Price
     */
    private BigDecimal price;
}
