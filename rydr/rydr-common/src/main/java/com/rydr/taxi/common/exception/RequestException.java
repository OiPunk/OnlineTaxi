package com.rydr.taxi.exception;

/**
 * API request exception
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
