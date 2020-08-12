package com.online.taxi.passenger.service;

import com.online.taxi.common.dto.ResponseResult;

public interface AuthService {

    public ResponseResult auth(String passengerPhone, String code);
}
