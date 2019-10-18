<%@page import="java.util.ArrayList"%>
<%@page import ="member.model.vo.khClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	ArrayList<khClass> cList = (ArrayList)request.getAttribute("class");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>
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
	
	#idCheck, #joinBtn{
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
	
	#joinBtn, #goMain{
		display : inline-block;
	}
	
	.btns{
		font-size: 20px;
		padding: auto;
	}
	
	#idCheckPop{
		width:	500px;
		height: 200px; 
		display: none;
		background: white;
		padding: 20px;
	}
	
	

</style>
</head>
<header>
	
</header>
<body>
<%-- <%@ include file = "/views/common/header.jsp" %>--%>
<!-- menubar.jsp를 찾아서 그 페이지를 내 페이지에 include(포함)시켜라 // 페이지에서 사용한 스크립트,css 모두다 가져옴-->

<div class = "outer">
<%=cList %>
		<br>
		<h1 align="left" style="font-size : 50px;"><em>회원가입</em></h1>
		
		<form id = "joinForm" action = "<%=request.getContextPath() %>/insert.me" method ="post" >
			<table align = "center">
				<tr>
					<td width ="200px"> * 아이디 </td>
					<td><input type = "text" maxlength ="13" name = "userId" required></td>  <!--required 미입력시 값을 입력하세요 문구뜸  -->
					<td width ="200px"><div id="idCheck" class = "btns"">중복확인</div></td>
				</tr>
				<tr>
					<td> * 비밀번호 </td>
					<td><input type ="password" maxlength="13" name ="userPwd" required></td>
				</tr>
				<tr>
					<td>* 비밀번호 확인</td>
					<td><input type="password" maxlength="13" name="userPwd2" required></td>
					<td><label id ="pwdResult"></label></td>
				</tr>
				<tr>
					<td> * 이름 </td>
					<td><input type = "text" maxlength="5" name="userName" required></td>
				</tr>
				<tr>
				<td> * 주민등록번호 </td>
					<td><input type = "text" maxlength="5" name="userRRN" required></td>
				</tr>
				<tr>
					<td> * 연락처 </td>
					<td>
						<input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678">
					</td>
				</tr>
				<tr>
					<td> * 이메일 </td>
					<td><input type = "email" name = "email"></td>
					<td></td>
				</tr>
				<tr>
					<td> * 주소 </td>
					<td><input type="text" name = "address"></td>
					<td></td>
				</tr>
				<tr>
					<td> * 반 </td>
					<td><select name = "class">
					<%for(int i = 0 ; i < cList.size(); i++ ){ %>
						<option value = "<%=cList.get(i).getcId()%>"><%=cList.get(i).getcName() %></option>
					<% }%> 
					</select></td>
					<td></td>
				</tr>
	
			</table>
			
			<div  align = "right">
				
				<!-- submit 방법 1 (함수활용해서 submit하기 )(required동작 안함) -->
				<div class = "btns" id = "joinBtn" onclick = "insertMember();">가입하기</div> <!--함수방식은 required 적용이안됨-->
				
				<!-- submit 방법 2 -->
				<!-- <input id = "joinBtn" type="submit" value ="가입하기">	 -->			<!-- submit버튼으로 만들어서 실행해야 input태그들의 required이 발동함 -->
				
				<!-- InsertMemberServlet 만들러 감 -->
				<div class = "btns" id = "goMain" onclick = "goMain();">메인으로</div>
				
			</div>
		</form>
	</div>
	
	
	
	<!-- 중복체크 팝업창 -->
	<div id = "idCheckPop">
			<h1>test</h1>
	</div>
	
	
	
	
	
	<script>
		// 메인으로 이동 함수
		function goMain(){
			location.href ="<%=request.getContextPath()%>/index.jsp";
		}
		
		
		// 회원가입 하기 함수
		function insertMember(){
			// submit은 div가 아니라 form에서 해줘야함
			$("#joinForm").submit();
		}
	
		
		$(".btns").hover(function() {
			  $(this).css({"cursor": "pointer"});
			}, function(){
			 //$(this).css({"background":"black"})
			});

		
		$(function() {
			var BPOPUP = '';
			$('#idCheck').on('click', function(e) {
				e.preventDefault();
				BPOPUP = $('#idCheckPop').bPopup({

				});
			});
		});
	</script>
	
		
</body>
</html>