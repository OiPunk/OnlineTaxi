package com.online.taxi.zuul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

/**
 * @author oi
 */
@SpringBootApplication
@EnableZuulProxy
public class OnlineTaxiZuulApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineTaxiZuulApplication.class, args);
	}

}
