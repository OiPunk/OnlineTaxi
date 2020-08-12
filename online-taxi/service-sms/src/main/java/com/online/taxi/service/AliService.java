package com.online.taxi.service;


import com.online.taxi.common.dto.sms.SmsSendRequest;

/**
 * @author oi
 */
public interface AliService {
	/**
	 * 发送短信
	 * @param request
	 * @return
	 */
	public int sendSms(SmsSendRequest request);
}
