package com.rydr.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Feature description
 *
 * @author yueyi2019
 * @date 2018/9/1
 */
@Getter
@AllArgsConstructor
public enum OrderStatusEnum implements CodeEnum  {
    /**
     * Estimated order
     */
    CALL_ORDER_FORECAST(0,"Estimated order"),
    /**
     * Order started
     */
    STATUS_ORDER_START(1, "Order started"),
    /**
     * Driver accepted order
     */
    STATUS_DRIVER_ACCEPT(2, "Driver accepted order"),
    /**
     * Going to pick up passenger
     */
    STATUS_RESERVED_ORDER_TO_PICK_UP(3, "Going to pick up passenger"),
    /**
     * Driver arrived at passenger pickup point
     */
    STATUS_DRIVER_ARRIVED(4, "Driver arrived at passenger pickup point"),
    /**
     * Passenger boarded, driver started trip
     */
    STATUS_DRIVER_TRAVEL_START(5, "Passenger boarded, driver started trip"),
    /**
     * Arrived at destination, trip ended, unpaid
     */
    STATUS_DRIVER_TRAVEL_END(6, "Arrived at destination, trip ended, unpaid"),
    /**
     * Payment initiated
     */
    STATUS_PAY_START(7, "Payment initiated"),
    /**
     * Payment completed
     */
    STATUS_PAY_END(8, "Payment completed");

    private int code;
    private String value;
}
