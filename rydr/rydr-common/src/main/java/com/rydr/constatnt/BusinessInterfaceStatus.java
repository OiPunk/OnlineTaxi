package com.rydr.constatnt;

import lombok.Getter;

/**
 * @author yueyi2019
 */
@Getter
public enum BusinessInterfaceStatus implements CodeEnum {

    /**
     * Operation successful
     */
    SUCCESS(0, "success"),

    /**
     * Operation failed
     */
    FAIL(1, "fail");

    private final int code;
    private final String value;

    BusinessInterfaceStatus(int code, String value) {
        this.code = code;
        this.value = value;
    }
}
