package com.rydr.taxi.jms.produce.component;

import org.springframework.stereotype.Component;

/**
 * Message consumer (Queue mode)
 */
@Component
public class ConsumerQueue {
    /**
     * Use JmsListener to configure the queue monitored by the consumer, where text is the received message
     * @param text
     */
//   @JmsListener(destination = "ActiveMQQueue",containerFactory = "jmsListenerContainerQueue")
   public void receiveQueue(String text) {
                  System.out.println("Message consumer received message: "+text);
   }
}
