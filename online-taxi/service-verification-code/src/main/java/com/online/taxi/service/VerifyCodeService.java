package com.online.taxi.service;

import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.common.dto.verificationcode.VerifyCodeResponse;
/**
 * @author oi
 */
public interface VerifyCodeService {

    /**
     * Generate verification code based on identity and phone number
     * @param identity
     * @param phoneNumber
     * @return
     */
    public ResponseResult<VerifyCodeResponse> generate(int identity , String phoneNumber);

    /**
     * Verify the validity of identity, phone number, and verification code
     * @param identity
     * @param phoneNumber
     * @param code
     * @return
     */
    public ResponseResult verify(int identity,String phoneNumber,String code);
}
