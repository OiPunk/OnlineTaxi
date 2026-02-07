package com.rydr.passenger.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.rydr.dto.ResponseResult;
import com.rydr.common.dto.order.ForecastRequest;
import com.rydr.common.dto.order.ForecastResponse;
import com.rydr.passenger.feign.ServiceForecast;

import net.sf.json.JSONObject;

/**
 *
 * @author oi
 *
 */
@RestController
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private ServiceForecast serviceForecast;

	@PostMapping("/forecast")
	public ResponseResult<ForecastResponse> forecast(@RequestBody ForecastRequest forecastRequest) {

		ResponseResult<ForecastResponse> result = serviceForecast.forecast(forecastRequest);

		return ResponseResult.success(result.getData());
	}


	/*
	 * Below demonstrates two invocation methods
	 */
	@Autowired
	private RestTemplate restTemplate;

	@PostMapping("/forecast-test")
	public ResponseResult forecastTest(@RequestBody ForecastRequest forecastRequest) {
		/*
		 * Specific IP (localhost:8060), without LoadBalanced
		 * Service name (service-valuation), with LoadBalanced
		 */
//		String destination = "localhost:8060";
		String destination = "service-valuation";

		String url = "http://"+destination+"/forecast/single";

		// Request headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // Request body
        JSONObject requestParam = new JSONObject();
        requestParam.put("startLatitude", "1");
        requestParam.put("startLongitude", "1");
        requestParam.put("endLatitude", "1");
        requestParam.put("endLongitude", "1");
        // Wrap into a request object
        HttpEntity entity = new HttpEntity(requestParam, headers);

		ResponseResult result = restTemplate.exchange(url, HttpMethod.POST,entity,ResponseResult.class).getBody();

		return ResponseResult.success(result.getData());
	}
}
