package com.rydr.jms.produce.service;

import javax.jms.Destination;

/**
 * @author oi
 */
public interface ProduceService {

    /**
     * Send message to specified queue
     * @param destination
     * @param message
     */
    public void send(Destination destination , String message);
}
