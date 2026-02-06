package com.rydr.taxi.common;

import com.rydr.taxi.common.validation.PhoneNumberValidation;
import org.apache.commons.lang.StringUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
        * ConstraintValidator implementation for the PhoneNumberValidation annotation
        * <p>
        * Note: The validator must implement ConstraintValidator<U, V>, where U is the corresponding
        *       annotation class, and V is the type (or parent type) of the field marked with that annotation.
        *
        * Note: After the project starts, a ConstraintValidator instance is created (lazily), and the
        *       {@link ConstraintValidator#initialize} method is called after creation.
        *       Therefore, the initialize method is only invoked on the first request; subsequent requests
        *       will not trigger it.
        *
        * Note: When (lazily) creating a ConstraintValidator instance, caching is used. If one exists in
        *       the cache, the same ConstraintValidator instance is reused; otherwise a new instance is created.
        *       Since the cache key is uniquely identifiable, and instance properties of ConstraintValidator
        *       are only written in the {@link ConstraintValidator#initialize} method and only read in the
        *       {@link ConstraintValidator#isValid} method, there is no need to worry about thread safety.
        *
        */
public class PhoneNumberValidator implements ConstraintValidator<PhoneNumberValidation,String> {

    private static final int PHONE_LENGTH = 11;
    /**
     China Telecom number segments: 133, 149, 153, 173, 177, 180, 181, 189, 199
     China Unicom number segments: 130, 131, 132, 145, 155, 156, 166, 175, 176, 185, 186
     China Mobile number segments: 134(0-8), 135, 136, 137, 138, 139, 147, 150, 151, 152, 157, 158, 159, 178, 182, 183, 184, 187, 188, 198
     Other number segments:
     The 14x segment was previously exclusive to data cards, e.g., China Unicom uses 145, China Mobile uses 147, etc.
     Virtual operators:
     Telecom: 1700, 1701, 1702
     Mobile: 1703, 1705, 1706
     Unicom: 1704, 1707, 1708, 1709, 171
     Satellite communication: 1349
     */
    private static final String PHONE_REGEX = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";

    /** Error message */
    private String contains;

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if(StringUtils.isBlank(value)) {
            return false;
        }
        value = value.trim();
        if (value.length() != PHONE_LENGTH) {
            return false;
        } else {
            Pattern p = Pattern.compile(PHONE_REGEX);
            Matcher m = p.matcher(value);
            boolean isMatch = m.matches();
            if (!isMatch) {
                return false;
            }
            return true;
        }

    }

    /**
     * Initialization method, executed immediately after (lazily) creating an instance of this class
     *
     * Note: This method is only executed once, i.e., immediately after instance creation.
     *
     * The annotation information model, from which some information defined in the annotation class
     * can be obtained, such as default values, etc.
     *
     */
    @Override
    public void initialize(PhoneNumberValidation constraintAnnotation) {

    }
}
