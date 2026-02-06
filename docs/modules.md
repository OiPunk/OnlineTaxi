# Module Guide

[Back to README](../README.md) | [Architecture](architecture.md)

This document provides detailed descriptions of each module in the Rydr platform.

---

## API Layer

### api-passenger
**Port:** 9011 | **Path:** `rydr/api-passenger`

Passenger-facing REST API providing endpoints for:
- SMS verification and login (`/sms/send`, `/sms/verify`)
- Ride price forecasting (`/order/forecast`)
- User authentication
- Gateway connectivity testing

**Key Technologies:** Feign (service calls), Hystrix (circuit breaker), Sleuth (tracing)

### api-driver
**Port:** 9002, 9003 | **Path:** `rydr/api-driver`

Driver-facing REST API providing endpoints for:
- SMS verification and login
- Order grabbing and management
- Driver status updates

**Key Technologies:** Ribbon (load balancing), RestTemplate, Hystrix, custom Ribbon rules

### api-listen-order
**Port:** 8084 | **Path:** `rydr/api-listen-order`

Real-time order event service for drivers:
- WebSocket-based order broadcasting
- Service instance discovery endpoints
- Order dispatch event listening

---

## Service Layer

### service-order
**Port:** 8004, 8005 | **Path:** `rydr/service-order`

Core order management service featuring:
- Order creation and lifecycle management
- **Distributed locking** implementations:
  - JVM-level locks
  - MySQL-based locks
  - Redis-based locks
  - Redisson distributed locks
  - RedLock (multi-Redis) implementation
- Lock renewal service for long-running operations

**Key Technologies:** Redis, MyBatis, Druid, Redis Sentinel

### service-order-dispatch
**Port:** 8005 | **Path:** `rydr/service-order-dispatch`

Driver-order matching and dispatch:
- Intelligent order assignment algorithm
- Dispatch event handling
- Async operation support

### service-passenger-user
**Port:** 8012 | **Path:** `rydr/service-passenger-user`

Passenger account management:
- User registration and profile management
- Address CRUD operations
- Token-based session management
- Phone number-based user lookup

**Key Technologies:** MyBatis, Druid, MySQL

### service-sms
**Port:** 8002, 8003 | **Path:** `rydr/service-sms`

SMS notification service:
- Template-based SMS delivery
- Alibaba Cloud SMS integration
- Gateway connectivity testing

**Key Technologies:** MyBatis, Druid, Sleuth

### service-valuation
**Port:** 8060, 8061 | **Path:** `rydr/service-valuation`

Ride pricing engine:
- Single and batch price forecasting
- Dynamic pricing rules
- Time-based fare calculation (peak hours, night rates)
- Distance and duration-based pricing
- Discount and adjustment rules

**Key Technologies:** Spring Security, Redis caching, complex rule engine

### service-verification-code
**Port:** 8011 | **Path:** `rydr/service-verification-code`

Login verification code service:
- One-time code generation (6-digit)
- Code validation with expiry
- Config center integration for dynamic settings

### service-wallet
**Port:** 8006 | **Path:** `rydr/service-wallet`

User wallet management:
- Balance tracking
- Eureka-registered for service discovery

---

## Infrastructure

### eureka
**Port:** 7900 | **Path:** `rydr/eureka`

Netflix Eureka service registry:
- Basic auth protection (admin/changeme)
- Self-preservation disabled for dev environments
- 5-second eviction interval
- CSRF protection disabled for peer communication

### rydr-config-server
**Port:** 6001 | **Path:** `rydr/rydr-config-server`

Spring Cloud Config Server:
- Git-based configuration repository
- RabbitMQ bus for dynamic refresh
- Environment-specific profile support

### rydr-zuul
**Port:** 9100 | **Path:** `rydr/rydr-zuul`

Netflix Zuul API Gateway with custom filters:
- **AuthFilter**: JWT token validation
- **PreFilter**: Request preprocessing and logging
- **RateFilter**: Request rate limiting
- **RequestCheckFilter**: Signature-based request validation

Includes 8 example configuration variants demonstrating different routing patterns.

### cloud-admin
**Port:** 6010 | **Path:** `rydr/cloud-admin`

Spring Boot Admin monitoring dashboard:
- Service health monitoring
- Email notification alerts
- Custom event handling

### hystrix-dashboard
**Port:** 6101 | **Path:** `rydr/hystrix-dashboard`

Hystrix circuit breaker monitoring UI for visual monitoring of service health.

---

## Shared Library

### rydr-common
**Path:** `rydr/rydr-common`

Shared artifacts used across all services:
- **DTOs**: ResponseResult, ShortMsgRequest, PriceResult, ForecastDetail
- **Constants**: OrderStatusEnum, CommonStatusEnum, RedisKeyConstant
- **Utilities**: JwtUtil, Md5Util, PhoneUtil, BigDecimalUtil, TimeUtils
- **Validation**: PhoneNumberValidator
- **Aspects**: WebLogAspect, SupervisionAspect

---

## Example/Demo Modules

### config-client / config-client-diy
Config Server client implementations demonstrating:
- Spring Cloud Config consumption
- Dynamic property refresh via RabbitMQ bus
- Custom stream listeners

### service-jms-produce / service-jms-consumer
ActiveMQ integration examples:
- Queue and topic message patterns
- Producer-consumer architecture
- ActiveMQ configuration

### rydr-demo-app
**Port:** 8083

Full demo application with:
- WebSocket client and server implementation
- Login controller
- Vue.js frontend (pre-compiled)
