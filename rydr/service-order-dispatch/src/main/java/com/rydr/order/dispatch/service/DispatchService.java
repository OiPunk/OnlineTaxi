package com.rydr.order.dispatch.service;

import com.rydr.dto.ResponseResult;

import java.util.List;

/**
 * @author oi
 */
public interface DispatchService {

    /**
     * Dispatch a specified order to multiple drivers
     * @param orderId
     * @param driverIdList
     * @return
     */
    public ResponseResult dispatch(int orderId , List<Integer> driverIdList);
}
