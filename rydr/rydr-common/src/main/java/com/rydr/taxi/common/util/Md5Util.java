package com.rydr.taxi.common.util;

import org.apache.commons.codec.digest.DigestUtils;

public class Md5Util {
	
	/**
	 * Generate 32-bit MD5 hash
	 * @param src
	 * @return
	 */
	public static String getMd5(String src) {
		return DigestUtils.md5Hex(src);
	}
	
	public static void main(String[] args) {
		System.out.println(getMd5("test"));
	}
}
