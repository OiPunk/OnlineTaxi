package com.rydr.demo.taxi.common.controller;

import com.rydr.demo.taxi.common.response.LoginResponse;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rydr.demo.taxi.common.constant.IdentityConstant;
import com.rydr.demo.taxi.common.request.LoginRequest;

@RestController
@RequestMapping("/login")
public class LoginController {

	/**
	 * Verification code login
	 * @return
	 */
	@PostMapping("/verify")
	public LoginResponse login(@RequestBody LoginRequest bean) {

		LoginResponse response = new LoginResponse();
		if(bean.getRoleCode().intValue() == IdentityConstant.PASSENGER) {
			response.setId(""+IdentityConstant.PASSENGER);
			response.setName("Passenger Zhang San");
		}else if(bean.getRoleCode().intValue() == IdentityConstant.DRIVER) {
			response.setId(""+IdentityConstant.DRIVER);
			response.setName("Driver Zhang San");
			response.setWorkStatus(0);
		}
		response.setRoleCode(bean.getRoleCode());
		return response;
	}
}
