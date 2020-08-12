package com.online.taxi.valuation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
/**
 * @author oi
 */
@EnableEurekaClient
@SpringBootApplication
public class ServiceValuationApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceValuationApplication.class, args);
	}

}
