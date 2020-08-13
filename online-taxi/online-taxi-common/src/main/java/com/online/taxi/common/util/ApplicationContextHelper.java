package com.online.taxi.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Spring容器帮助类
 *
 */
public class ApplicationContextHelper implements ApplicationContextAware {

    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;
    }

    /**
     * 获取Bean对象
     *
     * @param name         Bean对象的名字
     * @param requiredType Bean对象的类型
     * @param <T>          Bean对象的类型
     * @return Bean对象
     */
    public static <T> T getBean(String name, Class<T> requiredType) {
        return context.getBean(name, requiredType);
    }

    /**
     * 获取Bean对象
     *
     * @param requiredType Bean对象的类型
     * @param <T>          Bean对象的类型
     * @return Bean对象
     */
    public static <T> T getBean(Class<T> requiredType) {
        return context.getBean(requiredType);
    }
}
