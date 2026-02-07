package com.rydr.dao;

import com.rydr.dao.entity.ServiceSmsRecord;
import com.rydr.dao.mapper.ServiceSmsRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author oi
 */
@Service
public class SmsDao {
	
	@Autowired
	private ServiceSmsRecordMapper serviceSmsRecordMapper;
	
	public int insert(ServiceSmsRecord serviceSmsRecord) {
		
		return serviceSmsRecordMapper.insertSelective(serviceSmsRecord);
	}
}
