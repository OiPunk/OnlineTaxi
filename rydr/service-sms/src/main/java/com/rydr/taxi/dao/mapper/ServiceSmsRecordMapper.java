package com.rydr.taxi.dao.mapper;

import com.rydr.taxi.dao.entity.ServiceSmsRecord;

public interface ServiceSmsRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ServiceSmsRecord record);

    int insertSelective(ServiceSmsRecord record);

    ServiceSmsRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ServiceSmsRecord record);

    int updateByPrimaryKey(ServiceSmsRecord record);
}