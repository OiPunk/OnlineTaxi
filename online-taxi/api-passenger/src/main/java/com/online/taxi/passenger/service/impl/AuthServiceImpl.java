package com.online.taxi.passenger.service.impl;

import com.online.taxi.common.constant.IdentityConstant;
import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.common.dto.passengeruser.LoginRequest;
import com.online.taxi.common.util.JwtUtil;
import com.online.taxi.passenger.feign.ServicePassengerUserFeignClient;
import com.online.taxi.passenger.feign.ServiceVerificationCodeFeignClient;
import com.online.taxi.passenger.feign.request.CodeVerifyRequest;
import com.online.taxi.passenger.feign.response.PassengerUserInfo;
import com.online.taxi.passenger.response.UserAuthResponse;
import com.online.taxi.passenger.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private ServiceVerificationCodeFeignClient serviceVerificationCodeFeignClient;

    @Autowired
    private ServicePassengerUserFeignClient servicePassengerUserFeignClient;

    @Override
    public ResponseResult auth(String passengerPhone, String code) {
        // 校验验证码
        CodeVerifyRequest codeVerifyRequest = new CodeVerifyRequest();
        codeVerifyRequest.setPhoneNumber(passengerPhone);
        codeVerifyRequest.setCode(code);
        codeVerifyRequest.setIdentity(IdentityConstant.PASSENGER);

        ResponseResult responseResult = serviceVerificationCodeFeignClient.verify(codeVerifyRequest);
        if(responseResult.getCode() != 1){
            return ResponseResult.fail(responseResult.getCode(),responseResult.getMessage());
        }

        // 乘客用户登录
        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setPassengerPhone(passengerPhone);
        ResponseResult<PassengerUserInfo> passengerUserInfoResponseResult = servicePassengerUserFeignClient.login(loginRequest);
        if(passengerUserInfoResponseResult.getCode() != 1){
            return ResponseResult.fail(passengerUserInfoResponseResult.getCode(),passengerUserInfoResponseResult.getMessage());
        }
        PassengerUserInfo passengerUserInfo = passengerUserInfoResponseResult.getData();

        // 分发token
        long passengerId = passengerUserInfo.getId();
        //生成通过jwt 生成 token，以后需要登录认证的接口，都需要带上token，还有签名规则
        String subject = IdentityConstant.PASSENGER +"_"+passengerPhone+"_"+passengerId;
        String token = JwtUtil.createToken(subject,new Date());
        UserAuthResponse response = new UserAuthResponse();

        response.setToken(token);
        return ResponseResult.success(response);
    }
}
