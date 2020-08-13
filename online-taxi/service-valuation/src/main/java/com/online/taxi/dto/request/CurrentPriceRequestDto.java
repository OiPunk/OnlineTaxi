package com.online.taxi.dto.request;

import lombok.Data;

/**
 * 实时价格请求DTO
 *
 * @date 2018/11/1
 */
@Data
public class CurrentPriceRequestDto {

    /**
     * 订单ID
     */
    private Integer orderId;

    /**
     * 车辆Id
     */
    private Integer carId;

    /**
     * 开始时间戳毫秒值
     */
    private Long startTime;

    /**
     * 截止时间戳毫秒值
     */
    private Long endTime;

}
