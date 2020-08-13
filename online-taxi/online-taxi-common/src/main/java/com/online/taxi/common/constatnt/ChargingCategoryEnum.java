package com.online.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 计价规则种类枚举
 *
 * @author yueyi2019
 * @date 2018/8/14
 */
@Getter
@AllArgsConstructor
public enum ChargingCategoryEnum implements CodeEnum {

    /**
     * 预估订单: 0
     */
    Forecast(0, "预约"),

    /**
     * 结算订单: 1
     */
    Settlement(1, "结算"),

    /**
     * 实时订单: 2
     */
    RealTime(2, "实时");

    private int code;
    private String name;
}
