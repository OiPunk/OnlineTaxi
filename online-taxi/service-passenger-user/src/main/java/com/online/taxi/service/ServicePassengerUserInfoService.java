package com.online.taxi.service;

import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.dao.entity.PassengerUserInfo;

public interface ServicePassengerUserInfoService {

    public ResponseResult<PassengerUserInfo> login(String  passengerPhone);

}
