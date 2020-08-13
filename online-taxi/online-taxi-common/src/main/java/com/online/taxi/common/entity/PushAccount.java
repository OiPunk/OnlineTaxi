package com.online.taxi.entity;

import lombok.Data;

import java.util.Date;

/**
 */
@Data
public class PushAccount {

    private Integer id;

    private String source;

    private String jpushId;

    private String yid;

    private Integer audience;

    private Integer identityStatus;

    private Date createTime;

    private Date updateTime;

}