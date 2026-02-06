package com.online.taxi.dao.cache;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.online.taxi.constatnt.OrderRuleNames;
import com.online.taxi.dto.valuation.charging.Rule;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

/**
 * Cache operations for charging rules
 *
 * @date 2018/10/18
 */
@Component
@RequiredArgsConstructor
@Slf4j
public class RuleCache {

    @NonNull
    private StringRedisTemplate redisTemplate;

    private ObjectMapper mapper = new ObjectMapper();

    /**
     * Get cached charging rule
     *
     * @param orderId order ID
     * @return charging rule
     */
    public Rule get(Integer orderId) {
        Rule rule = null;
        String key = generateKey(orderId);
        log.info("Looking up cache orderId={}, RuleJsonInRedis={}", orderId, key);
        try {
            rule = mapper.readValue(redisTemplate.opsForValue().get(key), Rule.class);
            log.info("Retrieved cache orderId={}, RuleJsonInRedis={}", orderId, key);
        } catch (Exception e) {
            e.printStackTrace();
            log.warn("orderId={}, Failed to parse Rule from Redis {}", orderId, key);
        }

        return rule;
    }

    /**
     * Set charging rule in cache
     *
     * @param orderId order ID
     * @param rule    charging rule
     */
    public void set(Integer orderId, Rule rule) {
        String key = generateKey(orderId);
        log.info("Setting cache orderId={}, RuleInRedis={}", orderId, key);
        try {
            redisTemplate.opsForValue().set(key, mapper.writeValueAsString(rule));
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
        return String.format("%s:%s:%s", OrderRuleNames.PREFIX, OrderRuleNames.RULE, orderId);
    }
}
