package com.online.taxi.entity;

import java.util.Date;

public class CarDispatchDistributeSet {
    private Integer id;

    private String cityCode;

    private Boolean isForceDistribute;

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

    public Boolean getIsForceDistribute() {
        return isForceDistribute;
    }

    public void setIsForceDistribute(Boolean isForceDistribute) {
        this.isForceDistribute = isForceDistribute;
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