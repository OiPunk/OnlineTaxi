package com.online.taxi.service;

/**
 * @author oi
 */
public interface TokenService {
    /**
     * Generate token
     * @param subject
     * @return
     */
    public String createToken(String subject);
}
