package com.online.taxi.dao;

import com.online.taxi.entity.Order;
import com.online.taxi.mapper.OrderMapper;
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
