package com.rydr.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Charging rule category enum
 *
 * @author yueyi2019
 * @date 2018/8/14
 */
@Getter
@AllArgsConstructor
public enum ChargingCategoryEnum implements CodeEnum {

    /**
     * Estimated order: 0
     */
    Forecast(0, "Reservation"),

    /**
     * Settlement order: 1
     */
    Settlement(1, "Settlement"),

    /**
     * Real-time order: 2
     */
    RealTime(2, "Real-time");

    private int code;
    private String name;
}
