package com.online.taxi.service;

/**
 * @author oi
 */
public interface TokenService {
    /**
     * 生成token
     * @param subject
     * @return
     */
    public String createToken(String subject);
}
