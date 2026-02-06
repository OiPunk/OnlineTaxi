package com.online.taxi.order.dispatch.service;

import com.online.taxi.common.dto.ResponseResult;

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
