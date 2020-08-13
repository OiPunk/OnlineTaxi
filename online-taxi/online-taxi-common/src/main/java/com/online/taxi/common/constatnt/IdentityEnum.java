package com.online.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 身份类型
 *
 * @author yueyi2019
 */
@Getter
@AllArgsConstructor
public enum IdentityEnum implements CodeEnum {

    /**
     * 乘客
     */
    PASSENGER(1, "乘客"),

    /**
     * 司机
     */
    DRIVER(2, "司机"),

    /**
     * 车机
     */
    CAR_SCREEN(3, "车机"),

    /**
     * 大屏
     */
    LARGE_SCREEN(4, "大屏"),

    /**
     *
     */
    OTHER(9, "其他身份");

    private final int code;
    private final String value;
}
