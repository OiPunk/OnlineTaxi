package com.rydr.taxi.order.service.impl;

import com.rydr.taxi.common.constant.RedisKeyConstant;
import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.order.service.GrabService;
import com.rydr.taxi.order.service.OrderService;

import org.redisson.RedissonRedLock;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * @author oi
 */
@Service("grabRedisRedissonRedLockLockService")
public class GrabRedisRedissonRedLockLockServiceImpl implements GrabService {

    @Autowired
    private RedissonClient redissonRed1;
    @Autowired
    private RedissonClient redissonRed2;
    @Autowired
    private RedissonClient redissonRed3;

    @Autowired
	OrderService orderService;

    @Override
    public ResponseResult grabOrder(int orderId , int driverId){
        //generate key
        String lockKey = (RedisKeyConstant.GRAB_LOCK_ORDER_KEY_PRE + orderId).intern();
        //redisson lock - sentinel
//        RLock rLock = redisson.getLock(lockKey);
//        rLock.lock();

        //redisson lock - single node
//        RLock rLock = redissonRed1.getLock(lockKey);

        //red lock
        RLock rLock1 = redissonRed1.getLock(lockKey);
        RLock rLock2 = redissonRed2.getLock(lockKey);
        RLock rLock3 = redissonRed2.getLock(lockKey);
        RedissonRedLock rLock = new RedissonRedLock(rLock1,rLock2,rLock3);

        rLock.lock();

        try {
    		// This code by default sets key timeout to 30 seconds, and renews after 10 seconds
			System.out.println("Driver:"+driverId+" executing order grab logic");

            boolean b = orderService.grab(orderId, driverId);
            if(b) {
            	System.out.println("Driver:"+driverId+" grabbed order successfully");
            }else {
            	System.out.println("Driver:"+driverId+" failed to grab order");
            }

        } finally {
        	rLock.unlock();
        }
        return null;
    }
}
