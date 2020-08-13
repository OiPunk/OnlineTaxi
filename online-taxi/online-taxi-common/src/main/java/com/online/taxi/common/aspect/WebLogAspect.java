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
 * 记录所有日志
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
        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        // 记录下请求内容
        log.info("request:{url : " + request.getRequestURL().toString()+", token:"+request.getHeader("token")
                +", method:"+request.getMethod()+", ip:"+request.getRemoteAddr()+", class method:"
                +joinPoint.getSignature().getDeclaringTypeName() + "."+ joinPoint.getSignature().getName()
                +", param:"+Arrays.toString(joinPoint.getArgs())+"}");

    }
    /**
     *  returning的值和doAfterReturning的参数名一致
      */
    @AfterReturning(returning = "ret", pointcut = "logPointCut()")
    public void doAfterReturning(Object ret) throws Throwable {
        // 处理完请求，返回内容
        log.info("response : " + ret);
    }

    @Around("logPointCut()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        long startTime = System.currentTimeMillis();
        // ob 为方法的返回值
        Object ob = pjp.proceed();
        log.info("耗时 : " + (System.currentTimeMillis() - startTime));
        return ob;
    }
}
