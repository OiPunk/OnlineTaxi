package com.online.taxi.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.Duration;
import java.time.LocalDateTime;

/**
 * Time slice
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
     * Determine whether two time periods overlap
     *
     * @param m specified time period
     * @return true if overlapping, false otherwise
     */
    public boolean isTimeOverlapped(TimeSlice m) {
        return isTimeOverlapped(m.getX(), m.getY());
    }

    /**
     * Determine whether two time periods overlap
     *
     * @param a start time of the specified time period
     * @param b end time of the specified time period
     * @return true if overlapping, false otherwise
     */
    public boolean isTimeOverlapped(LocalDateTime a, LocalDateTime b) {
        if (a.isAfter(b) || x.isAfter(y)) {
            throw new RuntimeException("Error: start time of the time period is greater than end time");
        }

        return !(y.isBefore(a) || b.isBefore(x));
    }

    /**
     * Get the overlapping duration between two time periods
     *
     * @param a start time of the specified time period
     * @param b end time of the specified time period
     * @return overlapping duration of the time periods
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
     * Get the overlapping duration between two time periods
     *
     * @param m specified time period
     * @return overlapping duration of the time periods
     */
    public Duration until(TimeSlice m) {
        return until(m.getX(), m.getY());
    }

}
