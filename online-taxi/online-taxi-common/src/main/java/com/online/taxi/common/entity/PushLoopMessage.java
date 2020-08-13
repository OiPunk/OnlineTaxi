package com.online.taxi.entity;

import lombok.Data;

import java.util.Date;

/**
 */
@Data
public class PushLoopMessage {

    private Long id;

    private Integer acceptIdentity;

    private String acceptId;

    private Integer messageType;

    private String messageBody;

    private Integer readFlag;

    private String sendId;

    private Integer sendIdentity;

    private Date createTime;

    private Date expireTime;

}