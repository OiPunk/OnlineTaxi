package com.online.taxi.common.validation;

import com.online.taxi.common.PhoneNumberValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * 自定义手机号校验注解
 * 注:当没有指定默认值时，那么在使用此注解时，就必须输入对应的属性值
 */
@Documented
// 指定此注解的实现，即:验证器
@Constraint(validatedBy = PhoneNumberValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RUNTIME)
public @interface PhoneNumberValidation {

    // 当验证不通过时的提示信息
    String message() default "手机号格式不正确";

    // 约束注解在验证时所属的组别
    Class<?>[] groups() default {};

    // 负载
    Class<? extends Payload>[] payload() default {};

    @Target({PARAMETER, ANNOTATION_TYPE})
    @Retention(RUNTIME)
    @Documented
    @interface List {
        PhoneNumberValidation[] value();
    }
}
