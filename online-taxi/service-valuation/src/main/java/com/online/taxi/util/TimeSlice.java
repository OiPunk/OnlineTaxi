package com.online.taxi.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.Duration;
import java.time.LocalDateTime;

/**
 * 时间片
 *
 * @date 2018/8/14
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class TimeSlice {

    private LocalDateTime x;
    private LocalDateTime y;

    /**
     * 判断两个时间段是否有交集
     *
     * @param m 指定时间段
     * @return 有交集返回true，否则返回false
     */
    public boolean isTimeOverlapped(TimeSlice m) {
        return isTimeOverlapped(m.getX(), m.getY());
    }

    /**
     * 判断两个时间段是否有交集
     *
     * @param a 指定时间段的起始时间
     * @param b 指定时间段的结束时间
     * @return 有交集返回true，否则返回false
     */
    public boolean isTimeOverlapped(LocalDateTime a, LocalDateTime b) {
        if (a.isAfter(b) || x.isAfter(y)) {
            throw new RuntimeException("时间段的起始时间大于结束时间错误");
        }

        return !(y.isBefore(a) || b.isBefore(x));
    }

    /**
     * 获取两个时间段的间隔
     *
     * @param a 指定时间段的起始时间
     * @param b 指定时间段的结束时间
     * @return 时间段的间隔
     */
    public Duration until(LocalDateTime a, LocalDateTime b) {
        if (!isTimeOverlapped(a, b)) {
            return Duration.ofSeconds(0);
        }

        LocalDateTime m = a.isAfter(x) ? a : x;
        LocalDateTime n = b.isBefore(y) ? b : y;
        return Duration.between(m, n);
    }

    /**
     * 获取两个时间段的间隔
     *
     * @param m 指定时间段
     * @return 时间段的间隔
     */
    public Duration until(TimeSlice m) {
        return until(m.getX(), m.getY());
    }

}
