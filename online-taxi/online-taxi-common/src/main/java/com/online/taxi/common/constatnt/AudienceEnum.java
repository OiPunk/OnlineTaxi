package com.online.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 监听消息听众类型
 * @author yueyi2019
 */
@Getter
@AllArgsConstructor
public enum AudienceEnum implements CodeEnum {
    /**
     * 别名
     */
    ALIAS(1, "别名"),

    /**
     * 注册Id
     */
    REGISTRATION_ID(2, "注册Id"),

    /**
     * 其他
     */
    OTHER(9, "其他");

    private final int code;
    private final String value;
}
