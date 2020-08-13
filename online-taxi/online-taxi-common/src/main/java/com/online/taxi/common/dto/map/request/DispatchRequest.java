package com.online.taxi.dto.map.request;

import lombok.Data;
/**
 * 
 */
@Data
public class DispatchRequest {
	
	private String orderId;
	
	private String customerDeviceId;
	
	private Integer orderType;
	
	private Integer vehicleType;
	
	private String orderCity;
	
	private Long orderTime;
	
	private Long startTime;
	
	private String startName;
	
	private String startLongitude;
	
	private String startLatitude;
	
	private String endName;
	
	private String endLongitude;
	
	private String endLatitude;
	
	private Integer radius;
	
	private Integer maxCount;
}
