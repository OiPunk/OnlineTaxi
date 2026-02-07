package com.rydr.controller;

import com.rydr.dto.ResponseResult;
import com.rydr.common.dto.passengeruser.LoginRequest;
import com.rydr.service.ServicePassengerUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author oi
 */
@RestController
@RequestMapping("/auth")
public class AuthController {


    @Autowired
    private ServicePassengerUserInfoService passengerUserInfoService;

    @PostMapping("/login")
    public ResponseResult passengerLogin(@RequestBody @Validated LoginRequest request){
        String passengerPhone = request.getPassengerPhone();

        return passengerUserInfoService.login(passengerPhone);

    }

    public void logout(){}
}
