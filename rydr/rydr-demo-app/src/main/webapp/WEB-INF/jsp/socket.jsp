<%@ page language="java" pageEncoding="utf-8"
contentType="text/html;charset=utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<!-- base must be placed inside the head tag -->
<script>
    var socket;
    if(typeof(WebSocket) == "undefined") {
        console.log("Your browser does not support WebSocket");
    }else{
        console.log("Your browser supports WebSocket");
        	//Initialize WebSocket object, specify server address and port to connect, establish connection
            //Equivalent to
            socket = new WebSocket("ws://localhost:8083/websocket/${cid}");
        	//The following is the correct approach
            //socket = new WebSocket("${basePath}websocket/${cid}".replace("http","ws"));
            //Open event
            socket.onopen = function() {
                console.log("Socket is open");
                //socket.send("This is a message from the client" + location.href + new Date());
            };
            //Message received event
            socket.onmessage = function(msg) {
                console.log(msg.data);
                document.getElementById('msg').innerText = msg.data;
                //Message received, start processing front-end trigger logic
            };
            //Close event
            socket.onclose = function() {
                console.log("Socket is closed");
            };
            //Error event
            socket.onerror = function() {
                alert("Socket encountered an error");
                //You can try refreshing the page at this point
            }
            socket.send("dd");
            //Close socket when leaving the page
            //Deprecated in jQuery 1.8, removed in 3.0
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
Message content: <span id="msg">None</span>
<input type="button" onclick="sendMsg()" value="d">
</body>
</html>
