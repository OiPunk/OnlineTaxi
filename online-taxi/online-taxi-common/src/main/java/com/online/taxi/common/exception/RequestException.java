package com.online.taxi.exception;

/**
 * 接口请求异常
 *
 * @date 2018/8/17
 */
public class RequestException extends RuntimeException {

    public RequestException() {
        super();
    }

    public RequestException(String message) {
        super(message);
    }
}
