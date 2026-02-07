package com.rydr.order.config;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

/**
 * @author oi
 */
@Component
public class RedisConfig {

    @Autowired
    RedisSentinelProperties properties;
    // Below is the Redisson lock configuration for sentinel mode
//    @Bean(name = "redisson")
//    @Order(1)
//    public Redisson getRedisson(){
//
//        Config config = new Config();
//        config.useSentinelServers()
//                .setMasterName(properties.getMasterName())
//                .addSentinelAddress(properties.getAddress())
//                .setDatabase(0);
//        return (Redisson) Redisson.create(config);
//    }
    // Above is the Redisson sentinel lock configuration

    // Below is the red lock configuration
    @Bean
    public RedissonClient redissonRed1(){
        Config config = new Config();
        config.useSingleServer().setAddress("127.0.0.1:6379").setDatabase(0);
        return Redisson.create(config);
    }
    @Bean
    public RedissonClient redissonRed2(){
        Config config = new Config();
        config.useSingleServer().setAddress("127.0.0.1:6380").setDatabase(0);
        return Redisson.create(config);
    }
    @Bean
    public RedissonClient redissonRed3(){
        Config config = new Config();
        config.useSingleServer().setAddress("127.0.0.1:6381").setDatabase(0);
        return Redisson.create(config);
    }
    // Above is the red lock configuration



    // Single Redis instance
    @Bean
    @ConditionalOnMissingBean(StringRedisTemplate.class)
    public StringRedisTemplate stringRedisTemplate(RedisConnectionFactory redisConnectionFactory) {
    	StringRedisTemplate redisTemplate = new StringRedisTemplate();
    	redisTemplate.setConnectionFactory(redisConnectionFactory);
    	return redisTemplate;

    }

    /**
     * Single Redisson instance
     * @return
     */
    @Bean
    public RedissonClient redissonClient() {
    	Config config = new Config();
    	config.useSingleServer().setAddress("127.0.0.1:6379").setDatabase(0);

    	return Redisson.create(config);
    }
}
