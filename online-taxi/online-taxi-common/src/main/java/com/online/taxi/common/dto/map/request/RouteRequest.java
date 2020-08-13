package com.online.taxi.dto.map.request;

import lombok.Data;

/**
 */
@Data
public class RouteRequest {

    private String vehicleId;

    private String city;

    private Long startTime;

    private Long endTime;

    private String correction;

}
