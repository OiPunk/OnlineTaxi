package com.rydr.dto.valuation.charging;

import lombok.Data;

import java.util.List;

/**
 * Charging rule
 *
 * @date 2018/8/14
 */
@Data
public class Rule {

    /**
     * Primary key
     */
    private Integer id;

    /**
     * Charging rule key class
     */
    private KeyRule keyRule;

    /**
     * Basic charging
     */
    private BasicRule basicRule;

    /**
     * Pricing method
     */
    private PriceRule priceRule;

    /**
     * Long-distance service fee
     */
    private BeyondRule beyondRule;

    /**
     * Night service fee
     */
    private NightRule nightRule;

    /**
     * Tag fees
     */
    private List<TagPrice> tagPrices;

}
