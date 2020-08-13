package com.online.taxi.dto.valuation.charging;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 计费方法
 *
 * @date 2018/8/14
 */
@Data
public class PriceRule {

    /**
     * 超公里单价（元/公里）
     */
    private BigDecimal perKiloPrice;

    /**
     * 超时间单价（元/分钟）
     */
    private BigDecimal perMinutePrice;

    /**
     * 分段计时规则
     */
    private List<TimeRule> timeRules;
}
