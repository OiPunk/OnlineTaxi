package com.online.taxi.aspect;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.online.taxi.dto.government.SupervisionData;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.activemq.command.ActiveMQQueue;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Optional;

/**
 * 对insert，update和delete进行切面操作
 *
 * @author yueyi2019
 * @date 2018/8/22
 */
@Aspect
@Component
@RequiredArgsConstructor
@Slf4j
public class SupervisionAspect {

    @NonNull
    private ActiveMQQueue bufferQueue;

    @NonNull
    private JmsMessagingTemplate jmsTemplate;

    @Value("${government-upload.enabled}")
    private boolean isGovernmentUploadEnabled;

    /**
     * 插入操作的切入点
     */
    @Pointcut("execution(* com.online.taxi.mapper..*.insert*(..))")
    private void insert() {
    }

    /**
     * 更新操作的切入点
     */
    @Pointcut("execution(* com.online.taxi.mapper..*.update*(..))")
    private void update() {
    }

    /**
     * 删除操作的切入点
     */
    @Pointcut("execution(* com.online.taxi.mapper..*.delete*(..))")
    private void delete() {
    }

    /**
     * 插入成功后的操作
     *
     * @param joinPoint joinPoint
     */
    @AfterReturning(pointcut = "insert()")
    public void doAfterInsert(JoinPoint joinPoint) {
        send(SupervisionData.OperationType.INSERT, joinPoint);
    }

    /**
     * 插入成功后的操作
     *
     * @param joinPoint joinPoint
     */
    @AfterReturning(pointcut = "update()")
    public void doAfterUpdate(JoinPoint joinPoint) {
        send(SupervisionData.OperationType.UPDATE, joinPoint);
    }

    /**
     * 插入成功后的操作
     *
     * @param joinPoint joinPoint
     */
    @Before("delete()")
    public void doBeforeDelete(JoinPoint joinPoint) {
        send(SupervisionData.OperationType.DELETE, joinPoint);
    }

    /**
     * 上报
     *
     * @param operationType 操作类型
     * @param joinPoint     joinPoint
     */
    @SuppressWarnings("unchecked")
    private void send(SupervisionData.OperationType operationType, JoinPoint joinPoint) {
        if (!isGovernmentUploadEnabled) {
            return;
        }

        Optional<Object> param = Arrays.stream(joinPoint.getArgs()).findFirst();
        if (param.isPresent()) {
            try {
                Object entity = param.get();
                Integer id;
                String clsName;
                if (entity instanceof Integer) {
                    id = (Integer) entity;
                    String packageName = joinPoint.getSignature().getDeclaringTypeName();
                    clsName = StringUtils.substringBeforeLast(packageName, "Mapper").replace("mapper", "entity");
                } else {
                    id = (Integer) entity.getClass().getDeclaredMethod("getId").invoke(entity);
                    clsName = param.get().getClass().getName();
                }
                SupervisionData data = new SupervisionData().setClassName(clsName).setId(id).setOperationType(operationType);
                String json = new ObjectMapper().writeValueAsString(data);
                jmsTemplate.convertAndSend(bufferQueue, json);
            } catch (Exception e) {
                e.printStackTrace();
                log.error("SupervisionAspect发生错误：", e);
            }
        }
    }

}
