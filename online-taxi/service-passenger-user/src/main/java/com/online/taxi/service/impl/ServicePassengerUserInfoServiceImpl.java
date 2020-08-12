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
        // 根据手机号查询 用户信息
        PassengerUserInfo passengerUserInfo = passengerInfoMapperCustom.selectByPhoneNumber(passengerPhone);
        if (passengerUserInfo == null){
            // 这块会有并发问题。可以通过 数据库唯一索引实现。也可以通过分布锁。

            // 如果没有 插入 return 1；
            passengerUserInfo = new PassengerUserInfo();
            passengerUserInfo.setPassengerPhone(passengerPhone);
            passengerUserInfo.setRegisterDate(new Date());
            passengerInfoMapperCustom.insertSelective(passengerUserInfo);


        }

        // 记录登录时间

        return ResponseResult.success(passengerUserInfo);
    }


}
