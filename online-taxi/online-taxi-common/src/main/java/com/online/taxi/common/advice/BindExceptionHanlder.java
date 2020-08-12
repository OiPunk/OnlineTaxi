package com.online.taxi.common.advice;

import com.online.taxi.common.dto.ResponseResult;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ValidationException;

import java.util.List;

@RestControllerAdvice
public class BindExceptionHanlder {

    @ResponseStatus(code = HttpStatus.BAD_REQUEST)
    @ExceptionHandler(value = {BindException.class,ValidationException.class,MethodArgumentNotValidException.class})
    public ResponseResult handleBindException(HttpServletRequest request, Exception exception) {

        String exceptionClassName = exception.getClass().getName();
        String message = "参数错误";
        switch (exceptionClassName){
            case "org.springframework.validation.BindException":
                BindException bindException = (BindException) exception;
                message = bindException.getFieldError().getDefaultMessage();
            case "javax.validation.ValidationException":
                ValidationException validationException = (ValidationException) exception;
                message = validationException.getMessage();

            case "org.springframework.web.bind.MethodArgumentNotValidException":

                MethodArgumentNotValidException methodArgumentNotValidException = (MethodArgumentNotValidException) exception;
                BindingResult bindingResult = methodArgumentNotValidException.getBindingResult();
                message = bindingResult.getFieldError().getDefaultMessage();
        }
        System.out.println(exception);
        return ResponseResult.fail(0,message);
    }
}