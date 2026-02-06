package com.rydr.taxi.eureka;

import org.springframework.cloud.netflix.eureka.server.event.EurekaInstanceCanceledEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class CustomEvent {

	@EventListener
	public void listen(EurekaInstanceCanceledEvent e) {
		System.out.println(e.getServerId()+" offline event");
		// Send email, SMS, or phone call.
	}
}
