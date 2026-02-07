package com.rydr.dao;

import com.rydr.constatnt.ChargingCategoryEnum;
import com.rydr.entity.OrderRulePrice;
import com.rydr.mapper.OrderRulePriceMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * Order charging rule DAO
 *
 * @date 2018/8/14
 */
@Repository
@RequiredArgsConstructor
public class OrderRulePriceDao {

    @NonNull
    private OrderRulePriceMapper orderRulePriceMapper;

    /**
     * Insert a single order charging rule
     *
     * @param orderRulePrice a single order charging rule
     * @return number of affected records
     */
    public int insert(OrderRulePrice orderRulePrice) {
        return orderRulePriceMapper.insertSelective(orderRulePrice);
    }

    /**
     * Delete records by order ID and category
     *
     * @param orderId          order ID
     * @param chargingCategory order category
     * @return number of affected records
     */
    public int deleteByOrderIdAndCategory(int orderId, ChargingCategoryEnum chargingCategory) {
        return orderRulePriceMapper.deleteByOrderIdAndCategory(orderId, chargingCategory.getCode());
    }
}
