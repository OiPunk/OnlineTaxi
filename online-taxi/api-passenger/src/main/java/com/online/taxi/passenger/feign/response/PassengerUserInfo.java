package com.online.taxi.passenger.feign.response;

import lombok.Data;

import java.util.Date;

@Data
public class PassengerUserInfo {
    private Long id;

    private Date registerDate;

    private String passengerPhone;

    private String passengerName;

    private Byte passengerGender;

    private Byte userState;

    private Date createTime;

    private Date updateTime;
}