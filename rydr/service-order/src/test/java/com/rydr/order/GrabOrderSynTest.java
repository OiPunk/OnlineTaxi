package com.rydr.order;

public class GrabOrderSynTest implements Runnable {

	private static PassengerOrder order = new PassengerOrder();

	String driverName ;

	public GrabOrderSynTest(String driverName) {
		this.driverName = driverName;
	}

	public static void main(String[] args) {
		for (int i = 0; i < 50; i++) {
			new Thread(new GrabOrderSynTest("Driver"+i)).start();
		}
	}

	@Override
	public void run() {
		synchronized (order) {
			if(order.count > 0) {
				System.out.println(driverName +" grabbed the order	yes");
				order.count = 0;
			}else {
				System.out.println(driverName +" did not grab the order  ");
			}
		}


	}

}
class PassengerOrder{
	String address = "Tiananmen";
	int count = 1;
}
