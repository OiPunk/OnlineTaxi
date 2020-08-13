package com.online.taxi.entity;

import lombok.Data;

import java.util.Date;

/**
 **/
@Data
public class DeviceToken {
    private Integer id;

    private String source;

    private String deviceCode;

    private String deviceToken;

    private String phoneNumber;

    private Date createTime;

    private Date updateTime;

    private Integer identityStatus;
}
