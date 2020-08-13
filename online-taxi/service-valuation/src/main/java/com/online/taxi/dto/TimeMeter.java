package com.online.taxi.dto;

import com.online.taxi.constatnt.ChargingCategoryEnum;
import com.online.taxi.task.ValuationRequestTask;
import com.online.taxi.util.TimeSlice;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * 时间片计价器
 *
 * @date 2018/8/14
 */
@Slf4j
public class TimeMeter {

    /**
     * 计价结果
     */
    @Data
    @Accessors(chain = true)
    public static class TimePriceResult {
        /**
         * 时长（秒）
         */
        private double duration;

        /**
         * 时间价格（秒价格）
         */
        private BigDecimal timePrice;

        /**
         * 距离（米）
         */
        private double distance;

        /**
         * 距离价格（米价格）
         */
        private BigDecimal distancePrice;
    }

    /**
     * 计价单位
     */
    @Data
    @Accessors(chain = true)
    public static class TimePriceUnit {

        /**
         * 计价规则种类枚举
         */
        private ChargingCategoryEnum chargingCategoryEnum;

        /**
         * 开始时间点
         */
        private LocalTime start;

        /**
         * 结束时间点
         */
        private LocalTime end;

        /**
         * 距离（米）
         */
        private Double speed;

        /**
         * 每秒钟价格
         */
        private BigDecimal perSecondPrice;

        /**
         * 每米价格
         */
        private BigDecimal perMeterPrice;

        /**
         * 计价服务请求任务实体类
         */
        private ValuationRequestTask requestTask;

        /**
         * 车辆ID
         */
        private int carId;

        /**
         * 城市编码
         */
        private String cityCode;

        /**
         * 私有构造函数
         */
        private TimePriceUnit() {
        }

        /**
         * 预估时使用的构造函数
         *
         * @param speed 速度（米/秒）
         * @return TimePriceUnit实例
         */
        public static TimePriceUnit instanceByForecast(double speed) {
            TimePriceUnit unit = new TimePriceUnit();
            unit.chargingCategoryEnum = ChargingCategoryEnum.Forecast;
            unit.speed = speed;
            return unit;
        }

        /**
         * 实时、结算时使用的构造函数
         *
         * @param requestTask 计价服务请求任务
         * @param carId       车辆ID
         * @param cityCode    城市编码
         * @return TimePriceUnit实例
         */
        public static TimePriceUnit instanceBySettlement(ChargingCategoryEnum chargingCategory, ValuationRequestTask requestTask, int carId, String cityCode) {
            TimePriceUnit unit = new TimePriceUnit();
            unit.chargingCategoryEnum = chargingCategory;
            unit.requestTask = requestTask;
            unit.carId = carId;
            unit.cityCode = cityCode;
            return unit;
        }

    }

    /**
     * 根据单位参数进行计价计算
     *
     * @param totalSlice 总时长的时间片
     * @param unit       单位
     * @return 计价结果
     */
    public static TimePriceResult measure(TimeSlice totalSlice, TimePriceUnit unit) {
        TimePriceResult result = new TimePriceResult();

        //参数校验
        if (totalSlice == null || unit == null || unit.getStart() == null || unit.getEnd() == null) {
            return result;
        }

        //设置默认值
        if (unit.getPerMeterPrice() == null) {
            unit.setPerMeterPrice(BigDecimal.ZERO);
        }
        if (unit.getPerSecondPrice() == null) {
            unit.setPerSecondPrice(BigDecimal.ZERO);
        }
        result.setDuration(0);
        result.setTimePrice(BigDecimal.ZERO);
        result.setDistance(0);
        result.setDistancePrice(BigDecimal.ZERO);

        //根据时长算出天数
        double totalSeconds = Duration.between(totalSlice.getX(), totalSlice.getY()).getSeconds();
        int totalDays = (int) Math.ceil(totalSeconds / Duration.ofDays(1).getSeconds()) + 1;

        //计算价格
        for (int i = 0; i < totalDays; i++) {
            //获取要比较的两个时间段
            LocalDate startDate = totalSlice.getX().toLocalDate().plusDays(i);
            TimeSlice currentSlice = new TimeSlice(LocalDateTime.of(startDate, unit.getStart()), LocalDateTime.of(startDate, unit.getEnd()));

            //夜间跨天
            if (unit.getEnd().isBefore(unit.getStart())) {
                currentSlice.setY(currentSlice.getY().plusDays(1));

                currentSlice.setX(currentSlice.getX().minusDays(1));
                currentSlice.setY(currentSlice.getY().minusDays(1));
            }

            //计算该时间段内的时长
            double durationSeconds = totalSlice.until(currentSlice).getSeconds();
            result.setDuration(result.getDuration() + durationSeconds);

            //时间费用
            BigDecimal timePrice = unit.getPerSecondPrice().multiply(BigDecimal.valueOf(durationSeconds));
            result.setTimePrice(result.getTimePrice().add(timePrice));

            //距离费用
            double distance = 0;
            if (durationSeconds > 0) {
                switch (unit.getChargingCategoryEnum()) {
                    case Forecast:
                        distance = BigDecimal.valueOf(durationSeconds).multiply(BigDecimal.valueOf(unit.getSpeed())).doubleValue();
                        break;
                    case Settlement:
                    case RealTime:
                        try {
                            //实际出发时间，以避免跨天的情况
                            LocalDateTime realStart = totalSlice.getX().isAfter(currentSlice.getX()) ? totalSlice.getX() : currentSlice.getX();
                            distance = unit.requestTask.requestDistance(unit.carId, unit.cityCode, realStart, currentSlice.getY()).getDistance();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        break;
                    default:
                        break;
                }
            }
            result.setDistance(result.getDistance() + distance);
            BigDecimal distancePrice = unit.getPerMeterPrice().multiply(BigDecimal.valueOf(distance));
            result.setDistancePrice(result.getDistancePrice().add(distancePrice));

            log.info("totalSlice=" + totalSlice + ", currentSlice=" + currentSlice
                    + ", totalSeconds=" + totalSeconds + ", durationSeconds=" + durationSeconds
                    + ", perSecondPrice=" + unit.getPerSecondPrice() + ", timePrice=" + timePrice
                    + ", speed(m/s)=" + unit.getSpeed() + ", distance(m)=" + distance
                    + ", perMeterPrice=" + unit.getPerMeterPrice() + ", distancePrice=" + distancePrice);
        }

        return result;
    }

}
