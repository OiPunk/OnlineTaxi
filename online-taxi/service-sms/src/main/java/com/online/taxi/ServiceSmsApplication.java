package com.online.taxi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
/**
 * @author oi
 */
@EnableDiscoveryClient
@SpringBootApplication
public class ServiceSmsApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(ServiceSmsApplication.class, args);
	}

}
