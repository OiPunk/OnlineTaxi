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
 * Custom phone number validation annotation
 * Note: When no default value is specified, the corresponding attribute value must be provided when using this annotation
 */
@Documented
// Specify the implementation of this annotation, i.e., the validator
@Constraint(validatedBy = PhoneNumberValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RUNTIME)
public @interface PhoneNumberValidation {

    // Message displayed when validation fails
    String message() default "Phone number format is incorrect";

    // Groups to which this constraint belongs during validation
    Class<?>[] groups() default {};

    // Payload
    Class<? extends Payload>[] payload() default {};

    @Target({PARAMETER, ANNOTATION_TYPE})
    @Retention(RUNTIME)
    @Documented
    @interface List {
        PhoneNumberValidation[] value();
    }
}
