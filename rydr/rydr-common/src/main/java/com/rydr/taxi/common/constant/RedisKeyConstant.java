package com.rydr.taxi.common.constant;

/**
 * @author oi
 */
public class RedisKeyConstant {

    /**
     * Order grabbing lock key prefix
     */
    public static final String GRAB_LOCK_ORDER_KEY_PRE = "lock_";

    /**
     * Driver order grabbing prefix
     */
    public static final String DRIVER_LISTEN_ORDER_PRE = "driver_order_list_";
}
