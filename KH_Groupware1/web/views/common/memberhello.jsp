<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#hello{
	margin-top : 50px;
	margin-left: 370px;
	width : 50%;
}
</style>
</head>
<header>
	<%@ include file = "header.jsp" %>
</header>
<body>

	<img id = "hello" src ="<%=request.getContextPath() %>/images/hello.png">
	<h1 align = "center"><%=msg %></h1>
	<a href = "<%=request.getContextPath() %>/index.jsp" align = "center"><h1>메인으로 돌아가기</h1></a>
	
	
</body>
</html>