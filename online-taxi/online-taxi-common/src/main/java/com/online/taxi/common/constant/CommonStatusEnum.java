package com.online.taxi.common.constant;

import lombok.Getter;

/**
 * @author oi
 */
public enum CommonStatusEnum {

	/** SMS verification code service 10001-10099 */
	VERIFY_CODE_ERROR(10001,"SMS verification code validation failed"),

    /**
     * Same incorrect verification code entered 3 times within one minute, please try again after 1 minute
     */
    VERIFICATION_ONE_MIN_ERROR(10002,"You have entered the same incorrect verification code too many times, please try again after 1 minute"),
    /**
     * Verification code errors reached 3 times within one hour, please try again after 10 minutes
     */
    VERIFICATION_TEN_MIN_ERROR(10003,"You have failed to log in too many times, please try again after 10 minutes"),
    /**
     * Verification code errors reached 5 times within one hour, please try again after 24 hours
     */
    VERIFICATION_ONE_HOUR_ERROR(10004,"You have failed to log in too many times today, please try again after 24 hours"),


	/** api-passenger Passenger API 10101-10199 */
	PHONENUMBER_EMPTY(10101,"Phone number is empty"),
	PHONENUMBER_ERROR(10102,"Phone number format is incorrect"),


	/**
     * 	Operation successful
     */
    SUCCESS(1, "success"),

    /**
     * 	Operation exception
     */
    INTERNAL_SERVER_EXCEPTION(0, "exception"),

    /**
     * 	Operation failed
     */
    FAIL(0, "fail");

	@Getter
	private final int code;

	@Getter
    private final String value;

    private CommonStatusEnum(int code, String value) {
        this.code = code;
        this.value = value;
    }

}
