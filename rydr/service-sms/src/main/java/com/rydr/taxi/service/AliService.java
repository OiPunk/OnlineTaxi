package com.rydr.taxi.service;


import com.rydr.taxi.common.dto.sms.SmsSendRequest;

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
