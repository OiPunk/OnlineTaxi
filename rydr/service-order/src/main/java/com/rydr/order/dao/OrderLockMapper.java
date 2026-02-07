package com.rydr.order.dao;

import org.apache.ibatis.annotations.Mapper;

import com.rydr.common.entity.OrderLock;

@Mapper
public interface OrderLockMapper {
	
    int deleteByPrimaryKey(Integer orderId);

    int insertSelective(OrderLock record);
}