package com.rydr.passenger.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rydr.dto.ResponseResult;
import com.rydr.common.dto.order.ForecastRequest;
import com.rydr.common.dto.order.ForecastResponse;
import com.rydr.passenger.annotation.ExcudeFeignConfig;
import com.rydr.passenger.feign.config.FeignAuthConfiguration;

/**
 * 
 * @author oi
 *
 */
//@FeignClient(name = "service-valuation",configuration = FeignAuthConfiguration.class)
@FeignClient(name = "service-valuation")
public interface ServiceForecast {
	
	@RequestMapping(value = "/forecast/single",method = RequestMethod.POST)
	public ResponseResult<ForecastResponse> forecast(@RequestBody ForecastRequest forecastRequest);
	
}
