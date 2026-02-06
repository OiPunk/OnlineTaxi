package com.rydr.taxi.passenger.feign.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.rydr.taxi.passenger.annotation.ExcudeFeignConfig;

import feign.Feign;

@Configuration
@ExcudeFeignConfig
public class FeignDisableHystrixConfiguration {

	/**
	 * 	singleton means a single instance in the Spring container; always returns the same instance when obtained from the container
	 *	prototype means a new object is created each time the bean is obtained
	 *	request means valid within a single HTTP request (only applicable to web applications)
	 *	session means valid within a user session (only applicable to web applications)
	 *	globalSession means valid within a global session (only applicable to web applications)
	 *	In most cases, we only use singleton and prototype scopes. If scope is not specified in the Spring configuration, the default is singleton.
	 * @return
	 */
	@Bean
	@Scope("prototype")
	public Feign.Builder feignBuilder(){
		return Feign.builder();
	}
}
