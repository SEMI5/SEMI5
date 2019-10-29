<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%		
				// request.setAttribute("msg", "로그인실패");
				// 오브젝트형이 default라 원래의 자료형으로 다운캐스팅해줘야함
	String msg = (String)request.getAttribute("msg");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#sorry{
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
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->
		
		<img id = "sorry" src ="<%=request.getContextPath() %>/images/sorry.png">
		<h1 align = "center"><%= msg %></h1>
		<a href = "<%=request.getContextPath() %>/index.jsp" align = "center"><h1>메인으로 돌아가기</h1></a>

	</div><!-- container -->
</div><!-- mainContent -->
<%@ include file = "/views/common/footer.jsp" %>

</body>
</html>