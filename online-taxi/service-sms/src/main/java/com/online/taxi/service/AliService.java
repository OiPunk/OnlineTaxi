package com.online.taxi.service;


import com.online.taxi.common.dto.sms.SmsSendRequest;

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
