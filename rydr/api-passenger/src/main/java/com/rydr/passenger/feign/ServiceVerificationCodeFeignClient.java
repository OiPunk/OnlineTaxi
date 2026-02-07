package com.rydr.passenger.feign;

import com.rydr.dto.ResponseResult;
import com.rydr.common.dto.order.ForecastRequest;
import com.rydr.common.dto.order.ForecastResponse;
import com.rydr.passenger.feign.request.CodeVerifyRequest;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(name = "SERVICE-VERIFICATION-CODE")
public interface ServiceVerificationCodeFeignClient {

    @RequestMapping(value = "/verify-code/verify",method = RequestMethod.POST)
    public ResponseResult verify(@RequestBody CodeVerifyRequest codeVerifyRequest);

}
