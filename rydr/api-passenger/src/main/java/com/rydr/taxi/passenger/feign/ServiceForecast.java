package com.rydr.taxi.passenger.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rydr.taxi.common.dto.ResponseResult;
import com.rydr.taxi.common.dto.order.ForecastRequest;
import com.rydr.taxi.common.dto.order.ForecastResponse;
import com.rydr.taxi.passenger.annotation.ExcudeFeignConfig;
import com.rydr.taxi.passenger.feign.config.FeignAuthConfiguration;

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
