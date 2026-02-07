package com.rydr.dto.phone.response;

import lombok.Data;

/**
 * OSS base response
 *
 * @date 2018/8/20
 */
@Data
public class OssBaseResponse {
    private Integer status;
    private String fileUrl;
}
