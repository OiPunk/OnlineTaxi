package com.online.taxi.demo.taxi.common.controller;

import com.online.taxi.demo.taxi.common.response.LoginResponse;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.online.taxi.demo.taxi.common.constant.IdentityConstant;
import com.online.taxi.demo.taxi.common.request.LoginRequest;

@RestController
@RequestMapping("/login")
public class LoginController {
	
	/**
	 * 验证码登录
	 * @return
	 */
	@PostMapping("/verify")
	public LoginResponse login(@RequestBody LoginRequest bean) {
		
		LoginResponse response = new LoginResponse();
		if(bean.getRoleCode().intValue() == IdentityConstant.PASSENGER) {
			response.setId(""+IdentityConstant.PASSENGER);
			response.setName("乘客张三");
		}else if(bean.getRoleCode().intValue() == IdentityConstant.DRIVER) {
			response.setId(""+IdentityConstant.DRIVER);
			response.setName("司机张三");
			response.setWorkStatus(0);
		}
		response.setRoleCode(bean.getRoleCode());
		return response;
	}
}
