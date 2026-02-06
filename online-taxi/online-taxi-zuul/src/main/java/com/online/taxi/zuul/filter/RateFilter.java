package com.online.taxi.zuul.filter;


import javax.servlet.http.HttpServletRequest;

import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import com.google.common.util.concurrent.RateLimiter;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;

/**
 * @author oi
 */
@Component
public class RateFilter extends ZuulFilter {

	private static int count = 0;
	/**
	 * If set to 1, it means 1 token per second; the actual value should be obtained through stress testing.
	 *
	 * 1. Creates a RateLimiter with a stable token output rate, ensuring no more than permitsPerSecond requests per second on average.
	 * 2. When request arrival rate exceeds permitsPerSecond, ensures only permitsPerSecond requests are processed per second.
	 * 3. When this RateLimiter is underutilized (i.e., request arrival rate is less than permitsPerSecond),
	 * 		it will accumulate up to permitsPerSecond tokens.
	*/
	private static final RateLimiter RATE_LIMITER  = RateLimiter.create(5);

	@Override
	public boolean shouldFilter() {
		// Address-based filtering can be added here
		return false;
	}

	@Override
	public Object run() throws ZuulException {
		// Get the context
		RequestContext requestContext = RequestContext.getCurrentContext();
		HttpServletRequest request = requestContext.getRequest();

		requestContext.set("f", false);
		/**
		 * Returns immediately if no token is available. Attempts to acquire a token from the bucket;
		 * if available, returns true and decrements the total token count by 1. Otherwise returns false.
		 */
//		if(!RATE_LIMITER.tryAcquire()) {
			System.out.println("rate filter cannot acquire token, rate limited "+count++);
			requestContext.setSendZuulResponse(false);
			requestContext.setResponseStatusCode(HttpStatus.TOO_MANY_REQUESTS.value());
//		}
		return null;
	}

	@Override
	public String filterType() {
		return FilterConstants.PRE_TYPE;
	}

	/**
	 * Rate limiting should have the highest priority
	 */
	@Override
	public int filterOrder() {
		return -10;
	}

}
