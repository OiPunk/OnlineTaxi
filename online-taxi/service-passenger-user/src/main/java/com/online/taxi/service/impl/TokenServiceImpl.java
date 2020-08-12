package com.online.taxi.service.impl;

import com.online.taxi.common.util.JwtUtil;
import com.online.taxi.service.TokenService;

import java.util.Date;

/**
 * @author oi
 */
public class TokenServiceImpl implements TokenService {

    /**
     * 生成token
     * @param subject
     * @return
     */
    @Override
    public String createToken(String subject) {
        String jwtStr = JwtUtil.createToken(subject,new Date());
        //存缓存，设置过期时间
        return null;
    }
}
