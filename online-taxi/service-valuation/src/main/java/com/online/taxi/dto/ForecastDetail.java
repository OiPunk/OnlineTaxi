package com.online.taxi.dto;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 订单明细DTO
 *
 * @date 2018/10/24
 */
@Data
@Accessors(chain = true)
public class ForecastDetail {
    private String totalPrice;
    private String pathPrice;
    private String path;
    private String duration;
    private String durationPrice;
    private String supplementPrice;
    private String beyondDistance;
    private String beyondPrice;
    private String nightPrice;
    private String nightTime;
    private String nightDistance;
    private String restDistance;
    private String restDistancePrice;
    private String restDuration;
    private String restDurationPrice;
    private String dynamicDiscountRate;
    private String basePrice;
    private List<PeriodRule> periodRule;
    private List<TagRule> tagRule;

    @Data
    public static class PeriodRule {
        private String startHour;
        private String endHour;
        private String distance;
        private String distancePrice;
        private String duration;
        private String timePrice;

    }

    @Data
    public static class TagRule {
        private String tagName;
        private String tagPrice;
    }
}
