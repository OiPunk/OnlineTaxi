package com.rydr.taxi.dto.map.request;

import lombok.Data;

/**
 * 
 */
@Data
public class DistanceRequest {
	
	private String originLongitude;
	
	private String originLatitude;
	
	private String destinationLongitude;
	
	private String destinationLatitude;
	
}
