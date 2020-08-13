package com.online.taxi.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Optional;

/**
 * 单位转换工具类
 *
 * @date 2018/08/15
 */
public class UnitConverter {

    /**
     * 将Date转换为LocalDateTime
     *
     * @param date Date
     * @return LocalDateTime
     */
    public static LocalDateTime dateToLocalDateTime(Date date) {
        return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
    }

    /**
     * 将Date转换为LocalDate
     *
     * @param date Date
     * @return LocalDate
     */
    public static LocalDate dateToLocalDate(Date date) {
        return dateToLocalDateTime(date).toLocalDate();
    }

    /**
     * 将Date转换为LocalTime
     *
     * @param date Date
     * @return LocalTime
     */
    public static LocalTime dateToLocalTime(Date date) {
        return dateToLocalDateTime(date).toLocalTime();
    }

    /**
     * 将每公里价格转换为每米价格
     *
     * @param price 每公里价格
     * @return 每米价格
     */
    public static BigDecimal kiloToMeterPrice(BigDecimal price) {
        return price.divide(new BigDecimal("1000"), 5, RoundingMode.DOWN);
    }

    /**
     * 将每分钟价格转换为每秒价格
     *
     * @param price 每分钟价格
     * @return 每秒价格
     */
    public static BigDecimal minuteToSecondPrice(BigDecimal price) {
        return price.divide(new BigDecimal("60"), 5, RoundingMode.DOWN);
    }

    /**
     * 秒数转为分钟数
     *
     * @param seconds 秒数
     * @return 分钟数
     */
    public static double secondToMinute(Double seconds) {
        return BigDecimal.valueOf(Optional.ofNullable(seconds).orElse(0D)).divide(BigDecimal.valueOf(60), 2, RoundingMode.HALF_DOWN).doubleValue();
    }

    /**
     * 将米数转为公里数
     *
     * @param meters 米数
     * @return 公里数
     */
    public static double meterToKilo(Double meters) {
        return BigDecimal.valueOf(Optional.ofNullable(meters).orElse(0D)).divide(BigDecimal.valueOf(1000), 2, RoundingMode.HALF_DOWN).doubleValue();
    }

}
