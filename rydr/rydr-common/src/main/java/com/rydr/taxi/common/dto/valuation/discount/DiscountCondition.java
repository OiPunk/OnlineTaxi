package com.rydr.taxi.dto.valuation.discount;

import lombok.Data;

/**
 * @date 2018/8/20
 */
@Data
public class DiscountCondition {

    /**
     * City code
     */
    private String cityCode;

    /**
     * Service type ID
     */
    private Integer serviceTypeId;

    /**
     * Vehicle level ID
     */
    private Integer carLevelId;

    /**
     * Total travel distance (km)
     */
    private Double totalDistance;

    /**
     * Hour of the start time
     */
    private Integer startHour;

    /**
     * Date of the start time (yyyy-MM-dd)
     */
    private String startDate;

    /**
     * Day of the week of the start time (Monday: 1 - Sunday: 7)
     */
    private Integer startWeekDay;
}
