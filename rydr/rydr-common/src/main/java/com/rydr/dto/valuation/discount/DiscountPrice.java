package com.rydr.dto.valuation.discount;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Dynamic price adjustment
 *
 * @date 2018/8/20
 */
@Data
public class DiscountPrice {

    private BigDecimal discountMaxPrice;
    private Double discount;
}
