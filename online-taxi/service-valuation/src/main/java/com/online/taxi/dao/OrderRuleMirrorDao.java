package com.online.taxi.dao;

import com.online.taxi.entity.OrderRuleMirror;
import com.online.taxi.mapper.OrderRuleMirrorMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 订单计费规则镜像操作DAO
 *
 * @date 2018/8/14
 */
@Repository
@RequiredArgsConstructor
public class OrderRuleMirrorDao {

    @NonNull
    private OrderRuleMirrorMapper orderRuleMirrorMapper;

    /**
     * 根据订单ID查询计费规则镜像
     *
     * @param orderId 订单ID
     * @return 计费规则镜像
     */
    public OrderRuleMirror selectByOrderId(Integer orderId) {
        return orderRuleMirrorMapper.selectByOrderId(orderId);
    }

}
