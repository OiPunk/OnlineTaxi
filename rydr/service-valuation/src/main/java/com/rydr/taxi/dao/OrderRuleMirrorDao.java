package com.rydr.taxi.dao;

import com.rydr.taxi.entity.OrderRuleMirror;
import com.rydr.taxi.mapper.OrderRuleMirrorMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * Order charging rule mirror DAO
 *
 * @date 2018/8/14
 */
@Repository
@RequiredArgsConstructor
public class OrderRuleMirrorDao {

    @NonNull
    private OrderRuleMirrorMapper orderRuleMirrorMapper;

    /**
     * Query charging rule mirror by order ID
     *
     * @param orderId order ID
     * @return charging rule mirror
     */
    public OrderRuleMirror selectByOrderId(Integer orderId) {
        return orderRuleMirrorMapper.selectByOrderId(orderId);
    }

}
