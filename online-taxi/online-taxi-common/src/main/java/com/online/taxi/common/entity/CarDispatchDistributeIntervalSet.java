package com.online.taxi.entity;

import java.util.Date;

public class CarDispatchDistributeIntervalSet {
    private Integer id;

    private String cityCode;

    private Integer serviceTypeId;

    private Integer carServiceBeforeInterval;

    private Integer carServiceAfterInterval;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode == null ? null : cityCode.trim();
    }

    public Integer getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public Integer getCarServiceBeforeInterval() {
        return carServiceBeforeInterval;
    }

    public void setCarServiceBeforeInterval(Integer carServiceBeforeInterval) {
        this.carServiceBeforeInterval = carServiceBeforeInterval;
    }

    public Integer getCarServiceAfterInterval() {
        return carServiceAfterInterval;
    }

    public void setCarServiceAfterInterval(Integer carServiceAfterInterval) {
        this.carServiceAfterInterval = carServiceAfterInterval;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}