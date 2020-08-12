package com.online.taxi.dao;

import com.online.taxi.dao.entity.ServiceSmsTemplate;
import com.online.taxi.dao.mapper.ServiceSmsTemplateCustomMapper;
import com.online.taxi.dao.mapper.ServiceSmsTemplateMapper;
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
