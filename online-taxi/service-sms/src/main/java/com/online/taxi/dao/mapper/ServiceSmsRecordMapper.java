package com.online.taxi.dao.mapper;

import com.online.taxi.dao.entity.ServiceSmsRecord;

public interface ServiceSmsRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ServiceSmsRecord record);

    int insertSelective(ServiceSmsRecord record);

    ServiceSmsRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ServiceSmsRecord record);

    int updateByPrimaryKey(ServiceSmsRecord record);
}