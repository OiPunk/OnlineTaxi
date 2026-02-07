package com.rydr.order.service;

import com.rydr.dto.ResponseResult;

/**
 * @author oi
 */
public interface GrabService {

    /**
     * Driver grabs an order
     * @param orderId
     * @param driverId
     * @return
     */
    public ResponseResult grabOrder(int orderId , int driverId);
}
