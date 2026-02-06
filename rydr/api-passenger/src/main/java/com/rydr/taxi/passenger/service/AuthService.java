package com.rydr.taxi.passenger.service;

import com.rydr.taxi.common.dto.ResponseResult;

public interface AuthService {

    public ResponseResult auth(String passengerPhone, String code);
}
