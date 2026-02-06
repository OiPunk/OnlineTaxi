package com.rydr.taxi.order.controller;

import com.rydr.taxi.common.dto.BaseResponse;
import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.order.service.GrabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

/**
 * @author oi
 */
@RestController
@RequestMapping("/grab")
public class GrabOrderController {

    @Autowired
    // no lock
//    @Qualifier("grabNoLockService")
    // JVM lock
//    @Qualifier("grabJvmLockService")
    // MySQL lock
//    @Qualifier("grabMysqlLockService")
    // single Redisson
    @Qualifier("grabRedisRedissonService")
    // red lock
//    @Qualifier("grabRedisRedissonRedLockLockService")
    private GrabService grabService;


    @GetMapping("/do/{orderId}")
    public String grab(@PathVariable("orderId") int orderId, int driverId){
        grabService.grabOrder(orderId,driverId);
        ResponseResult.success(new BaseResponse());
        return "";
    }
}
