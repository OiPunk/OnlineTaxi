package com.online.taxi.dto.phone;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @date 2018/8/29
 **/
@Data
@Accessors(chain = true)
public class PhoneInfoView  {
    private int id;

    private String phone;

    private String encrypt;

}
