package com.rydr.taxi.constatnt;

/**
 * Common enum interface
 *
 * @author yueyi2019
 * @date 2018/8/14
 */
public interface CodeEnum {

    /**
     * Returns the code value of the enum
     *
     * @return code value
     */
    int getCode();

    /**
     * Returns the code value of the enum
     *
     * @return code value in string format
     */
    default String getCodeAsString() {
        return "" + getCode();
    }
}
