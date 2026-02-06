package com.online.taxi.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * Log all requests
 * @author yueyi2019
 *
 */
@Aspect
@Component
@Slf4j
public class WebLogAspect {

    @Pointcut("execution(public * com.online.taxi.controller.*.*(..))")
    public void logPointCut() {
    }

    @Before("logPointCut()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
        // Received request, log request content
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        // Log request content
        log.info("request:{url : " + request.getRequestURL().toString()+", token:"+request.getHeader("token")
                +", method:"+request.getMethod()+", ip:"+request.getRemoteAddr()+", class method:"
                +joinPoint.getSignature().getDeclaringTypeName() + "."+ joinPoint.getSignature().getName()
                +", param:"+Arrays.toString(joinPoint.getArgs())+"}");

    }
    /**
     * The value of returning must match the parameter name of doAfterReturning
     */
    @AfterReturning(returning = "ret", pointcut = "logPointCut()")
    public void doAfterReturning(Object ret) throws Throwable {
        // Request processed, return content
        log.info("response : " + ret);
    }

    @Around("logPointCut()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        long startTime = System.currentTimeMillis();
        // ob is the return value of the method
        Object ob = pjp.proceed();
        log.info("Time elapsed : " + (System.currentTimeMillis() - startTime));
        return ob;
    }
}
