package com.rydr.taxi.driver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rydr.taxi.common.dto.BaseResponse;
import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.driver.service.RestTemplateRequestService;

/**
 * @author oi
 */
@RestController
@RequestMapping("/grab")
public class GrabOrderController {

	@Autowired
	private RestTemplateRequestService restTemplateRequestService; 
    
    @GetMapping("/do/{orderId}")
    public ResponseResult grab(@PathVariable("orderId") int orderId, int driverId){
    	restTemplateRequestService.grabOrder(orderId,driverId);
        return ResponseResult.success("");
    }
}