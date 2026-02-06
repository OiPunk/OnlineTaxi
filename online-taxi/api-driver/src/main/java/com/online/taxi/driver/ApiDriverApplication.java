package com.online.taxi.driver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.netflix.ribbon.RibbonClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.client.RestTemplate;

import com.online.taxi.driver.annotation.ExcudeRibbonConfig;
import com.online.taxi.driver.ribbonconfig.RibbonConfiguration;

/**
 * @author oi
 */

@SpringBootApplication
@EnableCircuitBreaker
//@EnableHystrix
// Scan excludes classes annotated with the specified annotation
@ComponentScan(
        basePackages = {"com.online.taxi"},
        excludeFilters = {
		    @ComponentScan.Filter(type = FilterType.ANNOTATION,value=ExcudeRibbonConfig.class)
        }
 )
// Below enables random strategy for all clients
//@RibbonClients(defaultConfiguration = RibbonConfiguration.class)
//@RibbonClient(name = "service-sms",configuration = RibbonConfiguration.class)
public class ApiDriverApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiDriverApplication.class, args);
	}


	@Bean
	@LoadBalanced
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}

	/**
	 * Simple manual ribbon implementation
	 * @return
	 */
//	@Bean
//	public RestTemplate restTemplate() {
//		return new RestTemplate();
//	}

}
