package com.rydr.driver.service;

import com.rydr.dto.ResponseResult;

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
