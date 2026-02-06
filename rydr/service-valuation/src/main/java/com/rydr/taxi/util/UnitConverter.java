package com.rydr.taxi.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Optional;

/**
 * Unit conversion utility class
 *
 * @date 2018/08/15
 */
public class UnitConverter {

    /**
     * Convert Date to LocalDateTime
     *
     * @param date Date
     * @return LocalDateTime
     */
    public static LocalDateTime dateToLocalDateTime(Date date) {
        return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
    }

    /**
     * Convert Date to LocalDate
     *
     * @param date Date
     * @return LocalDate
     */
    public static LocalDate dateToLocalDate(Date date) {
        return dateToLocalDateTime(date).toLocalDate();
    }

    /**
     * Convert Date to LocalTime
     *
     * @param date Date
     * @return LocalTime
     */
    public static LocalTime dateToLocalTime(Date date) {
        return dateToLocalDateTime(date).toLocalTime();
    }

    /**
     * Convert per-kilometer price to per-meter price
     *
     * @param price per-kilometer price
     * @return per-meter price
     */
    public static BigDecimal kiloToMeterPrice(BigDecimal price) {
        return price.divide(new BigDecimal("1000"), 5, RoundingMode.DOWN);
    }

    /**
     * Convert per-minute price to per-second price
     *
     * @param price per-minute price
     * @return per-second price
     */
    public static BigDecimal minuteToSecondPrice(BigDecimal price) {
        return price.divide(new BigDecimal("60"), 5, RoundingMode.DOWN);
    }

    /**
     * Convert seconds to minutes
     *
     * @param seconds number of seconds
     * @return number of minutes
     */
    public static double secondToMinute(Double seconds) {
        return BigDecimal.valueOf(Optional.ofNullable(seconds).orElse(0D)).divide(BigDecimal.valueOf(60), 2, RoundingMode.HALF_DOWN).doubleValue();
    }

    /**
     * Convert meters to kilometers
     *
     * @param meters number of meters
     * @return number of kilometers
     */
    public static double meterToKilo(Double meters) {
        return BigDecimal.valueOf(Optional.ofNullable(meters).orElse(0D)).divide(BigDecimal.valueOf(1000), 2, RoundingMode.HALF_DOWN).doubleValue();
    }

}
