package com.rydr.dao;

import com.rydr.dao.entity.ServiceSmsTemplate;
import com.rydr.dao.mapper.ServiceSmsTemplateCustomMapper;
import com.rydr.dao.mapper.ServiceSmsTemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author oi
 */
@Service
public class SmsTemplateDao {
	
	@Autowired
	private ServiceSmsTemplateCustomMapper serviceSmsTemplateCustomMapper;
	
	public ServiceSmsTemplate getByTemplateId(String templateId) {
		return serviceSmsTemplateCustomMapper.selectByTemplateId(templateId);
	}
}
