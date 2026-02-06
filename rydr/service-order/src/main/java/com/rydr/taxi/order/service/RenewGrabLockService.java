package com.rydr.taxi.order.service;

/**
 * @author oi
 */
public interface RenewGrabLockService {

    /**
     * Renew lock
     * @param key
     * @param value
     * @param time
     */
    public void renewLock(String key , String value , int time);
}
