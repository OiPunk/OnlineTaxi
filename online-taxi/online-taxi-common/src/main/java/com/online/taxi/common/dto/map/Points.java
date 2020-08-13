package com.online.taxi.dto.map;


import java.util.List;

import lombok.Data;
/**
 * 
 */
@Data
public class Points {
	
	private Location startPoint;
	
	private Location endPoint;
	
	private List<Location> points;
	
	private Integer pointCount ;
	
	
}