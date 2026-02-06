package com.rydr.taxi.dto.valuation.charging;

import lombok.Data;

/**
 * Charging rule key class
 *
 * @date 2018/8/14
 */
@Data
public class KeyRule {
    /**
     * City code
     */
    private String cityCode;

    /**
     * City name
     */
    private String cityName;

    /**
     * Service type ID
     */
    private Integer serviceTypeId;

    /**
     * Service type name
     */
    private String serviceTypeName;

    /**
     * Channel ID
     */
    private Integer channelId;

    /**
     * Channel name
     */
    private String channelName;

    /**
     * Vehicle level ID
     */
    private Integer carLevelId;

    /**
     * Vehicle level name
     */
    private String carLevelName;
}
