package com.rydr.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rydr.entity.Order;
import com.rydr.order.dao.OrderMapper;
import com.rydr.order.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;

	public boolean grab(int orderId, int driverId) {
		Order order = mapper.selectByPrimaryKey(orderId);
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		if (order.getStatus().intValue() == 0) {
			order.setStatus(1);
			mapper.updateByPrimaryKeySelective(order);

			return true;
		}
		return false;

	}
}
