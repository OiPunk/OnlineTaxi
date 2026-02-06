package com.rydr.taxi.dao.cache;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rydr.taxi.constatnt.OrderRuleNames;
import com.rydr.taxi.dto.PriceMeter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * Cache operations for order prices
 *
 * @date 2018/10/18
 */
@Component
@RequiredArgsConstructor
@Slf4j
@SuppressWarnings("unchecked")
public class PriceCache {

    @NonNull
    private StringRedisTemplate redisTemplate;

    private ObjectMapper mapper = new ObjectMapper();

    /**
     * Get cached price object
     *
     * @param orderId order ID
     * @return price object
     */
    public PriceMeter get(Integer orderId) {
        PriceMeter priceMeter = null;
        String key = generateKey(orderId);
        log.info("Looking up cache orderId={}, PriceMeterInRedis={}", orderId, key);
        try {
            priceMeter = mapper.readValue(redisTemplate.opsForValue().get(key), PriceMeter.class);
            log.info("Retrieved cache orderId={}, PriceMeterInRedis={}", orderId, key);
        } catch (Exception e) {
            e.printStackTrace();
            log.warn("orderId={}, Failed to parse PriceMeter from Redis {}", orderId, key);
        }

        return priceMeter;
    }

    /**
     * Set price object in cache
     *
     * @param orderId    order ID
     * @param priceMeter price object
     * @param timeout    expiration time
     * @param unit       expiration time unit
     */
    public void set(Integer orderId, PriceMeter priceMeter, long timeout, TimeUnit unit) {
        String key = generateKey(orderId);
        log.info("Setting cache orderId={}, PriceMeterInRedis={}", orderId, key);
        try {
            redisTemplate.opsForValue().set(key, mapper.writeValueAsString(priceMeter), timeout, unit);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    /**
     * Delete cache
     *
     * @param orderId order ID
     */
    public void delete(Integer orderId) {
        String key = generateKey(orderId);
        log.info("Deleting cache orderId={}, RuleInRedis={}", orderId, key);
        redisTemplate.delete(key);
    }

    /**
     * Generate Redis key
     *
     * @param orderId order ID
     * @return Redis key
     */
    private String generateKey(Integer orderId) {
        return String.format("%s:%s:%s", OrderRuleNames.PREFIX, OrderRuleNames.PRICE, orderId);
    }
}
