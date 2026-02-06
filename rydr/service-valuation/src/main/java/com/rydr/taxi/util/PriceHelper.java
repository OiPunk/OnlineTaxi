package com.rydr.taxi.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Arrays;

/**
 * Price calculation helper class
 *
 * @date 2018/10/29
 */
public class PriceHelper {

    /**
     * Addition operation
     *
     * @param a     value a
     * @param value other values
     * @return sum
     */
    public static BigDecimal add(BigDecimal a, BigDecimal... value) {
        BigDecimal result = null;
        try {
            result = resetScale(Arrays.stream(value).reduce(a, BigDecimal::add));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * Subtraction operation
     *
     * @param a     value a
     * @param value other values
     * @return difference
     */
    public static BigDecimal subtract(BigDecimal a, BigDecimal... value) {
        BigDecimal result = null;
        try {
            result = resetScale(Arrays.stream(value).reduce(a, BigDecimal::subtract).max(BigDecimal.ZERO));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * Subtraction operation
     *
     * @param a     value a
     * @param value other values
     * @return difference
     */
    public static BigDecimal subtract(double a, double... value) {
        return subtract(BigDecimal.valueOf(a), Arrays.stream(value).mapToObj(BigDecimal::valueOf).toArray(BigDecimal[]::new));
    }

    /**
     * Multiplication operation
     *
     * @param a value a
     * @param b value b
     * @return product
     */
    public static BigDecimal multiply(BigDecimal a, double b) {
        BigDecimal result = null;
        try {
            result = resetScale(a.multiply(BigDecimal.valueOf(b)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * Minimum value comparison
     *
     * @param a value a
     * @param b value b
     * @return the smaller value between a and b
     */
    public static BigDecimal min(BigDecimal a, BigDecimal b) {
        return resetScale(a.min(b));
    }

    /**
     * Set precision
     *
     * @param value numeric value
     * @return value after precision adjustment
     */
    public static BigDecimal resetScale(BigDecimal value) {
        BigDecimal result = null;
        try {
            result = value.setScale(2, RoundingMode.DOWN);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
