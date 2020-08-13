package com.online.taxi.util;

import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 调用服务接口地址
 *
 * @date 2018/08/14
 */
@Component
@ConfigurationProperties(prefix = "services", ignoreInvalidFields = true)
@Setter
public class ServiceAddress {
    private List<Map<String, String>> address = new ArrayList<>();

    private static final String ACCOUNT_SERVER_URL = "account";
    private static final String MAP_SERVER_URL = "map";
    private static final String ORDER_SERVER_URL = "order";
    private static final String MESSAGE_SERVER_URL = "message";
    private static final String PAY_SERVER_URL = "pay";


    /**
     * 获取服务接口地址
     *
     * @param key 接口名
     * @return 地址
     */
    public String get(String key) {
        return address.stream().filter(m -> m.containsKey(key)).findFirst().orElse(new HashMap<>(0)).get(key);
    }

    /**
     * 获取账号服务地址
     *
     * @return 账号服务地址
     */
    public String getAccountAddress() {
        return get(ACCOUNT_SERVER_URL);
    }

    /**
     * 获取地图服务接口地址
     *
     * @return 地图服务接口地址
     */
    public String getMapAddress() {
        return get(MAP_SERVER_URL);
    }

    /**
     * 获取订单服务接口地址
     *
     * @return 订单服务接口地址
     */
    public String getOrderAddress() {
        return get(ORDER_SERVER_URL);
    }

    /**
     * 获取消息服务接口地址
     *
     * @return 消息服务接口地址
     */
    public String getMessageAddress() {
        return get(MESSAGE_SERVER_URL);
    }

    /**
     * 获取支付服务接口地址
     *
     * @return 支付服务接口地址
     */
    public String getPayAddress() {
        return get(PAY_SERVER_URL);
    }

}
