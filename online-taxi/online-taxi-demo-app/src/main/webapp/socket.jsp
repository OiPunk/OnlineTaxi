<%@ page language="java" pageEncoding="utf-8"
contentType="text/html;charset=utf-8" isELIgnored="false"%> 
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<html> 
<head> 
<!-- base需要放到head中 -->
<script> 
    var socket;  
    if(typeof(WebSocket) == "undefined") {  
        console.log("您的浏览器不支持WebSocket");  
    }else{  
        console.log("您的浏览器支持WebSocket");  
        	//实现化WebSocket对象，指定要连接的服务器地址与端口  建立连接  
            //等同于
            socket = new WebSocket("ws://localhost:8083/websocket/${cid}");
        	//以下是正确写法
            //socket = new WebSocket("${basePath}websocket/${cid}".replace("http","ws"));  
            //打开事件  
            socket.onopen = function() {  
                console.log("Socket 已打开");  
                //socket.send("这是来自客户端的消息" + location.href + new Date());  
            };  
            //获得消息事件  
            socket.onmessage = function(msg) {  
                console.log(msg.data);  
                document.getElementById('msg').innerText = msg.data;
                //发现消息进入    开始处理前端触发逻辑
            };  
            //关闭事件  
            socket.onclose = function() {  
                console.log("Socket已关闭");  
            };  
            //发生了错误事件  
            socket.onerror = function() {  
                alert("Socket发生了错误");  
                //此时可以尝试刷新页面
            }  
            socket.send("dd");
            //离开页面时，关闭socket
            //jquery1.8中已经被废弃，3.0中已经移除
            // $(window).unload(function(){  
            //     socket.close();  
            //});  
    }
    function sendMsg(){
    	socket.send('{"to":30,"data":{}}');
    }
    </script> 
     
</head>
<body>
消息内容：<span id="msg">无</span>
<input type="button" onclick="sendMsg()" value="d">
</body>
</html> 