package com.rydr.taxi.order.service;

import com.rydr.taxi.common.dto.ResponseResult;

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
