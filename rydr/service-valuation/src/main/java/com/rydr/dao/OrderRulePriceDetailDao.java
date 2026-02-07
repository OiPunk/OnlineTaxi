package com.rydr.dao;

import com.rydr.constatnt.ChargingCategoryEnum;
import com.rydr.entity.OrderRulePriceDetail;
import com.rydr.mapper.OrderRulePriceDetailMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Order charging rule detail DAO
 *
 * @date 2018/8/14
 */
@Repository
@RequiredArgsConstructor
public class OrderRulePriceDetailDao {

    @NonNull
    private OrderRulePriceDetailMapper orderRulePriceDetailMapper;

    /**
     * Insert a single order charging rule detail record
     *
     * @param orderRulePriceDetail a single order charging rule detail
     * @return number of affected records
     */
    public int insert(OrderRulePriceDetail orderRulePriceDetail) {
        return orderRulePriceDetailMapper.insertSelective(orderRulePriceDetail);
    }

    /**
     * Insert a batch of order charging rule detail records
     *
     * @param orderRulePriceDetails a batch of order charging rule details
     * @return number of affected records
     */
    public int insert(List<OrderRulePriceDetail> orderRulePriceDetails) {
        return orderRulePriceDetailMapper.insertList(orderRulePriceDetails);
    }

    /**
     * Delete records by order ID and category
     *
     * @param orderId          order ID
     * @param chargingCategory order category
     * @return number of affected records
     */
    public int deleteByOrderIdAndCategory(int orderId, ChargingCategoryEnum chargingCategory) {
        return orderRulePriceDetailMapper.deleteByOrderIdAndCategory(orderId, chargingCategory.getCode());
    }
}
