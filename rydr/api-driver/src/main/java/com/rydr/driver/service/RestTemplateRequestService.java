package com.rydr.driver.service;

import com.rydr.dto.ResponseResult;
import com.rydr.common.dto.sms.SmsSendRequest;

public interface RestTemplateRequestService {
	
	ResponseResult smsSend(SmsSendRequest smsSendRequest);
	
	String grabOrder(int orderId, int driverId);

}
