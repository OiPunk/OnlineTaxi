package com.rydr.dto;

import com.rydr.dto.valuation.charging.TagPrice;
import com.rydr.entity.OrderRulePrice;
import com.rydr.entity.OrderRulePriceDetail;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.List;

/**
 * Price collection class
 *
 * @date 2018/10/18
 */
@Data
@Accessors(chain = true)
public class PriceMeter {

    /**
     * Rule ID
     */
    private Integer ruleId;

    /**
     * Charging detail
     */
    private OrderRulePrice rulePrice;

    /**
     * Segmented time-based charging detail
     */
    private List<OrderRulePriceDetail> rulePriceDetails;

    /**
     * Tag charging detail
     */
    private List<TagPrice> tagPrices;

    /**
     * Charging detail + segmented time-based charging detail
     */
    private BigDecimal basicPriceValue;

    /**
     * Charging detail + segmented time-based charging detail + tag charging detail
     */
    private BigDecimal totalPriceValue;

}
