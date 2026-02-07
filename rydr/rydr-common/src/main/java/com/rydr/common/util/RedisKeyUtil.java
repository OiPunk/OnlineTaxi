package com.rydr.common.util;

import com.rydr.common.constant.IdentityConstant;
import com.rydr.common.constant.RedisKeyPrefixConstant;

public class RedisKeyUtil {
    /**
     * Generate the corresponding cache key based on identity type
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
