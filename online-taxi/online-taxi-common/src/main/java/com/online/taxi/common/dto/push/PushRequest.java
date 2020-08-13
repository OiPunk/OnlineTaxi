package com.online.taxi.dto.push;

import lombok.Data;

/**
 */
@Data
public class PushRequest {

    private String sendId;

    private Integer sendIdentity;

    private int acceptIdentity ;

    private String acceptId;

    private int messageType;

    private String title;

    private String messageBody;

    private Integer messageChannel;

    private String businessMessage;

    private Integer businessType;

    public PushRequest() {
    }
}