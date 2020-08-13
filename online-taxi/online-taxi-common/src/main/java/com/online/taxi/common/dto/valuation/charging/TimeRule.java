package com.online.taxi.dto.valuation.charging;

import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * 分段计时规则
 *
 * @date 2018/8/14
 */
@Data
@Accessors(chain = true)
public class TimeRule {

    /**
     * 计费时间段 - 开始时间点
     */
    private Integer start;

    /**
     * 计费时间段 - 结束时间点
     */
    private Integer end;

    /**
     * 超公里单价（元/公里）
     */
    private BigDecimal perKiloPrice;

    /**
     * 超时间单价（元/分钟）
     */
    private BigDecimal perMinutePrice;
}
