package com.online.taxi.dto.response;

import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * 实时价格DTO
 *
 * @date 2018/11/1
 */
@Data
@Accessors(chain = true)
public class CurrentPriceResponseDto {
    /**
     * 行驶距离（单位：米）
     */
    private double distance;

    /**
     * 价格
     */
    private BigDecimal price;
}
