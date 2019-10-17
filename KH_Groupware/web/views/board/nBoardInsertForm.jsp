<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.outer{
      width:900px;
      height:500px;
      background:black;
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   table{
      border:1px solid white;
   }
   .tableArea{
      width:650px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   
</style>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<header>
<%@ include file = "../common/header.jsp" %>
</header>
<body>
	
	<div class="outer">
		<div class="titleDiv1"><div class= "titleDiv2"><b>공&nbsp;지&nbsp;사&nbsp;항</b></div></div>
	
		<div class="tableArea">
			<form action="<%=request.getContextPath() %>/insert.bo" method="post">
				<table>
					<tr>
						<td>분야</td>
						<td>
							<select name="category">
								<option>-------</option>
								<option value="10">공통</option>
								<option value="20">운동</option>
								<option value="30">등산</option>
								<option value="50">낚시</option>
								<option value="40">게임</option>
								<option value="60">요리</option>
								<option value="70">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colsapn="3"><input type="text" size="58" name="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea rows="15" cols="60" name="content" style="resize:none"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 게시판 작성하기 기능 구현하러 가기 -->
	<!--  InsertBoardServlet 만들러 ㄱㄱ씽 -->
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>