package com.online.taxi.constatnt;

/**
 * 队列名称
 *
 * @date 2018/8/24
 */
public interface QueueNames {

    /**
     * 缓冲队列
     */
    String BUFFER_QUEUE = "yesincar.buffer";

    /**
     * 上报队列
     */
    String GENERAL_QUEUE = "yesincar.queue";

    /**
     * 行驶轨迹队列
     */
    String POSITION_QUEUE = "yesincar.position";
}