package com.rydr.taxi.common.util;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;

/**
 * @author oi
 */
public class Sha1Util {

    /**
     * Convert input source to ciphertext
     * @param src
     * @return
     */
    public static String encode(String src) {
        if (StringUtils.isEmpty(src)) {
            return null;
        } else {
            return DigestUtils.sha1Hex(src);

        }
    }
    
    public static void main(String[] args) {
		System.out.println(encode("test"));
	}
}
