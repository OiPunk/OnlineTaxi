package com.online.taxi.dto.map.request;

import lombok.Data;
/**
 * 
 */
@Data
public class OrderRequest {
	
	private String orderId;
	
	private String customerDeviceId;
	
	private Integer type;
	
	private Integer status;
	
	private Long statusTime;
	
	private String orderCity;
	
	private String vehicleId;
	
	private Integer vehicleType;
	
	private String vehicleLongitude;
	
	private String vehicleLatitude;
	
	private String startLongitude;
	
	private String startLatitude;
	
	private String startName;
	
	private String endLongitude;
	
	private String endLatitude;
	
	private String endName;
	
	private String userLongitude;
	
	private String userLatitude;
	
	private String serviceStartLongitude;
	
	private String serviceStartLatitude;
	
	private String chargeStartLongitude;
	
	private String chargeStartLatitude;
	
	private String chargeEndLongitude;
	
	private String chargeEndLatitude;
	
}
