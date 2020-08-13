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
 * 对计价规则进行缓存操作
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
     * 缓存计价规则
     *
     * @param orderId 订单ID
     * @return 计价规则
     */
    public Rule get(Integer orderId) {
        Rule rule = null;
        String key = generateKey(orderId);
        log.info("查找缓存orderId={}, RuleJsonInRedis={}", orderId, key);
        try {
            rule = mapper.readValue(redisTemplate.opsForValue().get(key), Rule.class);
            log.info("获取缓存orderId={}, RuleJsonInRedis={}", orderId, key);
        } catch (Exception e) {
            e.printStackTrace();
            log.warn("orderId={}, Redis解析Rule失败{}", orderId, key);
        }

        return rule;
    }

    /**
     * 从缓存中获取计价规则
     *
     * @param orderId 订单ID
     * @param rule    计价规则
     */
    public void set(Integer orderId, Rule rule) {
        String key = generateKey(orderId);
        log.info("设置缓存orderId={}, RuleInRedis={}", orderId, key);
        try {
            redisTemplate.opsForValue().set(key, mapper.writeValueAsString(rule));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除缓存
     *
     * @param orderId 订单ID
     */
    public void delete(Integer orderId) {
        String key = generateKey(orderId);
        log.info("删除缓存orderId={}, RuleInRedis={}", orderId, key);
        redisTemplate.delete(key);
    }

    /**
     * 生成redis的key
     *
     * @param orderId 订单ID
     * @return redis的key
     */
    private String generateKey(Integer orderId) {
        return String.format("%s:%s:%s", OrderRuleNames.PREFIX, OrderRuleNames.RULE, orderId);
    }
}
