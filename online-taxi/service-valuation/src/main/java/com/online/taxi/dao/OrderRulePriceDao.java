package com.online.taxi.dao;

import com.online.taxi.constatnt.ChargingCategoryEnum;
import com.online.taxi.entity.OrderRulePrice;
import com.online.taxi.mapper.OrderRulePriceMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 订单计费规则操作DAO
 *
 * @date 2018/8/14
 */
@Repository
@RequiredArgsConstructor
public class OrderRulePriceDao {

    @NonNull
    private OrderRulePriceMapper orderRulePriceMapper;

    /**
     * 新增一条订单计费规则
     *
     * @param orderRulePrice 一条订单计费规则
     * @return 影响的记录数
     */
    public int insert(OrderRulePrice orderRulePrice) {
        return orderRulePriceMapper.insertSelective(orderRulePrice);
    }

    /**
     * 删除指定订单ID和类型的订单
     *
     * @param orderId          订单ID
     * @param chargingCategory 订单类型
     * @return 影响的记录数
     */
    public int deleteByOrderIdAndCategory(int orderId, ChargingCategoryEnum chargingCategory) {
        return orderRulePriceMapper.deleteByOrderIdAndCategory(orderId, chargingCategory.getCode());
    }
}
