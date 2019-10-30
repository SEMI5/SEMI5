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
	width : 100%;
}
</style>
</head>
<header>
	<%@ include file = "header.jsp" %>
</header>
<body>
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->
	   
		<img id = "hello" src ="<%=request.getContextPath() %>/images/welcome.jpg">
		<h1 align = "center"><%=msg %></h1>
		<a href = "<%=request.getContextPath() %>/index.jsp" align = "center"><h1>메인으로 돌아가기</h1></a>
	
	</div><!-- container -->
</div><!-- mainContent -->
<%@ include file = "/views/common/footer.jsp" %>
</body>
</html>