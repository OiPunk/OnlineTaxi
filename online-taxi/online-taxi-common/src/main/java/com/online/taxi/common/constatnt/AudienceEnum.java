package com.online.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Message listener audience type
 * @author yueyi2019
 */
@Getter
@AllArgsConstructor
public enum AudienceEnum implements CodeEnum {
    /**
     * Alias
     */
    ALIAS(1, "Alias"),

    /**
     * Registration Id
     */
    REGISTRATION_ID(2, "Registration Id"),

    /**
     * Other
     */
    OTHER(9, "Other");

    private final int code;
    private final String value;
}
