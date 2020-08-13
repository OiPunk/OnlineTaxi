package com.online.taxi.dto.phone.request;

import lombok.Data;
import java.util.Date;

/**
 * 手机号绑定参数
 * @date 2018/8/27
 */
@Data
public class PhoneNumberRequest {
    /**
     * 司机电话
     */
    private String driverPhone;

    /**
     * 乘客电话
     */
    private String passengerPhone;

    /**
     * 订单开始时间
     * 绑定关系对应的失效时间-不能早于当前系统时间
     */
    private String expiration;

    /**
     * 绑定手机号ID
     */
    private String subsId;

    /**
     * 绑定的手机号
     */
    private String secretNo;
}
