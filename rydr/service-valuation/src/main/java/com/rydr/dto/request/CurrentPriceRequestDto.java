package com.rydr.dto.request;

import lombok.Data;

/**
 * Real-time price request DTO
 *
 * @date 2018/11/1
 */
@Data
public class CurrentPriceRequestDto {

    /**
     * Order ID
     */
    private Integer orderId;

    /**
     * Vehicle ID
     */
    private Integer carId;

    /**
     * Start timestamp in milliseconds
     */
    private Long startTime;

    /**
     * End timestamp in milliseconds
     */
    private Long endTime;

}
