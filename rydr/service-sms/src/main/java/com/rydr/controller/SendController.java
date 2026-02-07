package com.rydr.controller;

import com.rydr.common.dto.sms.SmsSendRequest;
import com.rydr.service.AliService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.rydr.dto.ResponseResult;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
/**
 * @author oi
 */
@RestController
@RequestMapping("/send")
@Slf4j
public class SendController {

	@Autowired
	private AliService aliService;

	@RequestMapping(value = "/alisms-template",method = RequestMethod.POST)
    public ResponseResult send(@RequestBody SmsSendRequest smsSendRequest){
		// Output received parameter content
        JSONObject param = JSONObject.fromObject(smsSendRequest);
        log.info("/send/alisms-template   request: "+param.toString());
        aliService.sendSms(smsSendRequest);
        return  ResponseResult.success("");
    }

}
