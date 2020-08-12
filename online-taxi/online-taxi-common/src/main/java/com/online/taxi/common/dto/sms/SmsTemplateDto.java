package com.online.taxi.common.dto.sms;

import lombok.Data;

import java.util.Map;

/**
 * @author oi
 */
@Data
public class SmsTemplateDto {

	private String id;

	private Map<String, Object> templateMap;

	@Override
	public String toString() {
		return "SmsTemplateDto [id=" + id + ", templateMap=" + templateMap + "]";
	}

}