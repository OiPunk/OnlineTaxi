package com.rydr.zuul.filter;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
/**
 *  pre filter
 * @author oi
 */
@Component
public class PreFilter extends ZuulFilter {

	/**
	 * Whether the filter is active
	 */
	@Override
	public boolean shouldFilter() {
		// Get the context
		RequestContext requestContext = RequestContext.getCurrentContext();
		HttpServletRequest request = requestContext.getRequest();

		String uri = request.getRequestURI();
		System.out.println("pre source uri: "+uri);
		// Only this endpoint /api-passenger/api-passenger-gateway-test/hello will be intercepted
//		String checkUri = "/api-passenger/api-passenger-gateway-test/hello";
//		if(checkUri.equalsIgnoreCase(uri)) {
//			return true;
//		}
//
		return false;

//		return (boolean)requestContext.get("f");
	}

	@Override
	public Object run() throws ZuulException {
		System.out.println("pre intercepted");
		// Get the context
		RequestContext requestContext = RequestContext.getCurrentContext();
		HttpServletRequest request = requestContext.getRequest();

		String token = request.getHeader("token");
		System.out.println("pre business logic token:"+token);
		return null;
	}

	@Override
	public String filterType() {
		// TODO Auto-generated method stub
		return FilterConstants.PRE_TYPE;
	}

	@Override
	public int filterOrder() {
		// TODO Auto-generated method stub
		return 4;
	}

}
