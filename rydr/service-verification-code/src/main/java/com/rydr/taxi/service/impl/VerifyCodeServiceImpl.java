package com.rydr.taxi.service.impl;

import com.rydr.taxi.common.constant.CommonStatusEnum;
import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.common.dto.verificationcode.VerifyCodeResponse;
import com.rydr.taxi.common.util.RedisKeyUtil;
import com.rydr.taxi.service.VerifyCodeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Random;
import java.util.concurrent.TimeUnit;
/**
 * @author oi
 */
@Service
public class VerifyCodeServiceImpl implements VerifyCodeService {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    /**
     * Generate verification code
     * @param identity
     * @param phoneNumber
     * @return
     */
    @Override
    public ResponseResult generate(int identity , String phoneNumber){

        // Validate send time limit, three-tier verification, cannot send SMS without restrictions
//        checkSendCodeTimeLimit(phoneNumber);

        String code = String.valueOf((int)((Math.random()*9+1)*Math.pow(10,5)));

        /**
         * Some people use this approach to generate a 6-digit code. Incorrect usage - although the result is correct most of the time, it should not be used this way as occasionally the number of digits may be insufficient.
         */
//        String code = String.valueOf(new Random().nextInt(1000000));

        // Generate Redis key
        String keyPre = RedisKeyUtil.generateKeyPreByIdentity(identity);
        String key = keyPre + phoneNumber;
        // Store in Redis, expires in 2 minutes
        BoundValueOperations<String, String> codeRedis = redisTemplate.boundValueOps(key);
        // This should ideally be an atomic operation, not separated.
//        codeRedis.set(code,120, TimeUnit.SECONDS);
        codeRedis.set(code,120, TimeUnit.MINUTES);

        // Return result
        VerifyCodeResponse result = new VerifyCodeResponse();
        result.setCode(code);
        return ResponseResult.success(result);
    }

    @Override
    public ResponseResult verify(int identity,String phoneNumber,String code){
        // Three-tier verification


        // Generate Redis key
        String keyPre = RedisKeyUtil.generateKeyPreByIdentity(identity);
        String key = keyPre + phoneNumber;
        BoundValueOperations<String, String> codeRedis = redisTemplate.boundValueOps(key);
        String redisCode = codeRedis.get();

        if(StringUtils.isNotBlank(code)
                && StringUtils.isNotBlank(redisCode)
                && code.trim().equals(redisCode.trim())) {
            return ResponseResult.success("");
        }else {
            return ResponseResult.fail(CommonStatusEnum.VERIFY_CODE_ERROR.getCode(), CommonStatusEnum.VERIFY_CODE_ERROR.getValue());
        }

    }


    /**
     * Check send time limit for this phone number
     * @param phoneNumber
     * @return
     */
    private ResponseResult checkSendCodeTimeLimit(String phoneNumber){
        // Check if there are limits for 1 minute, 10 minutes, 24 hours.

        return ResponseResult.success("");
    }

    public static void main(String[] args) {

        for (int i = 0; i < 5000; i++) {
            String code = String.valueOf(new Random().nextInt(1000000));
//            String code = String.valueOf((int)((Math.random()*9+1)*Math.pow(10,5)));
            if (code.length()<6){
                System.out.println("There are numbers with fewer than 6 digits");
            }
        }


    }
}
