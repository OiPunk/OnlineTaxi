package com.online.taxi.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.online.taxi.dto.ResponseResult;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.lang.Nullable;
import org.springframework.web.client.RestTemplate;

/**
 * RestTemplate Helper Class
 *
 */
@Configuration
public class RestTemplateHepler {

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    /**
     * Parse ResponseResult into the specified class
     *
     * @param result    ResponseResult
     * @param clazz     the specified class
     * @param <T>       the specified class type
     * @return an instance of the specified class
     * @throws Exception exception
     */
    public static <T> T parse(@Nullable ResponseResult result, Class<T> clazz) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(mapper.writeValueAsString(result != null ? result.getData() : null), clazz);
    }
}
