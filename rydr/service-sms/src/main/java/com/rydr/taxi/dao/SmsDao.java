package com.rydr.taxi.dao;

import com.rydr.taxi.dao.entity.ServiceSmsRecord;
import com.rydr.taxi.dao.mapper.ServiceSmsRecordMapper;
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
