package com.rydr.jms.consumer.config;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.RedeliveryPolicy;
import org.apache.activemq.command.ActiveMQQueue;
import org.apache.activemq.command.ActiveMQTopic;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jms.config.DefaultJmsListenerContainerFactory;
import org.springframework.jms.config.JmsListenerContainerFactory;
import org.springframework.jms.core.JmsTemplate;

import javax.jms.Queue;
import javax.jms.Topic;

@Configuration
public class ActiveMQConfig {

    @Value("${spring.activemq.broker-url}")
    private  String brokerUrl;

    @Bean
    public Queue queue() {
        return new ActiveMQQueue("ActiveMQQueue");
    }

    @Bean
    public Topic topic(){
        return new ActiveMQTopic("ActiveMQTopic");
    }


    @Bean
    public ActiveMQConnectionFactory connectionFactory(RedeliveryPolicy redeliveryPolicy) {

        ActiveMQConnectionFactory activeMQConnectionFactory =
                new ActiveMQConnectionFactory(
                        "admin",
                        "admin",
                        brokerUrl);
        activeMQConnectionFactory.setRedeliveryPolicy(redeliveryPolicy);
        return activeMQConnectionFactory;
    }

    /**
     * Queue mode connection injection
     */
    @Bean
    public JmsListenerContainerFactory<?> jmsListenerContainerQueue(ActiveMQConnectionFactory connectionFactory){
        DefaultJmsListenerContainerFactory bean = new DefaultJmsListenerContainerFactory();
        bean.setConnectionFactory(connectionFactory);

        bean.setConnectionFactory(connectionFactory);
        /**
         * Client manual acknowledgment, which means ActiveMQ will not automatically ACK any messages.
         * If a consumer does not call message.acknowledge() to acknowledge a message before consumption ends,
         * other consumers will consume it again when called, because for the broker, messages that have not
         * been truly ACKed are considered unconsumed until they are acknowledged.
         */
        bean.setSessionAcknowledgeMode(2);
        return bean;
    }

    /**
     * Topic mode connection injection
     * @param connectionFactory
     * @return
     */
    @Bean
    public JmsListenerContainerFactory<?> jmsListenerContainerTopic(ActiveMQConnectionFactory connectionFactory){
        DefaultJmsListenerContainerFactory bean = new DefaultJmsListenerContainerFactory();
        // Set to publish-subscribe mode, default is producer-consumer mode
        bean.setPubSubDomain(true);
        bean.setConnectionFactory(connectionFactory);
        return bean;
    }

    @Bean
    public RedeliveryPolicy redeliveryPolicy(){
        RedeliveryPolicy  redeliveryPolicy=   new RedeliveryPolicy();
//        // Whether to increase the wait time after each failed redelivery attempt
//        redeliveryPolicy.setUseExponentialBackOff(true);
//        // Number of redelivery attempts, default is 6, set to 10 here
//        redeliveryPolicy.setMaximumRedeliveries(10);
//        // Redelivery time interval, default is 1 second
//        redeliveryPolicy.setInitialRedeliveryDelay(1);
//        // Wait 500ms before resending after first failure, wait 500 * 2ms after second failure, where 2 is the value
//        redeliveryPolicy.setBackOffMultiplier(2);
//        // Whether to avoid message collision
//        redeliveryPolicy.setUseCollisionAvoidance(false);
//        // Set maximum redelivery delay, -1 means no delay, only effective when UseExponentialBackOff(true) is true
//        redeliveryPolicy.setMaximumRedeliveryDelay(-1);
        return redeliveryPolicy;
    }

    @Bean
    public JmsTemplate jmsTemplate(ActiveMQConnectionFactory activeMQConnectionFactory, Queue queue){
        JmsTemplate jmsTemplate=new JmsTemplate();
        jmsTemplate.setDeliveryMode(2);// Configure persistence: 1 means non-persistent, 2 means persistent
        jmsTemplate.setConnectionFactory(activeMQConnectionFactory);
        jmsTemplate.setDefaultDestination(queue); // Default destination can be omitted here, can also be set when sending messages
        jmsTemplate.setSessionAcknowledgeMode(4);// Client acknowledgment mode
        return jmsTemplate;
    }

}
