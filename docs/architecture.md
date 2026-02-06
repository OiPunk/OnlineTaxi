# Architecture Guide

[Back to README](../README.md)

## System Architecture

Rydr follows a **three-layer microservices architecture** powered by Spring Cloud:

```
                        ┌─────────────┐
                        │   Clients   │
                        │ (Mobile/Web)│
                        └──────┬──────┘
                               │
                    ┌──────────▼──────────┐
                    │   Zuul API Gateway  │
                    │      (Port 9100)    │
                    │  - Rate limiting    │
                    │  - Auth filtering   │
                    │  - Request routing  │
                    └──────────┬──────────┘
                               │
          ┌────────────────────┼────────────────────┐
          │                    │                     │
   ┌──────▼──────┐     ┌──────▼──────┐     ┌───────▼───────┐
   │api-passenger │     │  api-driver │     │api-listen-order│
   │   (9011)    │     │ (9002-9003) │     │    (8084)      │
   │  - Feign    │     │ - Ribbon    │     │  - WebSocket   │
   │  - Hystrix  │     │ - Hystrix   │     │                │
   └──────┬──────┘     └──────┬──────┘     └───────┬───────┘
          │                    │                     │
          └────────────────────┼─────────────────────┘
                               │ (Service Discovery via Eureka)
          ┌──────────┬─────────┼──────────┬──────────┐
          │          │         │          │          │
   ┌──────▼───┐ ┌───▼────┐ ┌─▼──────┐ ┌▼────────┐ ┌▼──────┐
   │  Order   │ │  SMS   │ │Valuatn │ │Passenger│ │Verify │
   │8004-8005 │ │8002-03 │ │8060-61 │ │  8012   │ │ 8011  │
   └──────┬───┘ └───┬────┘ └─┬──────┘ └┬────────┘ └┬──────┘
          │          │        │         │           │
     ┌────┴──────────┴────────┴─────────┴───────────┘
     │
┌────▼─────────────────────────────────────────────┐
│              Data & Infrastructure                │
│  ┌───────┐  ┌───────┐  ┌─────────┐  ┌────────┐  │
│  │ MySQL │  │ Redis │  │RabbitMQ │  │ActiveMQ│  │
│  └───────┘  └───────┘  └─────────┘  └────────┘  │
└──────────────────────────────────────────────────┘
```

## Service Communication

### Synchronous Communication

**Feign (Declarative HTTP Client)**
- Used by `api-passenger` to call downstream services
- Circuit breaker enabled via Hystrix
- Example: `api-passenger` -> `service-valuation` for price forecast

**RestTemplate (Load-balanced HTTP)**
- Used by `api-driver` with `@LoadBalanced` annotation
- Ribbon provides client-side load balancing
- Eager loading configured for critical dependencies

### Asynchronous Communication

**ActiveMQ (JMS)**
- Queue-based messaging for background tasks
- Example modules: `service-jms-produce`, `service-jms-consumer`

**RabbitMQ (Spring Cloud Bus)**
- Used for distributed configuration refresh
- Config Server pushes updates to all connected clients

### Real-time Communication

**WebSocket**
- `api-listen-order` provides WebSocket endpoints
- Drivers receive real-time order notifications
- `rydr-demo-app` includes WebSocket client demo

## Resilience Patterns

### Circuit Breaker (Hystrix)
- Applied to all Feign clients
- Fallback mechanisms for degraded service
- Dashboard monitoring at port 6101

### Service Discovery (Eureka)
- All services register with Eureka on startup
- Heartbeat interval: 1 second
- Service expiration: 1 second
- Self-preservation disabled for fast failover

### Load Balancing (Ribbon)
- Client-side load balancing
- Multiple instances per service (e.g., api-driver on 9002, 9003)
- Custom rules available (RandomRule)

## Configuration Management

### Spring Cloud Config
- Git-backed centralized configuration
- Config Server at port 6001
- Environment-specific profiles (dev, prod)

### Dynamic Refresh
- RabbitMQ bus for config change propagation
- `/actuator/bus-refresh` endpoint triggers updates
- No service restart needed for config changes

## Security Architecture

### API Gateway Security
- `AuthFilter`: JWT token validation
- `RequestCheckFilter`: Request signature verification
- `RateFilter`: Rate limiting
- `PreFilter`: Request preprocessing

### Authentication
- JWT-based authentication
- Token validation at gateway level
- Configurable secret via environment variables

### Credential Management
- All credentials externalized to environment variables
- `.env.example` template provided
- No hardcoded secrets in source code

## Database Architecture

### Dual Database Setup
- `rydr`: Order and valuation data
- `rydr-three`: Passenger and SMS data

### Key Design Decisions
- MyBatis for flexible SQL mapping
- Druid connection pool for monitoring
- Redis for caching and distributed locking
- 108 tables covering all domain entities

## Monitoring & Observability

| Tool | Port | Purpose |
|------|------|---------|
| Spring Boot Admin | 6010 | Service health, metrics, logs |
| Hystrix Dashboard | 6101 | Circuit breaker monitoring |
| Zipkin | 9411 | Distributed request tracing |
| Actuator | per-service | Health checks, metrics |
