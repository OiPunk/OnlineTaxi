package com.online.taxi.dto.map;
import java.util.List;
import lombok.Data;
/**
 * 
 */
@Data
public class Dispatch{
	
	private Integer count;
	
	private String orderId;
	
	private List<Vehicle> vehicles;
}