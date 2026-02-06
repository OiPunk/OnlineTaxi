package com.online.taxi.event;

import org.springframework.cloud.bus.jackson.RemoteApplicationEventScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;

@Configuration
@RemoteApplicationEventScan
public class BusConfiguration {

	@EventListener
	public void onUserRemoteApplicationEvent(CustomRemoteApplicationEvent event) {
		System.out.println("Origin service: "+event.getOriginService()+", content: "+event.getSource());
	}
}
