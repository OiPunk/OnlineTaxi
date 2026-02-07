package com.rydr.order.dispatch.service.impl;

import com.rydr.common.constant.RedisKeyConstant;
import com.rydr.dto.ResponseResult;
import com.rydr.order.dispatch.service.DispatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author oi
 */
@Service
public class DispatchServiceImpl implements DispatchService {

    @Autowired
    private RedisTemplate<String , String> redisTemplate;

    @Override
    public ResponseResult dispatch(int orderId, List<Integer> driverIdList) {
        for (int driverId:driverIdList
             ) {
            redisTemplate.opsForValue().setIfAbsent(RedisKeyConstant.DRIVER_LISTEN_ORDER_PRE +driverId,orderId+"");
        }

        return ResponseResult.success("");
    }
}
