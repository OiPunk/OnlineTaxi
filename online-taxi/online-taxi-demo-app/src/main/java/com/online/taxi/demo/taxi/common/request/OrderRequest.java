package com.online.taxi.demo.taxi.common.request;

public class OrderRequest {
	
	private String orderId;
	
	private String startLng;
	
	private String startLat;
	
	private String startAddress;
	
	private String endLng;
	
	private String endLat;
	
	private String endAddress;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getStartLng() {
		return startLng;
	}

	public void setStartLng(String startLng) {
		this.startLng = startLng;
	}

	public String getStartLat() {
		return startLat;
	}

	public void setStartLat(String startLat) {
		this.startLat = startLat;
	}

	public String getStartAddress() {
		return startAddress;
	}

	public void setStartAddress(String startAddress) {
		this.startAddress = startAddress;
	}

	public String getEndLng() {
		return endLng;
	}

	public void setEndLng(String endLng) {
		this.endLng = endLng;
	}

	public String getEndLat() {
		return endLat;
	}

	public void setEndLat(String endLat) {
		this.endLat = endLat;
	}

	public String getEndAddress() {
		return endAddress;
	}

	public void setEndAddress(String endAddress) {
		this.endAddress = endAddress;
	}
	
	
}
