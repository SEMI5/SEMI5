<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%		
				// request.setAttribute("msg", "로그인실패");
				// 오브젝트형이 default라 원래의 자료형으로 다운캐스팅해줘야함
	String msg = (String)request.getAttribute("msg");
%>    
 <!-- 2.로그인시 실패 에러페이지  -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align = "center"><%= msg %></h1>
	<a href = "<%=request.getContextPath() %>/index.jsp" align = "center"><h1>메인으로 돌아가기!</h1></a>
	
</body>
</html>