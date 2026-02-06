package com.rydr.taxi.dao.mapper;

import com.rydr.taxi.dao.entity.PassengerUserInfo;

public interface PassengerUserInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PassengerUserInfo record);

    int insertSelective(PassengerUserInfo record);

    PassengerUserInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PassengerUserInfo record);

    int updateByPrimaryKey(PassengerUserInfo record);
}