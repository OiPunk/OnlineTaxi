package com.online.taxi.dto.valuation.discount;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 动态调价
 *
 * @date 2018/8/20
 */
@Data
public class DiscountPrice {

    private BigDecimal discountMaxPrice;
    private Double discount;
}
