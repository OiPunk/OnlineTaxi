package com.rydr.service;

import com.rydr.dto.ResponseResult;
import com.rydr.dao.entity.PassengerUserInfo;

public interface ServicePassengerUserInfoService {

    public ResponseResult<PassengerUserInfo> login(String  passengerPhone);

}
