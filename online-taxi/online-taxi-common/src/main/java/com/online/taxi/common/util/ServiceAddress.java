package com.online.taxi.util;

import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Service Interface Addresses
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
     * Get service interface address
     *
     * @param key interface name
     * @return address
     */
    public String get(String key) {
        return address.stream().filter(m -> m.containsKey(key)).findFirst().orElse(new HashMap<>(0)).get(key);
    }

    /**
     * Get account service address
     *
     * @return account service address
     */
    public String getAccountAddress() {
        return get(ACCOUNT_SERVER_URL);
    }

    /**
     * Get map service interface address
     *
     * @return map service interface address
     */
    public String getMapAddress() {
        return get(MAP_SERVER_URL);
    }

    /**
     * Get order service interface address
     *
     * @return order service interface address
     */
    public String getOrderAddress() {
        return get(ORDER_SERVER_URL);
    }

    /**
     * Get message service interface address
     *
     * @return message service interface address
     */
    public String getMessageAddress() {
        return get(MESSAGE_SERVER_URL);
    }

    /**
     * Get payment service interface address
     *
     * @return payment service interface address
     */
    public String getPayAddress() {
        return get(PAY_SERVER_URL);
    }

}
