package com.online.taxi.dto.valuation.charging;

import lombok.Data;

/**
 * 计费规则主键类
 *
 * @date 2018/8/14
 */
@Data
public class KeyRule {
    /**
     * 城市编码
     */
    private String cityCode;

    /**
     * 城市名称
     */
    private String cityName;

    /**
     * 服务类型id
     */
    private Integer serviceTypeId;

    /**
     * 服务类型名称
     */
    private String serviceTypeName;

    /**
     * 渠道名称id
     */
    private Integer channelId;

    /**
     * 渠道名称
     */
    private String channelName;

    /**
     * 车辆级别id
     */
    private Integer carLevelId;

    /**
     * 车辆级别名称
     */
    private String carLevelName;
}
