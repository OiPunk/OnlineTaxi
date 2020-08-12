package com.online.taxi.passenger.fallback;

import com.online.taxi.common.dto.sms.SmsSendRequest;
import org.springframework.stereotype.Component;

import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.passenger.feign.SmsClient;
/**
 * @author oi
 */
@Component
public class SmsClientFallback implements SmsClient {

//	@Autowired
//	private StringRedisTemplate redisTemplate;
	
	@Override
	public ResponseResult sendSms(SmsSendRequest smsSendRequest) throws Exception{
		System.out.println("不好意思，我熔断了");
		
//		String key = "service-sms";
//		String noticeString = redisTemplate.opsForValue().get(key);
//		if(StringUtils.isBlank(noticeString)) {
//			发送短信，或者调用电话接口
//			System.out.println("通知别人我熔断了");
//			redisTemplate.opsForValue().set(key, "notice", 30, TimeUnit.SECONDS);
//			
//		}else {
//			System.out.println("通知过了，我先不通知了");
//		}
		throw new RuntimeException("异常");
//		return ResponseResult.fail(-3, "feign熔断");
	}

}
