package com.rydr.taxi.order.service.impl;

import java.util.concurrent.TimeUnit;

import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.common.entity.OrderLock;
import com.rydr.taxi.order.lock.MysqlLock;
import com.rydr.taxi.order.lock.RedisLock;
import com.rydr.taxi.order.service.GrabService;
import com.rydr.taxi.order.service.OrderService;

/**
 * @author oi
 */
@Service("grabRedisRedissonService")
public class GrabRedisRedissonServiceImpl implements GrabService {

	@Autowired
	RedissonClient redissonClient;

	@Autowired
	OrderService orderService;

    @Override
    public ResponseResult grabOrder(int orderId , int driverId){
        //generate key
    	String lock = "order_"+(orderId+"");

    	RLock rlock = redissonClient.getLock(lock.intern());


    	try {
    		// This code by default sets key timeout to 30 seconds, and renews after 10 seconds
    		rlock.lock();
			System.out.println("Driver:"+driverId+" executing order grab logic");

            boolean b = orderService.grab(orderId, driverId);
            if(b) {
            	System.out.println("Driver:"+driverId+" grabbed order successfully");
            }else {
            	System.out.println("Driver:"+driverId+" failed to grab order");
            }

        } finally {
        	rlock.unlock();
        }
        return null;
    }
}
