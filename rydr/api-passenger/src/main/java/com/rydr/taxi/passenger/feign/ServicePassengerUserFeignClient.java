package com.rydr.taxi.passenger.feign;

import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.common.dto.passengeruser.LoginRequest;
import com.rydr.taxi.passenger.feign.response.PassengerUserInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(name = "service-passenger-user")
public interface ServicePassengerUserFeignClient {

    @RequestMapping(value = "/auth/login",method = RequestMethod.POST)
    public ResponseResult<PassengerUserInfo> login(@RequestBody LoginRequest loginRequest);

}
