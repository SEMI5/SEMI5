<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import=" member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	//out.print(loginUser.getUserId());
%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<meta charset="UTF-8">
    <title>Testing websockets</title>
</head>
<style>
	#inputMessage{
		padding: 9px;
	    margin: 4px;
	    width: 285px;
	}
	#enter{
		margin:-3px;
		padding: 10px;
		border: 1px solid blue; 
		background: white;
	}
</style>
<script type="text/javascript">
$(function(){
 	$("#inputMessage").keypress(function(e) {
		if(e.keyCode == 13){
			send();
			return false;
		}
	}); 
});
</script>
<body>
	<div id="div0" align="center" style="padding: 15px;">
		KH Chatting Room
	</div>
        	<textarea id="messageWindow" rows="10" cols="40" readonly="true" style="height: 481px; width: -webkit-fill-available; resize: none"></textarea>
		    <input id="inputMessage" type="text"/>
    		<button id="enter" type="submit" value="" onclick="send();">send</button>
</body>	
    <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8888/KH_Groupware/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        textarea.value += "상대 : " + event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "connected..\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
	        textarea.value += "나 : " + inputMessage.value + "\n";
	        webSocket.send(inputMessage.value);
	        inputMessage.value = "";
    }
  </script>
</html>