package com.online.taxi.driver.controller;

import com.online.taxi.common.dto.ShortMsgRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.driver.service.ShortMsgService;
import com.online.taxi.driver.service.VerificationCodeService;
/**
 * @author oi
 */
@RestController
@RequestMapping("/sms")
@Slf4j
public class SmsController {

	@Autowired
	private ShortMsgService shortMsgService;
	
	@Autowired
	private VerificationCodeService verificationCodeService;

	/**
	 * 发送验证码，校验两种方式：自己注解，写validator。
	 * @param shortMsgRequest
	 * @return
	 *
	 */
	@PostMapping("/verify-code/send")
	public ResponseResult verifyCodeSend(@RequestBody @Validated ShortMsgRequest shortMsgRequest) {
		
		String phoneNumber = shortMsgRequest.getPhoneNumber();

		//获取验证码-正常代码
		String code = verificationCodeService.getCode(phoneNumber);
//		String code = "010101";
		log.info("service-verification-code 返回的验证码：{}",code);
		return shortMsgService.send(phoneNumber, code);
		
//		return null;
	}
	
	@Autowired
	private LoadBalancerClient loadBalancerClient;
	
	@GetMapping("/choseServiceName")
	public ResponseResult choseServiceName() {
		String serviceName = "service-sms";
		ServiceInstance si = loadBalancerClient.choose(serviceName);
		System.out.println("sms节点信息：url:"+si.getHost()+",port:"+si.getPort());
		
		return ResponseResult.success("");
	}
}
