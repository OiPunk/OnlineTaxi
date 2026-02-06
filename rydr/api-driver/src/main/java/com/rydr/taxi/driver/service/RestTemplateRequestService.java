package com.rydr.taxi.driver.service;

import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.common.dto.sms.SmsSendRequest;

public interface RestTemplateRequestService {
	
	ResponseResult smsSend(SmsSendRequest smsSendRequest);
	
	String grabOrder(int orderId, int driverId);

}
