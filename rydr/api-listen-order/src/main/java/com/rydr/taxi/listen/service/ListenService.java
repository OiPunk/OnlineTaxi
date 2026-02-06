package com.rydr.taxi.listen.service;

import com.rydr.taxi.listen.response.PreGrabResponse;

/**
 * @author oi
 */
public interface ListenService {
    /**
     *
     * @param driverId
     * @return
     */
    public PreGrabResponse listen(int driverId);
}
