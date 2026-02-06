package com.rydr.taxi.configserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;
/**
 * @author oi
 */
@EnableConfigServer
@SpringBootApplication
public class RydrConfigServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(RydrConfigServerApplication.class, args);
	}

}
