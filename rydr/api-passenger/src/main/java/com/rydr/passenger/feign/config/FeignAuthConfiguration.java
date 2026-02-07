package com.rydr.passenger.feign.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.rydr.passenger.annotation.ExcudeFeignConfig;

import feign.auth.BasicAuthRequestInterceptor;
@ExcudeFeignConfig
public class FeignAuthConfiguration {
	
	@Bean
	public BasicAuthRequestInterceptor basicAuthRequestInterceptor() {
		return new BasicAuthRequestInterceptor("root", "root");
	}
}