package com.rydr.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rydr.dto.ResponseResult;
import com.rydr.order.service.GrabService;
import com.rydr.order.service.OrderService;

@Service("grabJvmLockService")
public class GrabJvmLockServiceImpl implements GrabService {

	@Autowired
	OrderService orderService;

	@Override
	public ResponseResult grabOrder(int orderId, int driverId) {
		String lock = (orderId+"");

		synchronized (lock.intern()) {
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
		}


		return null;
	}

}
