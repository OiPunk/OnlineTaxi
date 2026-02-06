package com.rydr.taxi.zuul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

/**
 * @author oi
 */
@SpringBootApplication
@EnableZuulProxy
public class RydrZuulApplication {

	public static void main(String[] args) {
		SpringApplication.run(RydrZuulApplication.class, args);
	}

}
