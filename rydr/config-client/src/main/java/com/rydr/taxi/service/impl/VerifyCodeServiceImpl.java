package com.rydr.taxi.service.impl;

import com.rydr.taxi.common.constant.CommonStatusEnum;
import com.rydr.taxi.common.constant.IdentityConstant;
import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.common.dto.verificationcode.VerifyCodeResponse;
import com.rydr.taxi.constant.VerifyCodeConstant;
import com.rydr.taxi.service.VerifyCodeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;
/**
 * @author oi
 */
@Service
public class VerifyCodeServiceImpl implements VerifyCodeService {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Override
    public ResponseResult generate(int identity , String phoneNumber){

        // Validate sending time limit
        checkSendCodeTimeLimit(phoneNumber);

        // Generate 6-digit code
        String code = String.valueOf((int)((Math.random()*9+1)*100000));

        // Generate Redis key
        String keyPre = generateKeyPreByIdentity(identity);
        String key = keyPre + phoneNumber;
        // Store in Redis, expires in 2 minutes
        BoundValueOperations<String, String> codeRedis = redisTemplate.boundValueOps(key);
        codeRedis.set(code);
        codeRedis.expire(120, TimeUnit.SECONDS);

        // Return result
        VerifyCodeResponse result = new VerifyCodeResponse();
        result.setCode(code);
        return ResponseResult.success(result);
    }

    @Override
    public ResponseResult verify(int identity,String phoneNumber,String code){
        // Three-level verification


        // Generate Redis key
        String keyPre = generateKeyPreByIdentity(identity);
        String key = keyPre + phoneNumber;
        BoundValueOperations<String, String> codeRedis = redisTemplate.boundValueOps(key);
        String redisCode = codeRedis.get();

        if(StringUtils.isNotBlank(code)
                && StringUtils.isNotBlank(redisCode)
                && code.trim().equals(redisCode.trim())) {
            return ResponseResult.success(null);
        }else {
            return ResponseResult.fail(CommonStatusEnum.VERIFY_CODE_ERROR.getCode(), CommonStatusEnum.VERIFY_CODE_ERROR.getValue());
        }

    }

    /**
     * Generate the corresponding cache key based on identity type
     * @param identity
     * @return
     */
    private String generateKeyPreByIdentity(int identity){
        String keyPre = "";
        if (identity == IdentityConstant.PASSENGER){
            keyPre = VerifyCodeConstant.PASSENGER_LOGIN_KEY_PRE;
        }else if (identity == IdentityConstant.DRIVER){
            keyPre = VerifyCodeConstant.DRIVER_LOGIN_KEY_PRE;
        }
        return keyPre;
    }

    /**
     * Check the sending time limit for this phone number
     * @param phoneNumber
     * @return
     */
    private ResponseResult checkSendCodeTimeLimit(String phoneNumber){
        // Check if there are limits for 1 minute, 10 minutes, or 24 hours.

        return ResponseResult.success("");
    }

    /**
     * Three-level verification check
     * @param phoneNumber
     * @param code
     * @return
     */
    private ResponseResult checkCodeThreeLimit(String phoneNumber,String code){
        // See flowchart

        return ResponseResult.success("");
    }
}
