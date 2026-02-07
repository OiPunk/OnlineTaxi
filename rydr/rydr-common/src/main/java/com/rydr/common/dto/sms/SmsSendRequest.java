package com.rydr.common.dto.sms;

import lombok.Data;

import java.util.Arrays;
import java.util.List;

/**
 * @author oi
 */
@Data
public class SmsSendRequest{

	private String[] receivers;
	private List<SmsTemplateDto> data;

	@Override
	public String toString() {
		return "SmsSendRequest [reveivers=" + Arrays.toString(receivers) + ", data=" + data + "]";
	}

}