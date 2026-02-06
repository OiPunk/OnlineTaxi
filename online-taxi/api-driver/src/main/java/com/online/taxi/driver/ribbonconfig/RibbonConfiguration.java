package com.online.taxi.driver.ribbonconfig;

import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.netflix.loadbalancer.ILoadBalancer;
import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RandomRule;
import com.online.taxi.driver.annotation.ExcudeRibbonConfig;
/**
 * This class should not be under the main application's component scan; the startup class scan configuration needs to be modified.
 *
 * @author oi
 *
 */
@Configuration
@ExcudeRibbonConfig
public class RibbonConfiguration {

//	@Bean
//	@LoadBalanced
//	public RestTemplate restTemplate() {
//		return new RestTemplate();
//	}

	/**
	 * Modify IRule
	 * @return
	 */
	@Bean
	public IRule ribbonRule() {
		return new RandomRule();
	}

	/**
	 * Custom rule
	 * @return
	 */
//	@Bean
//	public IRule ribbonRule() {
//		return new MsbRandomRule();
//	}

}
