package com.online.taxi.passenger.controller;

import com.online.taxi.common.dto.ShortMsgRequest;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.online.taxi.common.constant.CommonStatusEnum;
import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.common.util.PhoneUtil;
import com.online.taxi.passenger.service.ShortMsgService;
import com.online.taxi.passenger.service.VerificationCodeService;
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
	 * 发送验证码
	 * @param shortMsgRequest
	 * @return
	 *
	 */
	@PostMapping("/verify-code/send")
	public ResponseResult verifyCodeSend(@RequestBody @Validated ShortMsgRequest shortMsgRequest) {
		String phoneNumber = shortMsgRequest.getPhoneNumber();

		//获取验证码-正常代码
//		String code = verificationCodeService.getCode(phoneNumber);
		String code = "010101";
//		log.info("service-verification-code 返回的验证码："+code);
//		return shortMsgService.send(phoneNumber, code);
        return null;
		
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
