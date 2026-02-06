package com.rydr.taxi.service;

import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.dao.entity.PassengerUserInfo;

public interface ServicePassengerUserInfoService {

    public ResponseResult<PassengerUserInfo> login(String  passengerPhone);

}
