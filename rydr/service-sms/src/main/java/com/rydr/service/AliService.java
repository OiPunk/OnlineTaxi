package com.rydr.service;


import com.rydr.common.dto.sms.SmsSendRequest;

/**
 * @author oi
 */
public interface AliService {
	/**
	 * Send SMS
	 * @param request
	 * @return
	 */
	public int sendSms(SmsSendRequest request);
}
