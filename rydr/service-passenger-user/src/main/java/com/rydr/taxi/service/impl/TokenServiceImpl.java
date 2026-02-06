package com.rydr.taxi.service.impl;

import com.rydr.taxi.common.util.JwtUtil;
import com.rydr.taxi.service.TokenService;

import java.util.Date;

/**
 * @author oi
 */
public class TokenServiceImpl implements TokenService {

    /**
     * Generate token
     * @param subject
     * @return
     */
    @Override
    public String createToken(String subject) {
        String jwtStr = JwtUtil.createToken(subject,new Date());
        // Store in cache, set expiration time
        return null;
    }
}
