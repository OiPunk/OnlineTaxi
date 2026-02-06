package com.rydr.taxi.order.dao;

import org.apache.ibatis.annotations.Mapper;

import com.rydr.taxi.common.entity.Order;

@Mapper
public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderid);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}