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
<%@ include file = "../common/header.jsp" %>
<title>Insert title here</title>
<style>
body {
  width : 90%;
  margin: 0;
  font-size: 28px;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  position: fixed;
  top: 0;
  z-index: 1;
  width: 100%;
  background-color: #f1f1f1;
}

.header h2 {
  text-align: center;
}

.progress-container {
  width: 100%;
  height: 8px;
  background: #ccc;
}

.progress-bar {
  height: 8px;
  background: #4caf50;
  width: 0%;
}

.content {
  padding: 100px 0;
  margin: 50px auto 0 auto;
  width: 80%;
}


table{
	border : 1px solid black;
	width : 800px;
	height : 300px;
	
}
tr{
	height : 50px;
}
	
td input ,td select{
	margin-left : 30px;
}

.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 15%;
}

.tablink:hover {
  background-color: #777;
}

#member_tab{
	border : 1px solid black;
	width : 800px;
	height : 300px;
	margin-left : 283px;
	margin-top : 50px;
}

.btn {
  border: none;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}

.idCheck {background-color: #f44336;} /* Red */ 
.idCheck:hover {background: #da190b;}

.joinBtn {background-color: #f44336;} /* Gray */ 
.joinBtn:hover {background: #da190b;}

.mainBtn {background-color: #f44336;} /* Gray */ 
.mainBtn:hover {background: #da190b;}


</style>
	

</head>
	
<body>
	<div>
		<img src="<%=request.getContextPath() %>/images/hello.jpg" style="width:1550px; height:300px;">
	</div>
<div class = "outer">
<%-- <%=cList %> --%>
		<br>
		<div class="header">
		<h1 align="left" style="font-size : 50px;"><em>회원가입</em></h1>
		 	 <div class="progress-container">
		    	<div class="progress-bar" id="myBar"></div>
		  	</div>  
		</div>
		<form id = "joinForm" action = "<%=request.getContextPath() %>/insert.me" method ="post" >

	<div id = "member_tab">
	<button class="tablink" onclick="openCity('London', this, 'red')" id="defaultOpen"> 주요기능1 </button>
	<button class="tablink" onclick="openCity('Paris', this, 'green')" id="defaultClose" > 주요기능2 </button>
		<br><br><br><br>
		<div id="London" class="tabcontent">
			<div id = >
					텍스트 1
			</div>
		
		</div>
	
		<div id="Paris" class="tabcontent">
			<div>
					텍스트 222222
			</div>
		</div>
	</div>
		<table align = "center">
				<tr>
					<td> * 는 필수 입력 정보입니다.</td>
				</tr>
				<tr>
					<td><input type = "text" maxlength ="13" name = "userId" required placeholder="아이디" style="width:600px; height : 50px;"></td>  
					<td width ="150px"><button class="btn idCheck" class = "btns">중복확인</button></td>
				</tr>
				<tr>
					<td><input type ="password" maxlength="13" name ="userPwd" required placeholder="비밀번호" style="width:600px; height : 50px;"></td>
				</tr>
                 <tr>   
					<td><input type="password" maxlength="13" name="userPwd2" required placeholder="비밀번호 확인" style="width:600px; height : 50px;"></td>
					<td><label id ="pwdResult"></label></td>
				</tr>
				<tr>
					<td><input type = "text" maxlength="5" name="userName" required placeholder="이름" style="width:600px; height : 50px;"></td>
				</tr>
				<tr>
					<td><input type = "text" maxlength="5" name="userRRN" required placeholder="주민번호" style="width:600px; height : 50px;"></td>
				</tr>
				<tr>
					<td>
						<input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678" style="width:600px; height : 50px;">
					</td>
				</tr>
				<tr>
					<td><input type = "email" name = "email" placeholder="이메일" style="width:600px; height : 50px;"></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="text" name = "address" placeholder="주소" style="width:600px; height : 50px;"></td>
					<td></td>
				</tr>
				<tr>
					<td><select name = "class" style="width:600px; height : 30px;">
					<%for(int i = 0 ; i < cList.size(); i++ ){ %>
						<option value = "<%=cList.get(i).getcId()%>"><%=cList.get(i).getcName() %></option>
					<% }%> 
					</select></td>
					<td></td>
				</tr>
	
			</table>
		
			<br>
			<div  align = "center">
				
				<!-- submit 방법 1 (함수활용해서 submit하기 )(required동작 안함) -->
				<button class = "btn joinBtn" id = "joinBtn" onclick = "insertMember();">가입하기</button> <!--함수방식은 required 적용이안됨-->
				
				<!-- submit 방법 2 -->
				<!-- <input id = "joinBtn" type="submit" value ="가입하기">	 -->			<!-- submit버튼으로 만들어서 실행해야 input태그들의 required이 발동함 -->
				
				<!-- InsertMemberServlet 만들러 감 -->
				<button class = "btn mainBtn" id = "goMain" onclick = "goMain();">메인으로</button>
				
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

		
/* 		$(function() {
			var BPOPUP = ''; */
		
			$('#idCheck').on('click', function(e) {
				
				e.preventDefault();
				BPOPUP = $('#idCheckPop').bPopup({
	
				});
			});
	/* 	}); */
		

		// When the user scrolls the page, execute myFunction 
		window.onscroll = function() {myFunction()};

		function myFunction() {
		  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
		  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
		  var scrolled = (winScroll / height) * 100;
		  document.getElementById("myBar").style.width = scrolled + "%";
		}
		
		
		
		function openCity(cityName,elmnt,color) {
			  var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablink");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].style.backgroundColor = "";
			  }
			  document.getElementById(cityName).style.display = "block";
			  elmnt.style.backgroundColor = color;
			
			}
			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
			
		</script>
			
			
	
	
		
</body>
</html>