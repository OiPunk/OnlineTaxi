package com.rydr.taxi.controller;

public class test {

	static void testJoin() {
	    Object o = new Object();

	    Thread t1 = new Thread(() -> {
	        synchronized (o) {
	            for (int i = 0; i < 10; i++) {
	                System.out.println("A" + i);
	                try {
	                    Thread.sleep(500);
	                    //TimeUnit.Milliseconds.sleep(500)
	                } catch (InterruptedException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    });
	    Thread t2 = new Thread(() -> {
	        System.out.println("t2 I have started");
	        synchronized (o) {
	            System.out.println("t2 I have acquired the lock");
	            try {
	                Thread.sleep(500);
	                t1.join();
	            } catch (InterruptedException e) {
	                e.printStackTrace();
	            }
	            for (int i = 0; i < 10; i++) {
	                System.out.println("B" + i);
	                try {
	                    Thread.sleep(500);
	                    //TimeUnit.Milliseconds.sleep(500)
	                } catch (InterruptedException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    });

	    t2.start();
//	    try {
//	        Thread.sleep(50);
//	    } catch (InterruptedException e) {
//	        e.printStackTrace();
//	    }
	    t1.start();
	}

	public static void main(String[] args) {
		testJoin();
	}
}
