package com.online.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Identity type
 *
 * @author yueyi2019
 */
@Getter
@AllArgsConstructor
public enum IdentityEnum implements CodeEnum {

    /**
     * Passenger
     */
    PASSENGER(1, "Passenger"),

    /**
     * Driver
     */
    DRIVER(2, "Driver"),

    /**
     * Car screen
     */
    CAR_SCREEN(3, "Car screen"),

    /**
     * Large screen
     */
    LARGE_SCREEN(4, "Large screen"),

    /**
     *
     */
    OTHER(9, "Other identity");

    private final int code;
    private final String value;
}
