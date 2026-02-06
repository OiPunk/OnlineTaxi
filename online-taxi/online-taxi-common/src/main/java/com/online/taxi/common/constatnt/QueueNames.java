package com.online.taxi.constatnt;

/**
 * Queue names
 *
 * @date 2018/8/24
 */
public interface QueueNames {

    /**
     * Buffer queue
     */
    String BUFFER_QUEUE = "yesincar.buffer";

    /**
     * Reporting queue
     */
    String GENERAL_QUEUE = "yesincar.queue";

    /**
     * Driving trajectory queue
     */
    String POSITION_QUEUE = "yesincar.position";
}
