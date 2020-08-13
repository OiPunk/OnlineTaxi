package com.online.taxi.dto.valuation.discount;

import lombok.Data;

/**
 * @date 2018/8/20
 */
@Data
public class DiscountCondition {

    /**
     * 城市编码
     */
    private String cityCode;

    /**
     * 服务类型id
     */
    private Integer serviceTypeId;

    /**
     * 车辆级别id
     */
    private Integer carLevelId;

    /**
     * 行驶总里程（公里）
     */
    private Double totalDistance;

    /**
     * 开始时间点的小时
     */
    private Integer startHour;

    /**
     * 开始时间点的日期（yyyy-MM-dd）
     */
    private String startDate;

    /**
     * 开始时间点的星期几（Monday：1 - Sunday：7）
     */
    private Integer startWeekDay;
}
