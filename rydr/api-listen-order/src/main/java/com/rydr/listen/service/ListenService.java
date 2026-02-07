package com.rydr.listen.service;

import com.rydr.listen.response.PreGrabResponse;

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
