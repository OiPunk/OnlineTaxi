package com.online.taxi.dao;

import com.online.taxi.constatnt.ChargingCategoryEnum;
import com.online.taxi.entity.OrderRulePriceTag;
import com.online.taxi.mapper.OrderRulePriceTagMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Tag charging detail DAO
 *
 * @date 2018/10/17
 */
@Repository
@RequiredArgsConstructor
public class OrderRulePriceTagDao {

    @NonNull
    private OrderRulePriceTagMapper orderRulePriceTagMapper;

    /**
     * Insert a batch of tag charging details
     *
     * @param orderRulePriceTags a batch of tag charging details
     * @return number of affected records
     */
    public int insert(List<OrderRulePriceTag> orderRulePriceTags) {
        return orderRulePriceTagMapper.insertList(orderRulePriceTags);
    }

    /**
     * Delete records by order ID and category
     *
     * @param orderId          order ID
     * @param chargingCategory order category
     * @return number of affected records
     */
    public int deleteByOrderIdAndCategory(int orderId, ChargingCategoryEnum chargingCategory) {
        return orderRulePriceTagMapper.deleteByOrderIdAndCategory(orderId, chargingCategory.getCode());
    }
}
