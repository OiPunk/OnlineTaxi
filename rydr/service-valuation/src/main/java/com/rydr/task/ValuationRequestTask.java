package com.rydr.task;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.rydr.dao.OrderRuleMirrorDao;
import com.rydr.dao.cache.RuleCache;
import com.rydr.dto.DriveMeter;
import com.rydr.dto.ResponseResult;
import com.rydr.dto.map.Distance;
import com.rydr.dto.map.Route;
import com.rydr.dto.valuation.charging.Rule;
import com.rydr.entity.OrderRuleMirror;
import com.rydr.util.RestTemplateHepler;
import com.rydr.util.ServiceAddress;
import com.rydr.util.UnitConverter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Valuation service request task
 *
 * @date 2018/8/14
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ValuationRequestTask {

    @NonNull
    private OrderRuleMirrorDao orderRuleMirrorDao;

    @NonNull
    private RuleCache ruleCache;

    @NonNull
    private RestTemplate restTemplate;

    @NonNull
    private ServiceAddress serviceAddress;

    /**
     * Parse JSON into Rule
     *
     * @param orderId order ID
     * @return Rule instance
     */
    @SneakyThrows
    public Rule requestRule(Integer orderId) {
        Rule rule;
        try {
            rule = ruleCache.get(orderId);
            if (rule != null) {
                return rule;
            }

            OrderRuleMirror orderRuleMirror = orderRuleMirrorDao.selectByOrderId(orderId);
            String ruleJson = orderRuleMirror.getRule();
            log.info("orderId={}, RuleJson={}", orderId, ruleJson);

            ObjectMapper objectMapper = new ObjectMapper();
            rule = objectMapper.readValue(ruleJson, Rule.class);
            ruleCache.set(orderId, rule);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("orderId={}, Error parsing RuleJson:", orderId, e);
            throw e;
        }

        return rule;
    }

    /**
     * Get route distance and travel time
     *
     * @param driveMeter driving information
     * @return driving information
     */
    @SneakyThrows
    public Route requestRoute(DriveMeter driveMeter) {
        Route route;
        try {
            Map<String, Object> map = new HashMap<>(4);
            map.put("originLongitude", driveMeter.getOrder().getStartLongitude());
            map.put("originLatitude", driveMeter.getOrder().getStartLatitude());
            map.put("destinationLongitude", driveMeter.getOrder().getEndLongitude());
            map.put("destinationLatitude", driveMeter.getOrder().getEndLatitude());
            log.info("orderId={}, Request Route={}", driveMeter.getOrder().getId(), map);

            String param = map.keySet().stream().map(k -> k + "={" + k + "}").collect(Collectors.joining("&"));
            String url = serviceAddress.getMapAddress() + "/distance?" + param;
            ResponseResult result = restTemplate.getForObject(url, ResponseResult.class, map);
            log.info("Route API call returned {}", result);
            route = RestTemplateHepler.parse(result, Route.class);

            if (null == route.getDuration() || null == route.getDistance()) {
                throw new Exception("Route content is empty: " + route);
            }

        } catch (Exception e) {
            e.printStackTrace();
            log.error("orderId={}, Error calling Route API: driveMeter={}", driveMeter.getOrder().getId(), driveMeter, e);
            throw e;
        }

        return route;
    }

    /**
     * Get route distance
     *
     * @param driveMeter driving information
     * @return driving information
     */
    @SneakyThrows
    public Distance requestDistance(DriveMeter driveMeter) {
        try {
            int carId = driveMeter.getOrder().getCarId();
            String cityCode = driveMeter.getRule().getKeyRule().getCityCode();
            LocalDateTime startTime = UnitConverter.dateToLocalDateTime(driveMeter.getOrder().getReceivePassengerTime());
            LocalDateTime endTime = UnitConverter.dateToLocalDateTime(driveMeter.getOrder().getPassengerGetoffTime());
            log.info("orderId={}", driveMeter.getOrder().getId());

            return requestDistance(carId, cityCode, startTime, endTime);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("orderId={}, Error calling Distance API: driveMeter={}", driveMeter.getOrder().getId(), driveMeter, e);
            throw e;
        }
    }

    /**
     * Get route distance
     *
     * @param carId     vehicle ID
     * @param cityCode  city code
     * @param startTime start time
     * @param endTime   end time
     * @return distance
     */
    @SneakyThrows
    public Distance requestDistance(int carId, String cityCode, LocalDateTime startTime, LocalDateTime endTime) {
        Map<String, Object> map = new HashMap<>(4);

        Distance result = new Distance();
        result.setDistance(0D);

        try {
            // Split calculation by day
            long totalSeconds = Duration.between(startTime, endTime).toMillis();
            long intervalSeconds = Duration.ofDays(1).minusSeconds(1).toMillis();

            // Calculate number of iterations
            int times = (int) Math.ceil(1.0 * totalSeconds / intervalSeconds);
            for (int i = 0; i < times; i++) {
                long startSecond = startTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli() + (i * intervalSeconds);
                long endSecond = Math.min(endTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli(), startSecond + intervalSeconds);

                map.clear();
                map.put("vehicleId", carId);
                map.put("city", cityCode);
                map.put("startTime", startSecond);
                map.put("endTime", endSecond);
                log.info("Request Distance={}", map);

                String param = map.keySet().stream().map(k -> k + "={" + k + "}").collect(Collectors.joining("&"));
                String url = serviceAddress.getMapAddress() + "/route/distance?" + param;
                ResponseResult responseResult = restTemplate.getForObject(url, ResponseResult.class, map);
                Distance distance = RestTemplateHepler.parse(responseResult, Distance.class);

                if (null == distance || null == distance.getDistance()) {
                    throw new Exception("Distance content is empty: " + result);
                }

                result.setDistance(result.getDistance() + distance.getDistance());
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("Error calling Route Distance API: carId={}, cityCode={}, startTime={}, endTime={}", carId, cityCode, startTime, endTime, e);
            throw e;
        }

        return result;
    }

}
