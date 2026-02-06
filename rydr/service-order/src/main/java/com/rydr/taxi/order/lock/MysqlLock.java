package com.rydr.taxi.order.lock;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.rydr.taxi.common.entity.OrderLock;
import com.rydr.taxi.order.dao.OrderLockMapper;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Service
@Data
public class MysqlLock implements Lock {

	@Autowired
	private OrderLockMapper mapper;

	private ThreadLocal<OrderLock> orderLockThreadLocal ;

	@Override
	public void lock() {
		// 1. Try to acquire the lock
		if(tryLock()) {
			return;
		}
		// 2. Sleep
		try {
			Thread.sleep(10);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		// 3. Recursively call again
		lock();
	}

	/**
	 * Non-blocking lock attempt: succeeds or fails immediately and returns directly
	 */
	@Override
	public boolean tryLock() {
		try {
			mapper.insertSelective(orderLockThreadLocal.get());
			System.out.println("Lock acquired on object: "+orderLockThreadLocal.get());
			return true;
		}catch (Exception e) {
			return false;
		}


	}

	@Override
	public void unlock() {
		mapper.deleteByPrimaryKey(orderLockThreadLocal.get().getOrderId());
		System.out.println("Lock released on object: "+orderLockThreadLocal.get());
		orderLockThreadLocal.remove();
	}

	@Override
	public void lockInterruptibly() throws InterruptedException {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean tryLock(long time, TimeUnit unit) throws InterruptedException {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public Condition newCondition() {
		// TODO Auto-generated method stub
		return null;
	}

}
