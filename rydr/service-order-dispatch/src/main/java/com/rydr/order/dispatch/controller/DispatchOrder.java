package com.rydr.order.dispatch.controller;

import com.rydr.dto.ResponseResult;
import com.rydr.order.dispatch.service.DispatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author oi
 */
@RestController
@RequestMapping("/dispatch")
public class DispatchOrder {

    @Autowired
    private DispatchService dispatchService;


    @GetMapping("/call/{orderId}")
    public ResponseResult callCar(@PathVariable("orderId") int orderId){
        // Test dispatching to driver 1, driver selection logic
        List<Integer> driverList = new ArrayList<Integer>();
        driverList.add(1);
        return dispatchService.dispatch(orderId,driverList);
    }
}
