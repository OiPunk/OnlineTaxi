package com.rydr.request;

/**
 * @author oi
 */


public class CodeVerifyRequest {

	private int identity;

	private String phoneNumber;
	
	private String code;

    public int getIdentity() {
        return identity;
    }
    
    public void setIdentity(int identity) {
        this.identity = identity;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
