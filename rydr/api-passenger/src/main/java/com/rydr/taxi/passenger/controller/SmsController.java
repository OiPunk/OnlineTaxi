package com.rydr.taxi.passenger.controller;

import com.rydr.taxi.common.dto.ShortMsgRequest;
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

import com.rydr.taxi.common.constant.CommonStatusEnum;
import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.common.util.PhoneUtil;
import com.rydr.taxi.passenger.service.ShortMsgService;
import com.rydr.taxi.passenger.service.VerificationCodeService;
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
	 * Send verification code
	 * @param shortMsgRequest
	 * @return
	 *
	 */
	@PostMapping("/verify-code/send")
	public ResponseResult verifyCodeSend(@RequestBody @Validated ShortMsgRequest shortMsgRequest) {
		String phoneNumber = shortMsgRequest.getPhoneNumber();

		// Get verification code - normal code
//		String code = verificationCodeService.getCode(phoneNumber);
		String code = "010101";
//		log.info("Verification code returned from service-verification-code: "+code);
//		return shortMsgService.send(phoneNumber, code);
        return null;

	}


	@Autowired
	private LoadBalancerClient loadBalancerClient;

	@GetMapping("/choseServiceName")
	public ResponseResult choseServiceName() {
		String serviceName = "service-sms";
		ServiceInstance si = loadBalancerClient.choose(serviceName);
		System.out.println("SMS node info: url: "+si.getHost()+", port: "+si.getPort());

		return ResponseResult.success("");
	}
}
