package com.rydr.taxi.dao.mapper;

import com.rydr.taxi.dao.entity.ServiceSmsTemplate;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ServiceSmsTemplateCustomMapper extends ServiceSmsTemplateMapper {

    ServiceSmsTemplate selectByTemplateId(String templateId);

}
