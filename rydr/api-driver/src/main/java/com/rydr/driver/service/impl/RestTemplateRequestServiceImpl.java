package com.rydr.driver.service.impl;

import com.rydr.common.dto.sms.SmsSendRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rydr.dto.ResponseResult;
import com.rydr.driver.constant.HttpUrlConstants;
import com.rydr.driver.service.RestTemplateRequestService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RestTemplateRequestServiceImpl implements RestTemplateRequestService {

	@Autowired
	private RestTemplate restTemplate;

	@Override
//	@HystrixCommand(fallbackMethod = "sendFail")
//	@HystrixCommand(fallbackMethod = "sendFail",ignoreExceptions = {HystrixIgnoreException.class},
//	commandProperties = {
//			@HystrixProperty(name = "fallback.enabled",value = "true"),
//			@HystrixProperty(name = "circuitBreaker.forceOpen",value = "false")
//	})
	public ResponseResult smsSend(SmsSendRequest smsSendRequest) {

		// The code below intentionally throws an exception
//		try {
//			int i = 1/0;
//		} catch (Exception e) {
//			// TODO: handle exception
//			throw new BusinessException("Circuit breaker ignored exception, extends HystrixBadRequestException");
////			throw new HystrixIgnoreException("Circuit breaker ignored exception, ignore property setting");
//		}

		String url = HttpUrlConstants.SERVICE_SMS_URL + "/send/alisms-template";
		return restTemplate.postForEntity(url, smsSendRequest, ResponseResult.class).getBody();
	}

//	private ResponseResult sendFail(SmsSendRequest smsSendRequest) {
//		// Fallback logic
//		return ResponseResult.fail(-3, "resttemplate circuit breaker");
//	}

	private ResponseResult sendFail(SmsSendRequest smsSendRequest ,Throwable throwable) {
		log.info("Exception info: "+throwable);
		// Fallback logic

		return ResponseResult.fail(-3, "restTemplate circuit breaker");
	}

	// All requests to underlying services.

	public String grabOrder(int orderId, int driverId) {

		String url = HttpUrlConstants.SERVICE_ORDER_URL + "/grab/do/"+orderId+"?driverId="+driverId;

		return restTemplate.getForEntity(url, String.class).getBody();
	}

}
