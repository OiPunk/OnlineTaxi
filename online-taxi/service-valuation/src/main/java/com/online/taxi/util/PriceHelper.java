package com.online.taxi.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Arrays;

/**
 * 价格计算帮助类
 *
 * @date 2018/10/29
 */
public class PriceHelper {

    /**
     * 加法运算
     *
     * @param a     数值a
     * @param value 其他数值
     * @return 和值
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
     * 减法运算
     *
     * @param a     数值a
     * @param value 其他数值
     * @return 差值
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
     * 减法运算
     *
     * @param a     数值a
     * @param value 其他数值
     * @return 差值
     */
    public static BigDecimal subtract(double a, double... value) {
        return subtract(BigDecimal.valueOf(a), Arrays.stream(value).mapToObj(BigDecimal::valueOf).toArray(BigDecimal[]::new));
    }

    /**
     * 乘法运算
     *
     * @param a 数值a
     * @param b 数值n
     * @return 乘积
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
     * 大小比较
     *
     * @param a 数值a
     * @param b 数值b
     * @return a与b中较小的数值
     */
    public static BigDecimal min(BigDecimal a, BigDecimal b) {
        return resetScale(a.min(b));
    }

    /**
     * 精度设置
     *
     * @param value 数值
     * @return 精度设置后的数值
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
