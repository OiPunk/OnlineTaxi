package com.online.taxi.zuul.filter;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
/**
 * 	Request legitimacy check
 * @author oi
 */
@Component
public class RequestCheckFilter extends ZuulFilter {

	private String secret = "${ZUUL_SECRET:default-secret}";

	/**
	 * 	Whether this filter is active
	 */
	@Override
	public boolean shouldFilter() {
		return true;
	}

	/**
	 * 	Specific business logic after interception
	 */
	@Override
	public Object run() throws ZuulException {
		System.out.println("request check intercepted");
		// Get the context (important, spans all filters, contains all parameters)
		RequestContext requestContext = RequestContext.getCurrentContext();
		HttpServletRequest request = requestContext.getRequest();

		Long timestamp = Long.valueOf(request.getHeader("timestamp"));
		String token = request.getHeader("token");
		String sign = request.getHeader("sign");

		String localSign = DigestUtils.sha1Hex(token + timestamp + secret);
		boolean flag = true;
		// Check if the timestamp is within 1 second
		Long now = Calendar.getInstance().getTimeInMillis();
		if(!(flag && (now - timestamp < 1 * 1000))) {
			flag = false;
		}

		if(!(flag && (localSign.trim().equals(sign)))) {
			flag = false;
		}

		if(flag) {
			System.out.println("Request is legitimate");
		}else {
			requestContext.setSendZuulResponse(false);
			requestContext.setResponseStatusCode(444);
			requestContext.setResponseBody("Illegal request");
			System.out.println("Request is illegal");
		}


		return null;
	}
	/**
	 * Interception type, 4 types available.
	 */
	@Override
	public String filterType() {
		// TODO Auto-generated method stub
		return FilterConstants.PRE_TYPE;
	}

	/**
	 * 	The smaller the value, the higher the priority
	 */
	@Override
	public int filterOrder() {
		// TODO Auto-generated method stub
		return 4;
	}



}
