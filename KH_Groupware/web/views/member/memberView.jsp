<%@page import="member.model.vo.khClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="member.model.vo.Member"%>
    
 <%
 	Member member = (Member)request.getAttribute("member");	
 	khClass clss = (khClass)request.getAttribute("khClass");
 
 	String userId = member.getUSER_ID();
	String userPwd = member.getUSER_PWD();
	String userName = member.getUSER_NAME();
	String phone = 	member.getPHONE();
	String email = member.getEMAIL();
	String address = member.getADDRESS();
	
	String className = clss.getC_NAME();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		/* border: 2px solid black; */ 
		width : 90%;
		height : 500px;
		background : white;
		color : black;
		margin-left : 5%;
		margin-right : 5%;
		margin-top : 3%;
	}
	.outer label, .outer td{
		color : black;
	}
	
	#joinForm{
		margin-top: 40px;
	
	}
	
	
	input{
		font-size: 20px;
		margin-top : 2px;
		width: 600px;
		height: 40px;
		margin-left: 200px;
		margin-right: 25px;
	}
	
	#updateBtn, #deleteBtn, #joinBtn{
		margin-top: 2px;
		background : black;
		color : white;
		border-radius : 5px;
		width : 150px;
		height : 40px;
		text-align : center;
	}
	
	td{
		font-size: 22px;
		text-align : right;
		height: 70px;
	}
	
	select{
		font-size: 20px;
		height: 40px;
		width: 600px;
		margin-left: 200px;
		margin-right: 25px;
	}

	#joinForm tr{
		margin-bottom: 40px;
	
	}
	

	#goMain{
		background : white;
		color : black;
		border-radius : 5px;
		width : 150px;
		height : 40px;
		text-align : center;
		border: 1px solid black;
	}
	
	#updateBtn, #deleteBtn, #goMain{
		display : inline-block;
	}
	
	.btns{
		font-size: 20px;
		padding: auto;
	}


</style>
</head>
<body>
<%@ include file = "/views/common/header.jsp" %>	
	<div class = "outer">
	<!-- memberJoinForm.jsp에 있는 table을 복사해서 쓰자 -->
																	<!-- update.me 라는 클래스파일 실행-->
	<form id ="updateForm" action = "<%=request.getContextPath() %>/update.me" method ="post"> 
	<br>
		<h1 align="left" style="font-size : 50px;"><em>회원 정보 수정</em></h1>
		<h2 align="left" >      <%=className %>반  <%=userName %></h2>
		<table align = "center">
				<tr>
					<td width ="200px"> * 아이디 </td>
					<td><input type = "text" maxlength ="13" name = "userId" value="<%=userId %>" readonly 
							style = "background: whitesmoke"></td>  <!--required 미입력시 값을 입력하세요 문구뜸  -->
					<td style = "width:200px"></td>
					<!-- <td width ="200px"><div id="idCheck">중복확인</div></td> -->
				</tr>
				<tr>
					<td> 비밀번호 </td>
					<td><input type ="password" maxlength="13" name ="userPwd" ></td>
				</tr>
				<tr>
					<td> 비밀번호 확인 </td>
					<td><input type ="password" maxlength="13" name ="userPwd2" ></td>
				</tr>
				<tr>
					<td> * 이름 </td>
					<td><input type = "text" maxlength="5" name="userName" value="<%=userName %>"
							style = "background: whitesmoke" readonly></td>
				</tr>
				<tr>
					<td> 연락처 </td>
					<td>
						<input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678" value="<%=phone %>">
					</td>
				</tr>
				<tr>
					<td> 이메일 </td>
					<td><input type = "email" name = "email" value="<%=email %>"></td>
				</tr>
				<tr>
					<td> 주소 </td>
					<td><input type="text" name = "address" value="<%=address %>"></td>
				</tr>
			</table>
			
			<br>
			<div class = "btns" align ="right">
				<div id = "goMain" onclick ="goMain();">메인으로</div>
				<div id = "updateBtn" onclick ="updateMember();">수정하기</div>
				<div id = "deleteBtn" onclick = "deleteMember();">탈퇴하기</div>
			</div>

	</form>
	</div>
	
	<script>
		function goMain(){
			location.href="<%=request.getContextPath()%>/index.jsp";
		/* 	location.href="/jspProject/index.jsp"; */
		}
		
		// 회원정보 수정하기 
		function updateMember(){
			$("#updateForm").submit();	// form태그 id
			// UpdateMemberServlet 만들러 !!
		}
		
		// 회원 탈퇴하기 
		function deleteMember(){
			var bool = confirm("정말로 탈퇴하시겠습니까?");
			
			if(bool){
				//form태그의 경로를 바꿔줌 attr(속성값변경) 
				$("#updateForm").attr("action", "<%=request.getContextPath() %>/delete.me");
				$("#updateForm").submit();
				// DeleteMemberServlet 만들러 !!
			}	
			
			
			
		}
		
	</script>

</body>
</html>