package com.rydr.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rydr.dto.ResponseResult;
import com.rydr.common.entity.OrderLock;
import com.rydr.order.lock.MysqlLock;
import com.rydr.order.service.GrabService;
import com.rydr.order.service.OrderService;

/**
 * @author oi
 */
@Service("grabMysqlLockService")
public class GrabMysqlLockServiceImpl implements GrabService {

	@Autowired
	private MysqlLock lock;

	@Autowired
	OrderService orderService;

	ThreadLocal<OrderLock> orderLock = new ThreadLocal<>();

    @Override
    public ResponseResult grabOrder(int orderId , int driverId){
        //generate key
        OrderLock ol = new OrderLock();
        ol.setOrderId(orderId);
        ol.setDriverId(driverId);

        orderLock.set(ol);
        lock.setOrderLockThreadLocal(orderLock);
        lock.lock();
//        System.out.println("Driver "+driverId+" locked successfully");

        try {
			System.out.println("Driver:"+driverId+" executing order grab logic");

            boolean b = orderService.grab(orderId, driverId);
            if(b) {
            	System.out.println("Driver:"+driverId+" grabbed order successfully");
            }else {
            	System.out.println("Driver:"+driverId+" failed to grab order");
            }

        } finally {

            lock.unlock();
        }

        return null;
    }
}
