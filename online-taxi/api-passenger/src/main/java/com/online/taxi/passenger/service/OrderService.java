package com.online.taxi.passenger.service;

import com.online.taxi.common.dto.order.ForecastRequest;

/**
 *
 * @author oi
 *
 */
public interface OrderService {
	/**
	 * Calculate estimated price based on start and end coordinates
	 * @param forecastRequest
	 * @return
	 */
	public Double forecast(ForecastRequest forecastRequest) ;
}
