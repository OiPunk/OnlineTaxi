package com.rydr.taxi.common.dto;

import com.rydr.taxi.common.validation.PhoneNumberValidation;
import lombok.Data;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * @author oi
 */
@Data
public class ShortMsgRequest {
    /**
     * Custom annotation for phone number validation
     */
//    @PhoneNumberValidation

    /**
     * Validation via regular expression
     */
    @NotNull(message = "Phone number cannot be empty")
    @Pattern(message = "Phone number format is incorrect",regexp = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$")
	private String phoneNumber;


}