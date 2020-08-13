package com.online.taxi.dto.map.request;

import lombok.Data;

import java.util.List;

/**
 * 
 */
@Data
public class FenceRequest {
	
	private String name;
	private String points ; 
	private String description; 
	private String validTime;
	private String enable;
	
	private String id;
	private String gid;
	private Integer pageNo;
	private Integer pageSize;
	private String startTime;
	private String endTime;

	private List<String> gids;
	
}
