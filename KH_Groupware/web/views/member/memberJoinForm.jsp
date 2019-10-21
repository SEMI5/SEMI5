<%@page import="java.util.ArrayList"%>
<%@page import ="member.model.vo.khClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	ArrayList<khClass> cList = (ArrayList)request.getAttribute("class");

%>
    <!-- https://coding-factory.tistory.com/196 
    https://m.blog.naver.com/PostView.nhn?blogId=vnemftnsska2&logNo=221407559074&proxyReferer=https%3A%2F%2Fwww.google.com%2F
    
   .keyup() 
    
    
    아이디			.keyup() 유효성검사 + 중복검사
    4~12->a-z,A-Z,0-9
    
    비밀번호		.keyup() 유효성검사 
    
    비밀번호 일치		.keyup() 일치여부
    
    이름			.blur() + 유효성검사
    
    주민등록번호		.blur() + 유효성검사
    
    연락처			.blur() + 유효성검사

    이메일			select,option + 직접입력/api사용하기
    
    주소			우체국api + 상세주소
    
	반   => 처리했음 
    
    
    
    
    -->
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
					<td><input id = "userId" type = "text" maxlength ="13" name = "userId" required></td>  <!--required 미입력시 값을 입력하세요 문구뜸  -->
					<td><div id = "checkId" class = "checkInfo"></div></td>
					<!-- <td width ="200px"><div id="idCheck" class = "btns"">중복확인</div></td> -->
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
	
	
		$("#userId").keyup(function(){
			
			var userId = $("#userId").val();
			var idRe = /^[a-z,A-z,0-9]{4,12}$/;
			
			$.ajax({
				url : "/KH_Groupware/checkId.me",
				data : {userId : userId},
				success : function(data){
					if(userId == null){
						$("#checkId").text("아이디를 입력하세요.");
					}
					if(!idRe.test(userId)){
						$("#checkId").css("color","red");
						$("#userId").css("border","3px solid red");
						$("#checkId").text("4-12의 영문자,숫자만 입력가능합니다.");
					}else if(data > 0){
						$("#checkId").text("중복된 아이디입니다.");
					}else{
						$("#checkId").text("사용가능한 아이디입니다.");
						$("#checkId").css("color","blue");
						$("#userId").css("border","3px solid blue");
						}
					}	
				});		
		});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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