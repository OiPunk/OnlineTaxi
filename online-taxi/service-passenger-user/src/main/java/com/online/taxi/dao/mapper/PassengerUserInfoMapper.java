package com.online.taxi.dao.mapper;

import com.online.taxi.dao.entity.PassengerUserInfo;

public interface PassengerUserInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PassengerUserInfo record);

    int insertSelective(PassengerUserInfo record);

    PassengerUserInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PassengerUserInfo record);

    int updateByPrimaryKey(PassengerUserInfo record);
}