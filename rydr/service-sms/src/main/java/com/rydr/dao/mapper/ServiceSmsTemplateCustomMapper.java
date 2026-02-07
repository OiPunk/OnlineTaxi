package com.rydr.dao.mapper;

import com.rydr.dao.entity.ServiceSmsTemplate;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ServiceSmsTemplateCustomMapper extends ServiceSmsTemplateMapper {

    ServiceSmsTemplate selectByTemplateId(String templateId);

}
