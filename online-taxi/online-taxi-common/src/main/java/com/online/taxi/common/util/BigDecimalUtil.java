package com.online.taxi.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

/**
 *
 * @description Currency calculation utility class. PS: BigDecimal constructor parameter must be String, otherwise certain magic numbers will lose precision
 * @version
 * @date 2017-06-16
 */
public class BigDecimalUtil {

    /**
     * Convert double to String
     *
     * @param value
     * @return
     */
    public static String DoubleToString(Double value) {
        DecimalFormat df = new DecimalFormat("#0.00");
        String str = df.format(value);
        return str;
    }

    /**
     * Addition method
     *
     * @param valueOne
     *            augend
     * @param valueTwo
     *            addend
     * @return the sum of the two parameters
     */
    public static double add(String valueOne, String valueTwo) {
        BigDecimal bOne = new BigDecimal(valueOne);
        BigDecimal bTwo = new BigDecimal(valueTwo);
        return bOne.add(bTwo).doubleValue();
    }

    /**
     * Subtraction method
     *
     * @param valueOne
     *            minuend
     * @param valueTwo
     *            subtrahend
     * @return the difference of the two parameters
     */
    public static double sub(String valueOne, String valueTwo) {
        BigDecimal bOne = new BigDecimal(valueOne);
        BigDecimal bTwo = new BigDecimal(valueTwo);
        return bOne.subtract(bTwo).doubleValue();
    }

    /**
     * Multiplication method
     *
     * @param valueOne
     *            multiplicand
     * @param valueTwo
     *            multiplier
     * @return the product of the two parameters
     */
    public static double mul(String valueOne, String valueTwo) {
        BigDecimal bOne = new BigDecimal(valueOne);
        BigDecimal bTwo = new BigDecimal(valueTwo);
        return bOne.multiply(bTwo).doubleValue();
    }

    /**
     * Division method
     *
     * @param valueOne
     *            dividend
     * @param valueTwo
     *            divisor
     * @param scale
     *            precision scale
     * @return the quotient of the two parameters
     * @throws IllegalAccessException
     */
    public static double div(String valueOne, String valueTwo, int scale) {
        // If precision scale is less than 0, reset to 0
        if (scale < 0) {
            scale = 0;
        }
        BigDecimal bOne = new BigDecimal(valueOne);
        BigDecimal bTwo = new BigDecimal(valueTwo);
        return bOne.divide(bTwo, scale, RoundingMode.HALF_UP).doubleValue();
    }

}