<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
			
	<%-- <%@ include file = "views/common/mainHome.jsp" %>  --%>
	<!-- 위에 꺼롤 실행하면, 이미지 파일이 상대경로라 제대로 안나옴 (단순히 페이지를 포함한다는 의미이니까 -->
</body>

<script>
$(function(){
	document.location.replace('<%=request.getContextPath()%>/views/common/mainHome.jsp');
	/* 시작 주소 이쪽으로 보내버림*/
});

</script>

</html>