package com.rydr.jms;

import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.rydr.constatnt.QueueNames;

/**
 * Message queue configuration
 *
 * @date 2018/8/24
 */
@Configuration
public class SupervisionDestination {

    /**
     * Reporting queue
     *
     * @return queue
     */
    @Bean
    public ActiveMQQueue generalQueue() {
        return new ActiveMQQueue(QueueNames.GENERAL_QUEUE);
    }

    /**
     * Driving trajectory queue
     *
     * @return queue
     */
    @Bean
    public ActiveMQQueue positionQueue() {
        return new ActiveMQQueue(QueueNames.POSITION_QUEUE);
    }

    /**
     * Buffer queue
     *
     * @return queue
     */
    @Bean
    public ActiveMQQueue bufferQueue() {
        return new ActiveMQQueue(QueueNames.BUFFER_QUEUE);
    }

}
