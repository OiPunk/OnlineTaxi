package com.online.taxi.dto.map;

import lombok.Data;

/**
 * 距离测量结果
 *
 */
@Data
public class Route {

    /**
     * 行驶距离（米）
     */
    private Double distance;

    /**
     * 行驶时间（秒）
     */
    private Double duration;
}
