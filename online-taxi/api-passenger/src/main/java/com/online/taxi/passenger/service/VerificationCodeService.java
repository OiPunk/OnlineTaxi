package com.online.taxi.passenger.service;

import com.online.taxi.common.dto.ResponseResult;
/**
 * 	Verification code service
 * @author oi
 *
 */
public interface VerificationCodeService {
	/**
	 * 	Get verification code
	 * @param phonenumber
	 * @return
	 */
	public String getCode(String phonenumber);

	/**
	 * 	Validate verification code
	 * @param phonenumber
	 * @param code
	 * @return
	 */
	public String checkCode(String phonenumber,String code);
}
