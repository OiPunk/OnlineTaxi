package com.rydr.taxi.passenger.service;

import com.rydr.taxi.common.dto.ResponseResult;
/**
 * @author oi
 */
public interface ShortMsgService {
	/**
	 * Send verification code
	 * @param phonenumber
	 * @param code
	 * @return
	 */
	ResponseResult send(String phonenumber,String code);


}
