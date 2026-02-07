package com.rydr.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Order service type
 * @author yueyi2019
 * @date 2018/10/22
 */
@Getter
@AllArgsConstructor
public enum OrderServiceTypeEnum implements CodeEnum  {

    /**
     * Real-time order
     */
    REAL_TIME(1,"Real-time order"),

    /**
     * Reservation order
     */
    MAKE_AN_APPOINTMENT(2,"Reservation order"),

    /**
     * Airport pickup
     */
    PICK_UP(3,"Airport pickup"),

    /**
     * Airport drop-off
     */
    SEND_MACHINE(4,"Airport drop-off"),

    /**
     * Half-day rental
     */
    CHARTERED_CAR(5,"Half-day rental"),
    /**
     * Full-day rental
     */
    THROUGHOUT_THE_DAY(6,"Full-day rental");

    private int code;
    private String value;
}
