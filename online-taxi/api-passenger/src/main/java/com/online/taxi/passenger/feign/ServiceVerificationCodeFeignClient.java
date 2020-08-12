package com.online.taxi.passenger.feign;

import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.common.dto.order.ForecastRequest;
import com.online.taxi.common.dto.order.ForecastResponse;
import com.online.taxi.passenger.feign.request.CodeVerifyRequest;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(name = "SERVICE-VERIFICATION-CODE")
public interface ServiceVerificationCodeFeignClient {

    @RequestMapping(value = "/verify-code/verify",method = RequestMethod.POST)
    public ResponseResult verify(@RequestBody CodeVerifyRequest codeVerifyRequest);

}
