package com.online.taxi.dao.mapper;

import com.online.taxi.dao.entity.ServiceSmsTemplate;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ServiceSmsTemplateCustomMapper extends ServiceSmsTemplateMapper {

    ServiceSmsTemplate selectByTemplateId(String templateId);

}
