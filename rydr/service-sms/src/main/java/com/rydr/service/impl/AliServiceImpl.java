package com.rydr.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rydr.constant.SmsStatusEnum;
import com.rydr.dao.SmsDao;
import com.rydr.dao.SmsTemplateDao;
import com.rydr.dao.entity.ServiceSmsRecord;
import com.rydr.dao.entity.ServiceSmsTemplate;
import com.rydr.common.dto.sms.SmsSendRequest;
import com.rydr.common.dto.sms.SmsTemplateDto;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.rydr.service.AliService;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
/**
 * @author oi
 */
@Service
@Slf4j
public class AliServiceImpl implements AliService {

	/**
	*   Cache templates used for content replacement
	 */
    private Map<String, String> templateMaps = new HashMap<String, String>();

    @Autowired
    private SmsTemplateDao smsTemplateDto;

    @Autowired
    private SmsDao smsDao;

    @Override
    public int sendSms(SmsSendRequest request) {
        log.info(request.toString());

        for (String phoneNumber : request.getReceivers()) {
            List<SmsTemplateDto> templates = request.getData();

            ServiceSmsRecord sms = new ServiceSmsRecord();
            sms.setPhoneNumber(phoneNumber);

            for (SmsTemplateDto template : templates) {
                // Load template content from DB to cache
                if (!templateMaps.containsKey(template.getId())) {
                	// The commented-out content here loads the DB template into memory
                	ServiceSmsTemplate t = smsTemplateDto.getByTemplateId(template.getId());
                	System.out.println(t.getTemplateContent());
                    templateMaps.put(template.getId(),
                    		smsTemplateDto.getByTemplateId(template.getId()).getTemplateContent());
                }

                // Replace placeholders
                String content = templateMaps.get(template.getId());
                for (Map.Entry<String, Object> entry : template.getTemplateMap().entrySet()) {
                    content = StringUtils.replace(content, "${" + entry.getKey() + "}", "" + entry.getValue());
                }

                // When an error occurs, do not affect sending to other phone numbers and templates
                try {
                    int result = send(phoneNumber, template.getId(), template.getTemplateMap());

                    // Assemble SMS object
                    sms.setSendTime(new Date());
                    sms.setOperatorName("");
                    sms.setSendFlag(1);
                    sms.setSendNumber(0);
                    sms.setSmsContent(content);

                    if (result != SmsStatusEnum.SEND_SUCCESS.getCode()) {
                        throw new Exception("SMS sending failed");
                    }
                } catch (Exception e) {
                    sms.setSendFlag(0);
                    sms.setSendNumber(1);
                    log.error("Failed to send SMS (" + template.getId() + "): " + phoneNumber, e);
                } finally {
                    sms.setCreateTime(new Date());
                    smsDao.insert(sms);
                }
            }
        }
        return 0;
    }

    private int send(String phoneNumber, String templateId, Map<String, ?> map) throws Exception {
        JSONObject param = new JSONObject();
        param.putAll(map);

        return sendMsg(phoneNumber, templateId, param.toString());
    }

    private int sendMsg(String phoneNumber, String templateCode, String param) {
        /**
         * Implement according to the SMS provider's API
    	*/
    	return SmsStatusEnum.SEND_SUCCESS.getCode();

    }
}
