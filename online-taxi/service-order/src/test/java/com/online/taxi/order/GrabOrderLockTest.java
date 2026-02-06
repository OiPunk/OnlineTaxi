package com.online.taxi.order;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class GrabOrderLockTest implements Runnable {

	private static PassengerLockOrder order = new PassengerLockOrder();

	String driverName ;

	private static Lock lock = new ReentrantLock();

	public GrabOrderLockTest(String driverName) {
		this.driverName = driverName;
	}

	public static void main(String[] args) {
		for (int i = 0; i < 50; i++) {
			new Thread(new GrabOrderLockTest("Driver"+i)).start();
		}
	}

	@Override
	public void run() {
		lock.lock();
		try {
			if(order.count > 0) {
				System.out.println(driverName +" grabbed the order	yes");
				order.count = 0;
			}else {
				System.out.println(driverName +" did not grab the order  ");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			lock.unlock();
		}



	}

}
class PassengerLockOrder{
	String address = "Tiananmen";
	int count = 1;
}
