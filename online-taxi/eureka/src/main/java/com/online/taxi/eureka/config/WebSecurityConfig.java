package com.online.taxi.eureka.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
/**
 * @author oi
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// Disable CSRF
//		http.csrf().disable();
		/*
		 * By default, applications with SpringSecurity dependency require a CSRF token for every request. Eureka clients do not add one during registration, so the /eureka/** path needs to be configured to not require a CSRF token.
		 */
		http.csrf().ignoringAntMatchers("/eureka/**");
		// Enable authentication with HttpBasic support
		http.authorizeRequests().anyRequest().authenticated().and().httpBasic();
	}
}
