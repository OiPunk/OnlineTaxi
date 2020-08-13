package com.online.taxi.dto.push;

import lombok.Data;

/**
 */
@Data
public class JpushMessage {

    private int messageType;

    private String title;

    private String messageBody;
}