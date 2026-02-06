package com.online.taxi.dto.sms;

import lombok.Data;

/**
 * SMS request
 *
 * @date 2018/10/23
 */
@Data
public class SmsRequest {
    /**
     * Template ID
     */
    private String templateId;

    /**
     * Phone numbers
     */
    private String[] phones;

    /**
     * Replacement content
     */
    private String[] content;
}
