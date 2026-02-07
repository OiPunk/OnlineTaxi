package com.rydr.dto.phone;

import lombok.Data;

import java.util.List;

/**
 * Phone number encryption/decryption DTO
 *
 * @date 2018/8/29
 */
@Data
public class PhoneInfoDto {
    private Integer idType;
    private List<PhoneInfoView> infoList;
}
