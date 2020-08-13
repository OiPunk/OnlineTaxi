package com.online.taxi.entity;

import java.util.Date;

public class CarDispatchTimeThresholdSet {
    private Integer id;

    private String cityCode;

    private Integer serviceTypeId;

    private Boolean timeThresholdType;

    private Integer timeThreshold;

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

    public Boolean getTimeThresholdType() {
        return timeThresholdType;
    }

    public void setTimeThresholdType(Boolean timeThresholdType) {
        this.timeThresholdType = timeThresholdType;
    }

    public Integer getTimeThreshold() {
        return timeThreshold;
    }

    public void setTimeThreshold(Integer timeThreshold) {
        this.timeThreshold = timeThreshold;
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