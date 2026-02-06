package com.online.taxi.admin;

import org.springframework.cloud.client.discovery.event.HeartbeatEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class CustomEvent {

	@EventListener
	public void listen(HeartbeatEvent e) {
		System.out.println(e.getSource()+"  admin monitoring");
		// Send email, SMS, or phone call.
	}
}
