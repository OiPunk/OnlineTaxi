演示demo
打开两个页面：
http://localhost:8083/message/socket/2
http://localhost:8083/message/socket/1
向前端推送数据：
http://localhost:8083/message/socket/push/1?message=1msg
http://localhost:8083/message/socket/push/2?message=2msg
http://localhost:8083/message/socket/pushAll?message=allmsg

新地址：
用edage访问
乘客端：http://localhost:8083/index.html#/user
司机端：http://localhost:8083/index.html#/driver