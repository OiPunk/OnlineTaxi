package com.online.taxi.demo.taxi.common.response;

public class LoginResponse {
	
	private String id;
	
	private String name;
	
	/**
	 * 1:乘客
	 * 2:司机
	 */
	private Integer roleCode;
	
	private Integer workStatus;
	
	
	public Integer getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(Integer workStatus) {
		this.workStatus = workStatus;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(Integer roleCode) {
		this.roleCode = roleCode;
	}
	
	
}
