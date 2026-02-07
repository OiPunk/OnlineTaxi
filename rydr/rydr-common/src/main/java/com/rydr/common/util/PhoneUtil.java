package com.rydr.common.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

/**
 * Phone Number Utility Class
 * @author oi
 *
 */
public class PhoneUtil {

	private static final int PHONE_LENGTH = 11;
	/**
	 	China Telecom number segments: 133, 149, 153, 173, 177, 180, 181, 189, 199
		China Unicom number segments: 130, 131, 132, 145, 155, 156, 166, 175, 176, 185, 186
		China Mobile number segments: 134(0-8), 135, 136, 137, 138, 139, 147, 150, 151, 152, 157, 158, 159, 178, 182, 183, 184, 187, 188, 198
		Other number segments
		14x segments were previously exclusive for data cards, e.g., China Unicom uses 145, China Mobile uses 147, etc.
		Virtual operators
		Telecom: 1700, 1701, 1702
		Mobile: 1703, 1705, 1706
		Unicom: 1704, 1707, 1708, 1709, 171
		Satellite communication: 1349
	 */
	private static final String PHONE_REGEX = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
	
	public static boolean isPhone(String phone) {
	    if(StringUtils.isBlank(phone)) {
	    	return false;
	    }
	    phone = phone.trim();
	    if (phone.length() != PHONE_LENGTH) {
	        return false;
	    } else {
	        Pattern p = Pattern.compile(PHONE_REGEX);
	        Matcher m = p.matcher(phone);
	        boolean isMatch = m.matches();
	        if (!isMatch) {
	            return false;
	        }
	        return true;
	    }
	}
	
	public static void main(String[] args) {
		System.out.println(isPhone("rtyt56t5r45"));
	}
}
