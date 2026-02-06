package com.online.taxi.zuul.util;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * Ciphertext blacklist
 * This example uses a Set; in production, Redis should be used so that multiple gateways can share this information. Use a Redis Set.
 * @author oi
 *
 */
public class CiphertextBlackList {

	public static Set<String> blackList = new HashSet<>();

	public boolean add(String cipher) {
		return blackList.add(cipher);
	}

	public boolean check(String cipher) {
		if(!blackList.contains(cipher)) {
			return true;
		}
		return false;
	}
}
