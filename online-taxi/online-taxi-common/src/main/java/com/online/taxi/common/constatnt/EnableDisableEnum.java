package com.online.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 功能描述
 *
 * @author yueyi2019
 * @date 2018/8/31
 */
@Getter
@AllArgsConstructor
public enum EnableDisableEnum implements CodeEnum {

    ENABLE(0,"未启用"),
    DISABLE(1, "启用");
    private int code;
    private String value;
}
