package com.online.taxi.constant;

import lombok.Getter;
/**
 * @author oi
 */
public enum SmsStatusEnum {

	/**
     * Operation successful
     */
    SEND_SUCCESS(0, "sms send success"),

    /**
     * Operation exception
     */
    INTERNAL_SERVER_EXCEPTION(-1, "exception"),

    /**
     * Operation failed
     */
    SEND_FAIL(1, "sms send fail");

	@Getter
	private final int code;

	@Getter
    private final String value;

    private SmsStatusEnum(int code, String value) {
        this.code = code;
        this.value = value;
    }

}
