package com.online.taxi.common;

import com.online.taxi.common.validation.PhoneNumberValidation;
import org.apache.commons.lang.StringUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
        * ConstraintsJustryDeng注解 校验器 实现
        * <p>
        * 注:验证器需要实现ConstraintValidator<U, V>, 其中 U为对应的注解类， V为被该注解标记的字段的类型(或其父类型)
        *
        * 注: 当项目启动后，会(懒加载)创建ConstraintValidator实例，在创建实例后会初始化调
        *     用{@link ConstraintValidator#initialize}方法。
        *     所以， 只有在第一次请求时，会走initialize方法， 后面的请求是不会走initialize方法的。
        *
        * 注: (懒加载)创建ConstraintValidator实例时， 会走缓存; 如果缓存中有，则直接使用相
        *     同的ConstraintValidator实例； 如果缓存中没有，那么会创建新的ConstraintValidator实例。
        *     由于缓存的key是能唯一定位的， 且 ConstraintValidator的实例属性只有在
        *     {@link ConstraintValidator#initialize}方法中才会写；在{@link ConstraintValidator#isValid}
        *     方法中只是读。
        *     所以不用担心线程安全问题。
        *
        */
public class PhoneNumberValidator implements ConstraintValidator<PhoneNumberValidation,String> {

    private static final int PHONE_LENGTH = 11;
    /**
     中国电信号段 133、149、153、173、177、180、181、189、199
     中国联通号段 130、131、132、145、155、156、166、175、176、185、186
     中国移动号段 134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、178、182、183、184、187、188、198
     其他号段
     14号段以前为上网卡专属号段，如中国联通的是145，中国移动的是147等等。
     虚拟运营商
     电信：1700、1701、1702
     移动：1703、1705、1706
     联通：1704、1707、1708、1709、171
     卫星通信：1349
     */
    private static final String PHONE_REGEX = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";

    /** 错误提示信息 */
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
     * 初始化方法， 在(懒加载)创建一个当前类实例后，会马上执行此方法
     *
     * 注: 此方法只会执行一次，即:创建实例后马上执行。
     *
     * 注解信息模型，可以从该模型中获取注解类中定义的一些信息，如默认值等
     *
     */
    @Override
    public void initialize(PhoneNumberValidation constraintAnnotation) {

    }
}
