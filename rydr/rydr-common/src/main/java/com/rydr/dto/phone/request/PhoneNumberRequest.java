package com.rydr.dto.phone.request;

import lombok.Data;
import java.util.Date;

/**
 * Phone number binding parameters
 * @date 2018/8/27
 */
@Data
public class PhoneNumberRequest {
    /**
     * Driver phone number
     */
    private String driverPhone;

    /**
     * Passenger phone number
     */
    private String passengerPhone;

    /**
     * Order start time
     * Expiration time of the binding relationship - must not be earlier than the current system time
     */
    private String expiration;

    /**
     * Bound phone number ID
     */
    private String subsId;

    /**
     * Bound phone number
     */
    private String secretNo;
}
