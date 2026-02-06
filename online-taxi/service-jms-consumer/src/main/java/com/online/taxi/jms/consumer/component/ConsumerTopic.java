package com.online.taxi.jms.consumer.component;

import org.springframework.jms.annotation.JmsListener;
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
    @JmsListener(destination = "ActiveMQTopic",containerFactory = "jmsListenerContainerTopic")
    public void receiveTopic1(String text) {
        System.out.println("Message consumer received Topic1 message: " + text);
    }

    @JmsListener(destination = "ActiveMQTopic",containerFactory = "jmsListenerContainerTopic")
    public void receiveTopic2(String text) {
        System.out.println("Message consumer received Topic2 message: " + text);
    }
}
