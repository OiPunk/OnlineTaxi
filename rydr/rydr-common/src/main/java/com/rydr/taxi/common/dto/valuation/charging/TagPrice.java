package com.rydr.taxi.dto.valuation.charging;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Tag fee
 *
 * @date 2018/10/16
 */
@Data
public class TagPrice {
    /**
     * Tag name
     */
    private String name;

    /**
     * Tag fee
     */
    private BigDecimal price;
}
