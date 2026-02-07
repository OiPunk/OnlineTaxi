package com.rydr.dao;

import com.rydr.entity.Order;
import com.rydr.mapper.OrderMapper;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * Order DAO
 *
 * @date 2018/8/14
 */
@Repository
@RequiredArgsConstructor
public class OrderDao {

    @NonNull
    private OrderMapper orderMapper;

    /**
     * Query order by order ID
     *
     * @param id order ID
     * @return order
     */
    public Order selectByOrderId(Integer id) {
        return orderMapper.selectByPrimaryKey(id);
    }

}
