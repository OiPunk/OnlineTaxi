# OnlineTaxi
### 服务拆分

#### 业务层

| 模块     | 项目名           | 描述     |
| -------- | ---------------- | -------- |
| 乘客端   | api-passenger    | 乘客端   |
| 司机端   | api-driver       | 司机端   |
| 司机听单 | api-listen-order | 司机听单 |

#### 能力层

| 模块         | 项目名                    |
| ------------ | ------------------------- |
| 订单         | service-order             |
| 派单         | service-order-dispatch    |
| 乘客用户管理 | service-passenger-user    |
| 短信         | service-sms               |
| 计价         | service-valuation         |
| 验证码       | service-verification-code |
| 钱包         | service-wallet            |
| 支付         | service-payment           |
| 地图         | service-map               |

#### Spring Cloud 组件

| 模块     | 项目名                  |
| -------- | ----------------------- |
| 注册中心 | cloud-eureka            |
| 配置中心 | cloud-config-server     |
| 网关     | cloud-zuul              |
| 熔断监控 | cloud-hystrix-dashboard |
| 健康检查 | cloud-admin             |
| 链路追踪 | cloud-zipkin-ui         |

#### 基础common

所有服务都引用的一个 二方库。

| 模块                    | 项目名          |
| ----------------------- | --------------- |
| 通用，工具类,异常，校验 | internal-common |
|                         |                 |

### 时序图

#### 登录注册

![乘客登录注册时序图](README/乘客登录注册时序图.png)

#### 验证码

![发送验证码接口时序图](README/发送验证码接口时序图.png)

#### 司机端

![司机端时序图](README/司机端时序图.png)

#### 订单

![乘客订单相关时序图](README/乘客订单相关时序图.png)

#### 信息修改

![乘客修改个人资料时序图](README/乘客修改个人资料时序图.png)

#### 信息维护

![乘客维护个人地址信息维护](README/乘客维护个人地址信息维护.png)

### 项目演示

#### 派单 / 接单

<img src="README/image-20200813210408997.png" alt="image-20200813210408997" style="zoom: 50%;" />

#### 到达约定地点

<img src="README/image-20200813210543356.png" alt="image-20200813210543356" style="zoom:50%;" />

#### 接到乘客

<img src="README/image-20200813210824474.png" alt="image-20200813210824474" style="zoom:50%;" />

#### 开始行程

<img src="README/image-20200813210912209.png" alt="image-20200813210912209" style="zoom:50%;" />

#### 到达目的地

<img src="README/image-20200813211005619.png" alt="image-20200813211005619" style="zoom:50%;" />

#### 发起收款

![image-20200813211327043](README/image-20200813211327043.png)

#### 收到

<img src="README/image-20200813211449976.png" alt="image-20200813211449976" style="zoom:50%;" />