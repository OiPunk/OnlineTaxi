package com.online.taxi.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.order.service.GrabService;
import com.online.taxi.order.service.OrderService;

@Service("grabNoLockService")
public class GrabNoLockServiceImpl implements GrabService {

	@Autowired
	OrderService orderService;

	@Override
	public ResponseResult grabOrder(int orderId, int driverId) {

		try {
			System.out.println("Driver:"+driverId+" executing order grab logic");

            boolean b = orderService.grab(orderId, driverId);
            if(b) {
            	System.out.println("Driver:"+driverId+" grabbed order successfully");
            }else {
            	System.out.println("Driver:"+driverId+" failed to grab order");
            }

        } finally {


        }

		return null;
	}

}
