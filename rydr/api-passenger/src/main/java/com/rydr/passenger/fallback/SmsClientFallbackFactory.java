package com.rydr.passenger.fallback;

import com.rydr.common.dto.sms.SmsSendRequest;
import org.springframework.stereotype.Component;

import com.rydr.dto.ResponseResult;
import com.rydr.passenger.feign.SmsClient;

import feign.hystrix.FallbackFactory;

@Component
public class SmsClientFallbackFactory implements FallbackFactory<SmsClient> {

	@Override
	public SmsClient create(Throwable cause) {
		return new SmsClient() {

			@Override
			public ResponseResult sendSms(SmsSendRequest smsSendRequest) {
				System.out.println("feign exception: "+cause);
				return ResponseResult.fail(-3, "feign fallback factory circuit breaker");
			}
		};
	}

}
