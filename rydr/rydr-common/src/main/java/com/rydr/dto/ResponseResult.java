package com.rydr.dto;

import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.http.HttpStatus;

import com.rydr.constatnt.BusinessInterfaceStatus;

import java.io.Serializable;

/**
 * Generic response result handler
 *
 * @date 2018/8/14
 */
@Data
@Accessors(chain = true)
@SuppressWarnings("unchecked")
public class ResponseResult<T> implements Serializable {

    private int code;
    private String message;
    private T data;

    /**
     * Return success data (status: 200)
     *
     * @param data data content
     * @param <T>  data type
     * @return ResponseResult instance
     */
    public static <T> ResponseResult success(T data) {
        return new ResponseResult().setCode(BusinessInterfaceStatus.SUCCESS.getCode()).setMessage(BusinessInterfaceStatus.SUCCESS.getValue()).setData(data);
    }

    /**
     * Return success data (status: 200)
     *
     * @return ResponseResult instance
     */
    public static ResponseResult success() {
        return success(null);
    }

    /**
     * Return error data (status: 500)
     *
     * @param data error content
     * @param <T>  data type
     * @return ResponseResult instance
     */
    public static <T> ResponseResult fail(T data) {
        return new ResponseResult().setCode(HttpStatus.INTERNAL_SERVER_ERROR.value()).setMessage(HttpStatus.INTERNAL_SERVER_ERROR.name()).setData(data);
    }

    /**
     * Custom error data response
     *
     * @param code    error code
     * @param message error message
     * @return ResponseResult instance
     */
    public static ResponseResult fail(int code, String message) {
        return new ResponseResult().setCode(code).setMessage(message);
    }

    /**
     * @param code    error code
     * @param message error message
     * @param data    error content
     * @return ResponseResult instance
     */
    public static ResponseResult fail(int code, String message, String data) {
        return new ResponseResult().setCode(code).setMessage(message).setData(data);
    }
}
