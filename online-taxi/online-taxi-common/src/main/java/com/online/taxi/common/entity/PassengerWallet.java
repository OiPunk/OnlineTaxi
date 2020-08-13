package com.online.taxi.entity;

import lombok.Data;

import java.util.Date;

/**
 */
@Data
public class PassengerWallet {
    private Integer id;

    private Integer passengerInfoId;

    private Double capital;

    private Double giveFee;

    private Double freezeCapital;

    private Double freezeGiveFee;

    private Date createTime;

    private Date updateTime;

}