package com.online.taxi.common.util;

import com.online.taxi.common.constant.IdentityConstant;
import com.online.taxi.common.constant.RedisKeyPrefixConstant;

public class RedisKeyUtil {
    /**
     * 根据身份类型生成对应的缓存key
     * @param identity
     * @return
     */
    public static String generateKeyPreByIdentity(int identity){
        String keyPre = "";
        if (identity == IdentityConstant.PASSENGER){
            keyPre = RedisKeyPrefixConstant.PASSENGER_LOGIN_KEY_PRE;
        }else if (identity == IdentityConstant.DRIVER){
            keyPre = RedisKeyPrefixConstant.DRIVER_LOGIN_KEY_PRE;
        }
        return keyPre;
    }
}
