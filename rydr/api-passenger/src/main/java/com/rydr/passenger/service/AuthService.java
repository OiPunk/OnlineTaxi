package com.rydr.passenger.service;

import com.rydr.dto.ResponseResult;

public interface AuthService {

    public ResponseResult auth(String passengerPhone, String code);
}
