package com.online.taxi.zuul.filter;

import javax.servlet.http.HttpServletRequest;

import com.online.taxi.common.util.JwtUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
/**
 * Authentication filter
 * @author oi
 */
@Component
public class AuthFilter extends ZuulFilter {

	/**
	 * 	Whether this filter is active
	 */
	@Override
	public boolean shouldFilter() {
		// Get the context
		RequestContext requestContext = RequestContext.getCurrentContext();
		HttpServletRequest request = requestContext.getRequest();

		String uri = request.getRequestURI();
		System.out.println("Source uri: "+uri);
		// Only this endpoint /api-passenger/api-passenger-gateway-test/hello will be intercepted
		String checkUri = "/api-passenger/api-passenger-gateway-test/hello";
		if(checkUri.equalsIgnoreCase(uri)) {
			return true;
		}
		// Test path
//		if(uri.contains("api-driver")) {
//			return true;
//		}

		return false;
	}

	/**
	 * 	Specific business logic after interception
	 */
	@Override
	public Object run() throws ZuulException {
		System.out.println("auth intercepted");
		// Get the context (important, spans all filters, contains all parameters)
		RequestContext requestContext = RequestContext.getCurrentContext();
		HttpServletRequest request = requestContext.getRequest();

		String token = request.getHeader("Authorization");
		// If token is 1234, pass
		String defaultToken = "1234";

        String parseToken = JwtUtil.parseToken(token);

        if(StringUtils.isNotBlank(parseToken)) {
			System.out.println("auth filter: verification passed");
		} else {
			// Stop forwarding to downstream filters
			requestContext.setSendZuulResponse(false);
			requestContext.setResponseStatusCode(HttpStatus.UNAUTHORIZED.value());
			requestContext.setResponseBody("Authentication failed");
		}
		requestContext.setSendZuulResponse(true);
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
