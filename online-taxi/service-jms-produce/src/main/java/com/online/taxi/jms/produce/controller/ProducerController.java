package com.online.taxi.jms.produce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.jms.Queue;
import javax.jms.Topic;

@RestController
@RequestMapping("/produce")
public class ProducerController {

    // Inject point-to-point mode (Queue mode)
    @Autowired
    private Queue queue;

    // Inject publish-subscribe mode (Topic) message
    @Autowired
    private Topic topic;

    // Inject Spring Boot wrapped utility class
    @Autowired
    private JmsMessagingTemplate jms;


    /**
     * Send message in point-to-point (queue) mode
     * @param text
     */
    @GetMapping("/queue-send")
    @ResponseBody
    public String queueSend(String text) {
        // Send message to message middleware broker
        jms.convertAndSend(queue, text);

        return "success";
    }

    /**
     * Send message in publish-subscribe (topic) mode
     * @param text
     * @return
     */
    @RequestMapping("/topic-send")
    public String topicSend(String text){
        jms.convertAndSend(topic,text);
        return "Topic sent successfully";
    }

}
