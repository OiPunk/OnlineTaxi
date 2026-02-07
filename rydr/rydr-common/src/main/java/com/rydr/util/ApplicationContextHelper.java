package com.rydr.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Spring Application Context Helper Class
 *
 */
public class ApplicationContextHelper implements ApplicationContextAware {

    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;
    }

    /**
     * Get a Bean instance
     *
     * @param name         the name of the Bean
     * @param requiredType the type of the Bean
     * @param <T>          the type of the Bean
     * @return the Bean instance
     */
    public static <T> T getBean(String name, Class<T> requiredType) {
        return context.getBean(name, requiredType);
    }

    /**
     * Get a Bean instance
     *
     * @param requiredType the type of the Bean
     * @param <T>          the type of the Bean
     * @return the Bean instance
     */
    public static <T> T getBean(Class<T> requiredType) {
        return context.getBean(requiredType);
    }
}
