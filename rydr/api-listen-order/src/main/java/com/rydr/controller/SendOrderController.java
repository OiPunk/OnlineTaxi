package com.rydr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rydr.common.constant.RedisKeyConstant;
import com.rydr.listen.service.ListenService;

@RestController
@RequestMapping("/order")
public class SendOrderController {

	@Autowired
    private ListenService listenService;

	@Autowired
    private RedisTemplate<String,String> redisTemplate;

	@GetMapping("/send")
	public String sendOrder(String driverId) {

		String key = RedisKeyConstant.DRIVER_LISTEN_ORDER_PRE + driverId;
        redisTemplate.opsForValue().set(key, driverId);

        return "Successfully sent order to driver "+driverId;
	}
}
