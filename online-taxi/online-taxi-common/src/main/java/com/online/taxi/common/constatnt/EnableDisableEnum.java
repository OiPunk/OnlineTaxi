package com.online.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Feature description
 *
 * @author yueyi2019
 * @date 2018/8/31
 */
@Getter
@AllArgsConstructor
public enum EnableDisableEnum implements CodeEnum {

    ENABLE(0,"Disabled"),
    DISABLE(1, "Enabled");
    private int code;
    private String value;
}
