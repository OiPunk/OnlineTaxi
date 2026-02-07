package com.rydr.order.service.impl;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import com.rydr.dto.ResponseResult;
import com.rydr.common.entity.OrderLock;
import com.rydr.order.lock.MysqlLock;
import com.rydr.order.lock.RedisLock;
import com.rydr.order.service.GrabService;
import com.rydr.order.service.OrderService;

/**
 * @author oi
 */
@Service("grabRedisLockService")
public class GrabRedisLockServiceImpl implements GrabService {

	@Autowired
	StringRedisTemplate stringRedisTemplate;

	@Autowired
	OrderService orderService;

    @Override
    public ResponseResult grabOrder(int orderId , int driverId){
        //generate key
    	String lock = "order_"+(orderId+"");
    	/*
    	 *  Case 1: If the lock is not released, e.g. business logic is halfway through and ops restarts
    	 *  the service, or the server crashes without reaching finally, what to do?
    	 *  Add a timeout.
    	 */
//    	boolean lockStatus = stringRedisTemplate.opsForValue().setIfAbsent(lock.intern(), driverId+"");
//    	if(!lockStatus) {
//    		return null;
//    	}

    	/*
    	 *  Case 2: Adding a timeout may fail to be set if ops restarts at the wrong moment.
    	 */
//    	boolean lockStatus = stringRedisTemplate.opsForValue().setIfAbsent(lock.intern(), driverId+"");
//    	stringRedisTemplate.expire(lock.intern(), 30L, TimeUnit.SECONDS);
//    	if(!lockStatus) {
//    		return null;
//    	}

    	/*
    	 * Case 3: The timeout should be set atomically in one call, not in 2 separate lines of code.
    	 *
    	 */
    	boolean lockStatus = stringRedisTemplate.opsForValue().setIfAbsent(lock.intern(), driverId+"", 30L, TimeUnit.SECONDS);
    	// Start a child thread: if the original time is N, renew to N every N/3 interval

    	if(!lockStatus) {
    		return null;
    	}

    	try {
			System.out.println("Driver:"+driverId+" executing order grab logic");

            boolean b = orderService.grab(orderId, driverId);
            if(b) {
            	System.out.println("Driver:"+driverId+" grabbed order successfully");
            }else {
            	System.out.println("Driver:"+driverId+" failed to grab order");
            }

        } finally {
        	/**
        	 * This way of releasing the lock may accidentally release someone else's lock.
        	 */
//        	stringRedisTemplate.delete(lock.intern());

        	/**
        	 * The code below avoids releasing someone else's lock.
        	 */
        	if((driverId+"").equals(stringRedisTemplate.opsForValue().get(lock.intern()))) {
        		stringRedisTemplate.delete(lock.intern());
        	}
        }
        return null;
    }
}
