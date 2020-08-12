package com.online.taxi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
/**
 * @author oi
 */
@EnableEurekaClient
@SpringBootApplication
public class ServicePassengerUserApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServicePassengerUserApplication.class, args);
	}

}
