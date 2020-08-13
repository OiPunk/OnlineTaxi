package com.online.taxi.util;


/**
 * 功能描述
 *
 * @date 2018/8/20
 */
public enum ImageType {
    jpg(".jpg", "FFD8FF"),

    bmp(".bmp", "424D"),

    png(".png", "89504E47");

    final String type;

    final String code;

    public String getType()
    {
        return type;
    }

    public String getCode()
    {
        return code;
    }

    ImageType(String type, String code)
    {
        this.type = type;
        this.code = code;
    }
}
