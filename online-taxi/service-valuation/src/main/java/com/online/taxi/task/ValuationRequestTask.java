package com.online.taxi.task;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.online.taxi.dao.OrderRuleMirrorDao;
import com.online.taxi.dao.cache.RuleCache;
import com.online.taxi.dto.DriveMeter;
import com.online.taxi.dto.ResponseResult;
import com.online.taxi.dto.map.Distance;
import com.online.taxi.dto.map.Route;
import com.online.taxi.dto.valuation.charging.Rule;
import com.online.taxi.entity.OrderRuleMirror;
import com.online.taxi.util.RestTemplateHepler;
import com.online.taxi.util.ServiceAddress;
import com.online.taxi.util.UnitConverter;
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
 * 计价服务请求任务
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
     * 将Json解析为Rule
     *
     * @param orderId 订单id
     * @return rule实例
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
            log.error("orderId={}, 解析RuleJson错误:", orderId, e);
            throw e;
        }

        return rule;
    }

    /**
     * 获取路途长度和行驶时间
     *
     * @param driveMeter 行驶信息
     * @return 行驶信息
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
            log.info("调用接口Route返回{}", result);
            route = RestTemplateHepler.parse(result, Route.class);

            if (null == route.getDuration() || null == route.getDistance()) {
                throw new Exception("Route内容为空：" + route);
            }

        } catch (Exception e) {
            e.printStackTrace();
            log.error("orderId={}, 调用接口Route错误:driveMeter={}", driveMeter.getOrder().getId(), driveMeter, e);
            throw e;
        }

        return route;
    }

    /**
     * 获取路途长度
     *
     * @param driveMeter 行驶信息
     * @return 行驶信息
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
            log.error("orderId={}, 调用接口Distance错误:driveMeter={}", driveMeter.getOrder().getId(), driveMeter, e);
            throw e;
        }
    }

    /**
     * 获取路途长度
     *
     * @param carId     车辆ID
     * @param cityCode  城市编码
     * @param startTime 开始时间点
     * @param endTime   结束时间点
     * @return 距离
     */
    @SneakyThrows
    public Distance requestDistance(int carId, String cityCode, LocalDateTime startTime, LocalDateTime endTime) {
        Map<String, Object> map = new HashMap<>(4);

        Distance result = new Distance();
        result.setDistance(0D);

        try {
            //按天分割计算
            long totalSeconds = Duration.between(startTime, endTime).toMillis();
            long intervalSeconds = Duration.ofDays(1).minusSeconds(1).toMillis();

            //计算次数
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
                    throw new Exception("distance内容为空：" + result);
                }

                result.setDistance(result.getDistance() + distance.getDistance());
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("调用接口Route Distance错误:carId={},cityCode={},startTime={},endTime={}", carId, cityCode, startTime, endTime, e);
            throw e;
        }

        return result;
    }

}
