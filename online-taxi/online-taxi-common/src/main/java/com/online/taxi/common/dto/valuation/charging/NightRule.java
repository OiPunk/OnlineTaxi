package com.online.taxi.dto.valuation.charging;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Night service fee
 *
 * @date 2018/8/14
 */
@Data
public class NightRule {

    /**
     * Night time period - start
     */
    private Date start;

    /**
     * Night time period - end
     */
    private Date end;

    /**
     * Extra distance surcharge unit price (yuan/km)
     */
    private BigDecimal perKiloPrice;

    /**
     * Extra time surcharge unit price (yuan/minute)
     */
    private BigDecimal perMinutePrice;
}
