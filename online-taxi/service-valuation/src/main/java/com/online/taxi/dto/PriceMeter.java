package com.online.taxi.dto;

import com.online.taxi.dto.valuation.charging.TagPrice;
import com.online.taxi.entity.OrderRulePrice;
import com.online.taxi.entity.OrderRulePriceDetail;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.List;

/**
 * 价格集合类
 *
 * @date 2018/10/18
 */
@Data
@Accessors(chain = true)
public class PriceMeter {

    /**
     * 规则ID
     */
    private Integer ruleId;

    /**
     * 计费明细
     */
    private OrderRulePrice rulePrice;

    /**
     * 分段计时计费明细
     */
    private List<OrderRulePriceDetail> rulePriceDetails;

    /**
     * 标签计费明细
     */
    private List<TagPrice> tagPrices;

    /**
     * 计费明细+分段计时计费明细
     */
    private BigDecimal basicPriceValue;

    /**
     * 计费明细+分段计时计费明细+标签计费明细
     */
    private BigDecimal totalPriceValue;

}
