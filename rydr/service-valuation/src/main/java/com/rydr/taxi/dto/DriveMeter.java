package com.rydr.taxi.dto;

import com.rydr.taxi.constatnt.ChargingCategoryEnum;
import com.rydr.taxi.dto.map.Distance;
import com.rydr.taxi.dto.map.Route;
import com.rydr.taxi.dto.request.CurrentPriceRequestDto;
import com.rydr.taxi.dto.valuation.charging.Rule;
import com.rydr.taxi.entity.Order;
import com.rydr.taxi.task.ValuationRequestTask;
import com.rydr.taxi.util.UnitConverter;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.experimental.Accessors;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Optional;

/**
 * Driving valuation related request parameters
 *
 * @date 2018/8/14
 */
@Data
@RequiredArgsConstructor
@Accessors(chain = true)
public class DriveMeter {

    /**
     * Order
     */
    private Order order;

    /**
     * Charging rule
     */
    private Rule rule;

    /**
     * Distance measurement result for forecast
     *
     * @see ChargingCategoryEnum
     */
    private Route route;

    /**
     * Actual trajectory mileage
     *
     * @see ChargingCategoryEnum
     */
    private Distance distance;

    /**
     * Real-time price request DTO
     */
    private CurrentPriceRequestDto currentPriceRequestDto;

    /**
     * Valuation service request task entity
     */
    private ValuationRequestTask requestTask;

    /**
     * Charging category enum
     */
    @NonNull
    private ChargingCategoryEnum chargingCategoryEnum;

    /**
     * Return travel distance (meters)
     *
     * @return travel distance
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
     * Return travel time (seconds)
     *
     * @return travel time
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
     * Return order start time
     *
     * @return order start time
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
