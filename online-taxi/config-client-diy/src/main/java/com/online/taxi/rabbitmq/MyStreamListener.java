package com.online.taxi.rabbitmq;

import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.cloud.stream.messaging.Sink;

@EnableBinding(Sink.class)
public class MyStreamListener {

    @StreamListener(Sink.INPUT)
    public void input(String s){

        System.out.println("Listening to message queue manual content: " + s);
    }
}
