package com.online.taxi.dto;

import com.online.taxi.constatnt.ChargingCategoryEnum;
import com.online.taxi.dto.map.Distance;
import com.online.taxi.dto.map.Route;
import com.online.taxi.dto.request.CurrentPriceRequestDto;
import com.online.taxi.dto.valuation.charging.Rule;
import com.online.taxi.entity.Order;
import com.online.taxi.task.ValuationRequestTask;
import com.online.taxi.util.UnitConverter;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.experimental.Accessors;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Optional;

/**
 * 行驶计价相关的请求参数
 *
 * @date 2018/8/14
 */
@Data
@RequiredArgsConstructor
@Accessors(chain = true)
public class DriveMeter {

    /**
     * 订单
     */
    private Order order;

    /**
     * 计价规则
     */
    private Rule rule;

    /**
     * 预估时距离测量结果
     *
     * @see ChargingCategoryEnum
     */
    private Route route;

    /**
     * 实际轨迹里程
     *
     * @see ChargingCategoryEnum
     */
    private Distance distance;

    /**
     * 实时价格请求DTO
     */
    private CurrentPriceRequestDto currentPriceRequestDto;

    /**
     * 计价服务请求任务实体类
     */
    private ValuationRequestTask requestTask;

    /**
     * 计价规则种类枚举
     */
    @NonNull
    private ChargingCategoryEnum chargingCategoryEnum;

    /**
     * 返回行驶距离（米）
     *
     * @return 行驶距离
     */
    public double getTotalDistance() {
        Double meters = 0D;
        switch (chargingCategoryEnum) {
            case Forecast:
                meters = route.getDistance();
                break;
            case Settlement:
            case RealTime:
                meters = distance.getDistance();
                break;
            default:
                break;
        }
        return Optional.ofNullable(meters).orElse(0D);
    }

    /**
     * 返回行驶时间（秒）
     *
     * @return 行驶时间
     */
    public double getTotalTime() {
        double seconds = 0;
        switch (chargingCategoryEnum) {
            case Forecast:
                seconds = route.getDuration();
                break;
            case Settlement:
                seconds = Duration.ofMillis(order.getPassengerGetoffTime().getTime() - order.getReceivePassengerTime().getTime()).getSeconds();
                break;
            case RealTime:
                seconds = Duration.ofMillis(currentPriceRequestDto.getEndTime() - currentPriceRequestDto.getStartTime()).getSeconds();
                break;
            default:
                break;
        }
        return seconds;
    }

    /**
     * 返回订单开始时间
     *
     * @return 订单开始时间
     */
    public LocalDateTime getStartDateTime() {
        Date startDate = new Date();
        switch (chargingCategoryEnum) {
            case Forecast:
                startDate = order.getOrderStartTime();
                break;
            case Settlement:
                startDate = order.getReceivePassengerTime();
                break;
            case RealTime:
                startDate = new Date(currentPriceRequestDto.getStartTime());
                break;
            default:
                break;
        }
        return UnitConverter.dateToLocalDateTime(startDate);
    }

}
