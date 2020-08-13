package com.online.taxi.dao;

import com.online.taxi.constatnt.ChargingCategoryEnum;
import com.online.taxi.entity.OrderRulePriceDetail;
import com.online.taxi.mapper.OrderRulePriceDetailMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 订单计费规则明细操作DAO
 *
 * @date 2018/8/14
 */
@Repository
@RequiredArgsConstructor
public class OrderRulePriceDetailDao {

    @NonNull
    private OrderRulePriceDetailMapper orderRulePriceDetailMapper;

    /**
     * 新增一条订单计费规则明细的记录
     *
     * @param orderRulePriceDetail 一条订单计费规则明细
     * @return 影响的记录数
     */
    public int insert(OrderRulePriceDetail orderRulePriceDetail) {
        return orderRulePriceDetailMapper.insertSelective(orderRulePriceDetail);
    }

    /**
     * 新增一组订单计费规则明细的记录
     *
     * @param orderRulePriceDetails 一组订单计费规则明细
     * @return 影响的记录数
     */
    public int insert(List<OrderRulePriceDetail> orderRulePriceDetails) {
        return orderRulePriceDetailMapper.insertList(orderRulePriceDetails);
    }

    /**
     * 删除指定订单ID和类型的订单
     *
     * @param orderId          订单ID
     * @param chargingCategory 订单类型
     * @return 影响的记录数
     */
    public int deleteByOrderIdAndCategory(int orderId, ChargingCategoryEnum chargingCategory) {
        return orderRulePriceDetailMapper.deleteByOrderIdAndCategory(orderId, chargingCategory.getCode());
    }
}
