package com.online.taxi.entity;

import java.util.Date;

public class CarDispatchDistributeRadiusSet {
    private Integer id;

    private String cityCode;

    private Integer serviceTypeId;

    private Integer minRadius;

    private Integer minRadiusFirstPushDriverCount;

    private Integer maxRadius;

    private Integer maxRadiusFirstPushDriverCount;

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

    public Integer getMinRadius() {
        return minRadius;
    }

    public void setMinRadius(Integer minRadius) {
        this.minRadius = minRadius;
    }

    public Integer getMinRadiusFirstPushDriverCount() {
        return minRadiusFirstPushDriverCount;
    }

    public void setMinRadiusFirstPushDriverCount(Integer minRadiusFirstPushDriverCount) {
        this.minRadiusFirstPushDriverCount = minRadiusFirstPushDriverCount;
    }

    public Integer getMaxRadius() {
        return maxRadius;
    }

    public void setMaxRadius(Integer maxRadius) {
        this.maxRadius = maxRadius;
    }

    public Integer getMaxRadiusFirstPushDriverCount() {
        return maxRadiusFirstPushDriverCount;
    }

    public void setMaxRadiusFirstPushDriverCount(Integer maxRadiusFirstPushDriverCount) {
        this.maxRadiusFirstPushDriverCount = maxRadiusFirstPushDriverCount;
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