package com.rydr.dto.map;

import lombok.Data;

/**
 * Distance measurement result
 *
 */
@Data
public class Route {

    /**
     * Travel distance (meters)
     */
    private Double distance;

    /**
     * Travel time (seconds)
     */
    private Double duration;
}
