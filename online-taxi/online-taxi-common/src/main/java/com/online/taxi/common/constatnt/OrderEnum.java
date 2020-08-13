package com.online.taxi.constatnt;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author yueyi2019
 * 订单状态
 */
@Getter
@AllArgsConstructor
public enum OrderEnum implements CodeEnum {

    /**
     * 行程已超260公里，如需用车请联系客服
     */
    TOO_FAR_AWAY(501, "您的行程已超260公里，如需用车请联系客服"), /**
     * 行程太近，请确认您的上下车地址
     */
    TOO_CLOSE(502, "您的行程太近，请确认您的上下车地址"), /**
     * 城市不存在
     */
    CITIES_DON_EXIST(503, "该城市不存在"), /**
     * 城市示启用
     */
    CITIES_IS_NOT_ENABLED(504, "该城市未启用"),

    /**
     * 服务类型不存在
     */
    SERVICE_TYPE_IS_NO(505, "服务类型不存在"), /**
     * 服务类型未启用
     */
    SERVICE_TYPE_IS_NOT_ENABLED(506, "该服务类型未启用"),

    /**
     * 渠道不存在
     */
    CHANNEL_IS_NO(507, "该渠道不存在"),

    /**
     * 渠道未启用
     */
    CHANNEL_IS_NOT_ENABLED(508, "该渠道未启用"),

    /**
     * 车辆级别无
     */
    CAR_LEVEL_IS_NO(509, "车辆级别不存在"), /**
     * 该车辆级别未启用
     */
    CAR_LEVEL_IS_NOT_ENABLED(510, "该车辆级别未启用"),

    /**
     * 它人订单
     */
    ORDER_TYPE_OTHER(2, "他人订单"),

    /**
     * 订单取消
     */
    IS_CANCEL(1, "订单取消"),

    /**
     * 已支付
     */
    IS_PAY(1, "已支付"), /**
     * 未支付
     */
    NOT_PAY(0, "未支付"),

    /**
     * 已评价
     */
    IS_EVALUATE(1, "已评价"), /**
     * 未评价
     */
    NOT_EVALUATE(0, "未评价"),

    /**
     * 人工派单,原无司机
     */
    ORDER_IS_MANUAL_FLAG1(1, "人工派单,原无司机"),

    /**
     *实时订单
     */
    SERVICE_TYPE(1,"实时订单"),

    /**
     * 订单改派,原有司机
     */
    ORDER_IS_MANUAL_FLAG2(2, "订单改派,原有司机");

    private int code;
    private String value;
}
