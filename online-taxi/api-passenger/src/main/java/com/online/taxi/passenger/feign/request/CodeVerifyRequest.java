package com.online.taxi.passenger.feign.request;

import lombok.Data;
/**
 * @author oi
 */
@Data
public class CodeVerifyRequest {

	private int identity;

	private String phoneNumber;
	
	private String code;
}