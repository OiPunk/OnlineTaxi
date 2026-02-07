package com.rydr.dto;

import com.rydr.constatnt.ChargingCategoryEnum;
import com.rydr.task.ValuationRequestTask;
import com.rydr.util.TimeSlice;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * Time slice price meter
 *
 * @date 2018/8/14
 */
@Slf4j
public class TimeMeter {

    /**
     * Pricing result
     */
    @Data
    @Accessors(chain = true)
    public static class TimePriceResult {
        /**
         * Duration (seconds)
         */
        private double duration;

        /**
         * Time price (per-second price)
         */
        private BigDecimal timePrice;

        /**
         * Distance (meters)
         */
        private double distance;

        /**
         * Distance price (per-meter price)
         */
        private BigDecimal distancePrice;
    }

    /**
     * Pricing unit
     */
    @Data
    @Accessors(chain = true)
    public static class TimePriceUnit {

        /**
         * Charging category enum
         */
        private ChargingCategoryEnum chargingCategoryEnum;

        /**
         * Start time
         */
        private LocalTime start;

        /**
         * End time
         */
        private LocalTime end;

        /**
         * Speed (meters/second)
         */
        private Double speed;

        /**
         * Per-second price
         */
        private BigDecimal perSecondPrice;

        /**
         * Per-meter price
         */
        private BigDecimal perMeterPrice;

        /**
         * Valuation service request task entity
         */
        private ValuationRequestTask requestTask;

        /**
         * Vehicle ID
         */
        private int carId;

        /**
         * City code
         */
        private String cityCode;

        /**
         * Private constructor
         */
        private TimePriceUnit() {
        }

        /**
         * Constructor used for forecast
         *
         * @param speed speed (meters/second)
         * @return TimePriceUnit instance
         */
        public static TimePriceUnit instanceByForecast(double speed) {
            TimePriceUnit unit = new TimePriceUnit();
            unit.chargingCategoryEnum = ChargingCategoryEnum.Forecast;
            unit.speed = speed;
            return unit;
        }

        /**
         * Constructor used for real-time and settlement
         *
         * @param requestTask valuation service request task
         * @param carId       vehicle ID
         * @param cityCode    city code
         * @return TimePriceUnit instance
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
     * Perform pricing calculation based on unit parameters
     *
     * @param totalSlice total duration time slice
     * @param unit       unit
     * @return pricing result
     */
    public static TimePriceResult measure(TimeSlice totalSlice, TimePriceUnit unit) {
        TimePriceResult result = new TimePriceResult();

        // Parameter validation
        if (totalSlice == null || unit == null || unit.getStart() == null || unit.getEnd() == null) {
            return result;
        }

        // Set default values
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

        // Calculate number of days based on duration
        double totalSeconds = Duration.between(totalSlice.getX(), totalSlice.getY()).getSeconds();
        int totalDays = (int) Math.ceil(totalSeconds / Duration.ofDays(1).getSeconds()) + 1;

        // Calculate price
        for (int i = 0; i < totalDays; i++) {
            // Get the two time periods to compare
            LocalDate startDate = totalSlice.getX().toLocalDate().plusDays(i);
            TimeSlice currentSlice = new TimeSlice(LocalDateTime.of(startDate, unit.getStart()), LocalDateTime.of(startDate, unit.getEnd()));

            // Night crossing midnight
            if (unit.getEnd().isBefore(unit.getStart())) {
                currentSlice.setY(currentSlice.getY().plusDays(1));

                currentSlice.setX(currentSlice.getX().minusDays(1));
                currentSlice.setY(currentSlice.getY().minusDays(1));
            }

            // Calculate the duration within this time period
            double durationSeconds = totalSlice.until(currentSlice).getSeconds();
            result.setDuration(result.getDuration() + durationSeconds);

            // Time cost
            BigDecimal timePrice = unit.getPerSecondPrice().multiply(BigDecimal.valueOf(durationSeconds));
            result.setTimePrice(result.getTimePrice().add(timePrice));

            // Distance cost
            double distance = 0;
            if (durationSeconds > 0) {
                switch (unit.getChargingCategoryEnum()) {
                    case Forecast:
                        distance = BigDecimal.valueOf(durationSeconds).multiply(BigDecimal.valueOf(unit.getSpeed())).doubleValue();
                        break;
                    case Settlement:
                    case RealTime:
                        try {
                            // Actual departure time, to avoid cross-day situations
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
