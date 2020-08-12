package com.online.taxi.service.impl;

import com.online.taxi.common.constant.CommonStatusEnum;
import com.online.taxi.common.dto.ResponseResult;
import com.online.taxi.common.dto.verificationcode.VerifyCodeResponse;
import com.online.taxi.common.util.RedisKeyUtil;
import com.online.taxi.service.VerifyCodeService;
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
     * 生成验证码
     * @param identity
     * @param phoneNumber
     * @return
     */
    @Override
    public ResponseResult generate(int identity , String phoneNumber){

        //校验 发送时限，三挡验证，不能无限制发短信
//        checkSendCodeTimeLimit(phoneNumber);

        String code = String.valueOf((int)((Math.random()*9+1)*Math.pow(10,5)));

        /**
         * 有人用这种写法。生成6位code，错误用法，虽然大部分情况下结果正确，但不能这么用，偶尔位数不够？
         */
//        String code = String.valueOf(new Random().nextInt(1000000));

        //生成redis key
        String keyPre = RedisKeyUtil.generateKeyPreByIdentity(identity);
        String key = keyPre + phoneNumber;
        //存redis，2分钟过期
        BoundValueOperations<String, String> codeRedis = redisTemplate.boundValueOps(key);
        // 此处最好是原子操作，不要分开。
//        codeRedis.set(code,120, TimeUnit.SECONDS);
        codeRedis.set(code,120, TimeUnit.MINUTES);

        //返回
        VerifyCodeResponse result = new VerifyCodeResponse();
        result.setCode(code);
        return ResponseResult.success(result);
    }

    @Override
    public ResponseResult verify(int identity,String phoneNumber,String code){
        //三档验证


        //生成redis key
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
     * 判断此手机号发送时限限制
     * @param phoneNumber
     * @return
     */
    private ResponseResult checkSendCodeTimeLimit(String phoneNumber){
        //判断是否有 限制1分钟，10分钟，24小时。

        return ResponseResult.success("");
    }

    public static void main(String[] args) {

        for (int i = 0; i < 5000; i++) {
            String code = String.valueOf(new Random().nextInt(1000000));
//            String code = String.valueOf((int)((Math.random()*9+1)*Math.pow(10,5)));
            if (code.length()<6){
                System.out.println("有小于6位长的数");
            }
        }


    }
}
