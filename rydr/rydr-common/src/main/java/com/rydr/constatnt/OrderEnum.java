package com.rydr.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author yueyi2019
 * Order status
 */
@Getter
@AllArgsConstructor
public enum OrderEnum implements CodeEnum {

    /**
     * Trip exceeds 260 km, please contact customer service if you need a ride
     */
    TOO_FAR_AWAY(501, "Your trip exceeds 260 km, please contact customer service if you need a ride"), /**
     * Trip is too short, please confirm your pickup and drop-off addresses
     */
    TOO_CLOSE(502, "Your trip is too short, please confirm your pickup and drop-off addresses"), /**
     * City does not exist
     */
    CITIES_DON_EXIST(503, "This city does not exist"), /**
     * City is not enabled
     */
    CITIES_IS_NOT_ENABLED(504, "This city is not enabled"),

    /**
     * Service type does not exist
     */
    SERVICE_TYPE_IS_NO(505, "Service type does not exist"), /**
     * Service type is not enabled
     */
    SERVICE_TYPE_IS_NOT_ENABLED(506, "This service type is not enabled"),

    /**
     * Channel does not exist
     */
    CHANNEL_IS_NO(507, "This channel does not exist"),

    /**
     * Channel is not enabled
     */
    CHANNEL_IS_NOT_ENABLED(508, "This channel is not enabled"),

    /**
     * Vehicle level does not exist
     */
    CAR_LEVEL_IS_NO(509, "Vehicle level does not exist"), /**
     * This vehicle level is not enabled
     */
    CAR_LEVEL_IS_NOT_ENABLED(510, "This vehicle level is not enabled"),

    /**
     * Order for another person
     */
    ORDER_TYPE_OTHER(2, "Order for another person"),

    /**
     * Order cancelled
     */
    IS_CANCEL(1, "Order cancelled"),

    /**
     * Paid
     */
    IS_PAY(1, "Paid"), /**
     * Unpaid
     */
    NOT_PAY(0, "Unpaid"),

    /**
     * Reviewed
     */
    IS_EVALUATE(1, "Reviewed"), /**
     * Not reviewed
     */
    NOT_EVALUATE(0, "Not reviewed"),

    /**
     * Manual dispatch, originally no driver assigned
     */
    ORDER_IS_MANUAL_FLAG1(1, "Manual dispatch, originally no driver assigned"),

    /**
     * Real-time order
     */
    SERVICE_TYPE(1,"Real-time order"),

    /**
     * Order reassigned, originally had a driver
     */
    ORDER_IS_MANUAL_FLAG2(2, "Order reassigned, originally had a driver");

    private int code;
    private String value;
}
