package com.rydr.passenger.fallback;

import com.rydr.common.dto.sms.SmsSendRequest;
import org.springframework.stereotype.Component;

import com.rydr.dto.ResponseResult;
import com.rydr.passenger.feign.SmsClient;
/**
 * @author oi
 */
@Component
public class SmsClientFallback implements SmsClient {

//	@Autowired
//	private StringRedisTemplate redisTemplate;

	@Override
	public ResponseResult sendSms(SmsSendRequest smsSendRequest) throws Exception{
		System.out.println("Sorry, circuit breaker triggered");

//		String key = "service-sms";
//		String noticeString = redisTemplate.opsForValue().get(key);
//		if(StringUtils.isBlank(noticeString)) {
//			Send SMS or call phone notification API
//			System.out.println("Notify others that circuit breaker triggered");
//			redisTemplate.opsForValue().set(key, "notice", 30, TimeUnit.SECONDS);
//
//		}else {
//			System.out.println("Already notified, skipping notification for now");
//		}
		throw new RuntimeException("Exception");
//		return ResponseResult.fail(-3, "feign circuit breaker");
	}

}
