package com.rydr.jms.produce.component;

import org.springframework.stereotype.Component;

/**
 * Message consumer (Topic mode)
 */
@Component
public class ConsumerTopic {
    /**
     * Use JmsListener to configure the queue monitored by the consumer, where text is the received message
     * @param text
     */
//    @JmsListener(destination = "ActiveMQTopic", containerFactory = "jmsListenerContainerTopic")
    public void receiveQueue(String text) {
        System.out.println("Message consumer received Topic message: " + text);
    }
}
