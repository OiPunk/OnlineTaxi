package com.online.taxi.service.impl;

import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.dao.entity.PassengerUserInfo;
import com.online.taxi.dao.mapper.PassengerUserInfoCustomMapper;
import com.online.taxi.service.ServicePassengerUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ServicePassengerUserInfoServiceImpl implements ServicePassengerUserInfoService {

    @Autowired
    private PassengerUserInfoCustomMapper passengerInfoMapperCustom;

    @Override
    public ResponseResult<PassengerUserInfo> login(String  passengerPhone) {
        // Query user info by phone number
        PassengerUserInfo passengerUserInfo = passengerInfoMapperCustom.selectByPhoneNumber(passengerPhone);
        if (passengerUserInfo == null){
            // There may be concurrency issues here. Can be resolved via database unique index or distributed lock.

            // If not found, insert and return 1
            passengerUserInfo = new PassengerUserInfo();
            passengerUserInfo.setPassengerPhone(passengerPhone);
            passengerUserInfo.setRegisterDate(new Date());
            passengerInfoMapperCustom.insertSelective(passengerUserInfo);


        }

        // Record login time

        return ResponseResult.success(passengerUserInfo);
    }


}
