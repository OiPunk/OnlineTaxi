package com.online.taxi.entity;

import java.util.Date;

public class CarDispatchDirectRouteOrderRadiusSet {
    private Integer id;

    private String cityCode;

    private Integer serviceTypeId;

    private Boolean directRouteOrderType;

    private Integer directRouteOrderRadius;

    private Boolean isDelete;

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

    public Boolean getDirectRouteOrderType() {
        return directRouteOrderType;
    }

    public void setDirectRouteOrderType(Boolean directRouteOrderType) {
        this.directRouteOrderType = directRouteOrderType;
    }

    public Integer getDirectRouteOrderRadius() {
        return directRouteOrderRadius;
    }

    public void setDirectRouteOrderRadius(Integer directRouteOrderRadius) {
        this.directRouteOrderRadius = directRouteOrderRadius;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
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