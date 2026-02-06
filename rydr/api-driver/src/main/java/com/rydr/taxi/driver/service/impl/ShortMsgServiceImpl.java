package com.rydr.taxi.driver.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.rydr.taxi.common.dto.sms.SmsSendRequest;
import com.rydr.taxi.common.dto.sms.SmsTemplateDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.stereotype.Service;

import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.driver.service.RestTemplateRequestService;
import com.rydr.taxi.driver.service.ShortMsgService;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
/**
 * @author oi
 */
@Service
@Slf4j
public class ShortMsgServiceImpl implements ShortMsgService {

	@Autowired
	private RestTemplateRequestService restTemplateRequestService;

	@Override
	public ResponseResult send(String phoneNumber, String code) {

		System.out.println("Phone number and verification code: "+phoneNumber+","+code);
		String http = "http://";
		String serviceName = "SERVICE-SMS";
		String uri = "/send/alisms-template";

		String url = http + serviceName + uri;
		SmsSendRequest smsSendRequest = new SmsSendRequest();
		String[] phoneNumbers = new String[] {phoneNumber};
		smsSendRequest.setReceivers(phoneNumbers);

		List<SmsTemplateDto> data = new ArrayList<SmsTemplateDto>();
		SmsTemplateDto dto = new SmsTemplateDto();
		dto.setId("SMS_144145499");
		int templateSize = 1;
		HashMap<String, Object> templateMap = new HashMap<String, Object>(templateSize);
		templateMap.put("code", code);
		dto.setTemplateMap(templateMap);
		data.add(dto);

		smsSendRequest.setData(data);

//		 Normal ribbon call
		ResponseResult result =  restTemplateRequestService.smsSend(smsSendRequest);

		System.out.println("Result returned from SMS service call: "+JSONObject.fromObject(result));
		return result;
	}

	/*
	 *	Code below is a manual ribbon implementation
	 */

	@Autowired
	DiscoveryClient discoveryClient;

	private ServiceInstance loadBalance(String serviceName) {
		List<ServiceInstance> instances = discoveryClient.getInstances(serviceName);
		ServiceInstance instance = instances.get(new Random().nextInt(instances.size()));
		log.info("Load balancing selected IP: "+instance.getHost()+", port: "+instance.getPort());

		Map<String, String> metadata = instance.getMetadata();

		return instance;
	}

	/*
	 *	Code above is a manual ribbon implementation
	 */

}
