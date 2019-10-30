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
	::-webkit-scrollbar {
		display:none;
	}
	


	#inputMessage{
		padding: 9px;
	    margin: 4px;
	    width: 300px;
	    background: beige;
	}
	#enter{
		margin:-3px;
		padding: 10px;
	
		background: gainsboro; border: 0px solid black; color: black;
	}
	#enter:hover {
		background: black;
		color: white;
		opacity: 0.7;
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
	<div id="div0" align="center" style="color: white; background:#262A2D; padding: 15px; font-size: 29px; font-weight: 900;">
		KH Chatting Room
	</div>
        	<textarea id="messageWindow" rows="10" cols="40" readonly="true" style="height: 463px; width: -webkit-fill-available; resize: none"></textarea>
		    <input id="inputMessage" type="text">
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
        textarea.value += event.data + "\n";
    }
    function onOpen(event) {
        textarea.value += "connected..\n";
    }
    function onError(event) {
      alert(event.data);
    }
    var ID = "<%=loginUser.getUserId()%>";
    function send() {
	        textarea.value += ID + " : " + inputMessage.value + "\n";
	        webSocket.send(ID + ":" + inputMessage.value);
	        inputMessage.value = "";
    }
  </script>
</html>