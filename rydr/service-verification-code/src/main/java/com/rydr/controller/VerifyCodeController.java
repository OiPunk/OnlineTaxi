package com.rydr.controller;

import com.rydr.service.VerifyCodeService;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rydr.dto.ResponseResult;
import com.rydr.request.CodeVerifyRequest;
/**
 * @author oi
 */
@RestController
@RequestMapping("/verify-code")
@Slf4j
public class VerifyCodeController {

	@Autowired
	private VerifyCodeService verifyCodeService;

	/**
	 * Generate verification code based on identity and phone number
	 * @param identity
	 * @param phoneNumber
	 * @return
	 */
	@GetMapping("/generate/{identity}/{phoneNumber}")
	public ResponseResult generate(@PathVariable("identity") int identity ,@PathVariable ("phoneNumber") String phoneNumber) {
		log.info("Identity type: "+identity+", phone number: "+phoneNumber);
		// Validate parameters

		return verifyCodeService.generate(identity,phoneNumber);
	}

	@PostMapping("/verify")
	public ResponseResult verify(@RequestBody CodeVerifyRequest request) {
		log.info("/verify-code/verify  request:"+ JSONObject.fromObject(request));
		// Get phone number and verification code
		String phoneNumber = request.getPhoneNumber();
		int identity = request.getIdentity();
		String code = request.getCode();

		return verifyCodeService.verify(identity,phoneNumber,code);

	}



}
