package com.online.taxi.dao.cache;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.online.taxi.constatnt.OrderRuleNames;
import com.online.taxi.dto.PriceMeter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * 对订单价格进行缓存操作
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
     * 缓存计价对象
     *
     * @param orderId 订单ID
     * @return 计价对象
     */
    public PriceMeter get(Integer orderId) {
        PriceMeter priceMeter = null;
        String key = generateKey(orderId);
        log.info("查找缓存orderId={}, PriceMeterInRedis={}", orderId, key);
        try {
            priceMeter = mapper.readValue(redisTemplate.opsForValue().get(key), PriceMeter.class);
            log.info("获取缓存orderId={}, PriceMeterInRedis={}", orderId, key);
        } catch (Exception e) {
            e.printStackTrace();
            log.warn("orderId={}, Redis解析PriceMeter失败{}", orderId, key);
        }

        return priceMeter;
    }

    /**
     * 从缓存中获取计价对象
     *
     * @param orderId    订单ID
     * @param priceMeter 计价对象
     * @param timeout    过期时间
     * @param unit       过期时间单位
     */
    public void set(Integer orderId, PriceMeter priceMeter, long timeout, TimeUnit unit) {
        String key = generateKey(orderId);
        log.info("设置缓存orderId={}, PriceMeterInRedis={}", orderId, key);
        try {
            redisTemplate.opsForValue().set(key, mapper.writeValueAsString(priceMeter), timeout, unit);
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
        return String.format("%s:%s:%s", OrderRuleNames.PREFIX, OrderRuleNames.PRICE, orderId);
    }
}
