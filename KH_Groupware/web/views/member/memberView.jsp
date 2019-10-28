<%@page import="member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="member.model.vo.khClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Member user = (Member)session.getAttribute("loginUser");
	String cls = (String)session.getAttribute("className");

	
	String userId = user.getUserId();
	String cName = cls;
	String userName = user.getUserName();
	String userBorn = user.getRRN().substring(0, 7);
	String userGender = user.getRRN().substring(6);
		if(userGender.equals("1")){
			userGender = "남";
		}else{
			userGender = "여";
		}
	String[] email = user.geteMail().split("@");
	String[] phone = user.getPhone().split("-");
	String[] address = user.getAddress().split("@");
	
	
	
	

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
	
	#updateForm{
		margin: auto;
		margin-top: 40px;
		margin-top: 10px;
		border: 1px solid lightgrey;
		width: 35%;
		padding: 50px;
		padding-top: 0px;
	}
	
	input{
		font-size: 13px;
		margin-top : 10px;
		width: 250px;
		height: 25px;
		margin-left: 30px;
	}
	
	#deleteBtn, #updateBtn, #joinBtn, #searchAdd{
		margin-top: 2px;
		background : black;
		color : white;
		border-radius : 5px;
		width : 150px;
		height : 40px;
		text-align : center;
	}
	
	#deleteBtn:hover, #updateBtn:hover, #searchAdd:hover {
		background: lightgrey;
		cursor: pointer;
	}
	
	#joinBtn:hover, #searchAdd {
		background: lightgrey;
		cursor: pointer;
	}
	
	#goMain:hover{
		background: whitesmoke;
		cursor: pointer;
	}
	
	#searchAdd{
		margin-top: 8px;
		background : black;
		color : white;
		border-radius : 5px;
		width : 150px;
		height : 30px;
		text-align : center;
		
	}
	
	td{
		margin-top: 20px;
		font-size: 15px;
		text-align : right;
		height: 40px;
	}
	
	select{
		font-size: 13px;
		height: 30px;
		width: 400px;
		margin-left: 100px;
		margin-top: 10px;
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
	
	#updateBtn, #goMain, #deleteBtn{
		display : inline-block;
	}
	
	.btns{
		margin: 10px;
		margin-top:80px;
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

	th{
		max-width: 200px;
		height: 20px;
		text-align: right;
		padding-left: 10px;
		font-size: 10px;
	}
	
	#banner{
	width: 100%;
	height: 350px;
	margin-top: 40px;
	margin-bottom: 50px;
}

#banner img{
	width: 100%;
	height: 250px;
	
}

#mainTitle{
	margin: auto;
	font-size: 45px;
	width: 50%;
	margin-left: 25%;
	margin-right: 25%;
	border-bottom: 1px solid grey;
	height: 50px;
	text-align: center;
	margin-top: 50px;
	padding-bottom: 30px;
	}



</style>
</head>
<header>
	<%@ include file = "/views/common/header.jsp" %>
</header>
<body>
<%-- <%@ include file = "/views/common/header.jsp" %>--%>
<!-- menubar.jsp를 찾아서 그 페이지를 내 페이지에 include(포함)시켜라 // 페이지에서 사용한 스크립트,css 모두다 가져옴-->
<div id = "banner">	
		<img src="https://images2.imgbox.com/16/2a/21JdCHzj_o.jpg" alt="image host"/>
		<div  id = "mainTitle"><b style="margin-bottom: 3000px;">내 정보 수정</b></div>
	</div>

<div class = "outer">
		<br>
		<form id = "updateForm" action = "<%=request.getContextPath() %>/update.me" method ="post" >
				<p style = "font-size: 20px; margin: 1px; margin-top: 30px; margin-bottom: 10px;" ><em><%=cName %>반</em></p>
				<p style = "font-size: 25px;  margin: 1px; margin-bottom: 20px;"><em><%= userName %> (<%=userBorn %>, <%=userGender %>)</em></p> 
			<table align = "center">
				<tr>
					<td width ="200px">아이디</td>
					<td><input id = "userId" type = "text" placeholder = "<%=userId%>" maxlength ="13" name = "userId"  readonly="readonly"></td>  <!--required 미입력시 값을 입력하세요 문구뜸  -->
					<th class = "info"><div id = "checkId" class = "checkInfo"></div></th>
					<!-- <td width ="200px"><div id="idCheck" class = "btns"">중복확인</div></td> -->
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input id = "userPwd" type ="password" maxlength="20" name ="userPwd" required></td>
					<th class = "info"><div id = "checkPwd" class = "checkInfo"></div></th>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input id = "userPwd2" type="password" maxlength="20" name="userPwd2" required></td>
					<th class = "info"><div id = "checkPwd2" class = "checkInfo"></div></th>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<select id = "tel0" class = "phone" name = "phone1" value = "<%=phone[0]%>"style="width: 60px; margin-left: 10px; height: 30px;">
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "019">019</option>
						</select>
						<input id = "tel1" class = "phone" type="tel" value = "<%=phone[1]%>"maxlength="4" name="phone2" style="width: 82px;  margin-left: 5px;">
						<input id = "tel2" class = "phone" type="tel" value = "<%=phone[2]%>"maxlength="4" name="phone3" style="width: 82px;  margin-left: 5px;">
					</td>
					<th class = "info"><div id = "checkPhone" class = "checkInfo"></div></th>
				</tr>
				<tr>
					<td>이메일</td>
					<td id = "emailPt"><input type = "text" name = "emailId" value = "<%=email[0]%>"style="width: 100px; margin-right: 5px;" required="required"><em>@</em>
					<input type="text" name="email2" value = "<%=email[1]%>" style="width: 120px; margin-left: 0px;" ReadOnly="true" placeholder = "naver.com">
					</td>
					<th>
					<select id = "selctEmail" name = "selctEmail" class = "info" style="width: 150px; margin-left: 0px; height: 30px;" onchange="SetEmailTail(selctEmail.options[this.selectedIndex].value)" >
						<!-- <option value = "notSelected">====선택====</option> -->
						<option value = "naver.com">naver.com</option> 
						<option value = "goole.com">google.com</option>
						<option value = "hanmail.net">hanmail.net</option>
						<option value = "yahoo.com">yahoo.com</option>
						<option value = "korea.com">nate.com</option>
						<option value = "hotmail.com">hotmail.com</option>
						<option value = "daum.net">daum.net</option>
						<option value = "etc">직접입력</option>
					</select>
					</th>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="address" name = "address" value = "<%=address[0]%>"placeholder="주소" ReadOnly = "true" required="required"></td>
					<th><input type="button" id = "searchAdd" class = "info" onclick="execDaumPostcode()" value="우편번호 찾기" style = "margin-left: 0px; border: none;"></th>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" id="detailAddress" value = "<%=address[1]%>"name = "detailAdd" placeholder="상세주소"></td>
				</tr>

			</table>
			
			<div align = "center">
				<div id = "updateBtn" class = "btns"onclick ="updateMember();">수정하기</div>
				<div id = "deleteBtn" class = "btns"onclick = "deleteMember();">탈퇴하기</div>
				<div id = "goMain" class = "btns"onclick ="goMain();">메인으로</div>
	
			</div>
		</form>
	</div>
	
	
	
	<!-- 중복체크 팝업창 -->
	<div id = "idCheckPop">
			<h1>test</h1>
	</div>
	
	
	
	
	
	<script>
	
	function SetEmailTail(emailValue) {
		  var email = document.all("email")    // 사용자 입력
		  var emailTail = document.all("email2") // Select box
		  
		  if ( emailValue == "notSelected" )
		   return;
		  else if ( emailValue == "etc" ) {
		   emailTail.placeholder = "";
		   emailTail.readOnly = false;
		   emailTail.value = "";
		   emailTail.focus();
		  } else {
		   emailTail.readOnly = true;
		   emailTail.value = emailValue;
		  }
		 }

		
		pwdCheck = false;
		pwdCheck2 = false;
		phoneCheck = false;

		

		$("#userPwd").keyup(function() {
			var userPwd = $("#userPwd").val();
			var pwdRe = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

			if (userPwd == "") {
				$("#checkPwd").css("color", "red");
				$("#userPwd").css("border", "3px solid red");
				$("#checkPwd").text("비밀번호를 입력하세요.");
				pwdCheck = false;
			} else if (!pwdRe.test(userPwd)) {
				$("#checkPwd").css("color", "red");
				$("#userPwd").css("border", "3px solid red");
				$("#checkPwd").text("문자,숫자,특수문자를 포함한 8-20자");
				pwdCheck = false;
			} else {
				$("#checkPwd").css("color", "blue");
				$("#userPwd").css("border", "3px solid blue");
				$("#checkPwd").text("사용가능한 비밀번호입니다.");
				pwdCheck = true;
			}
		});

		$("#userPwd2").keyup(function() {
			var userPwd2 = $("#userPwd2").val();

			if ($("#userPwd1") == "") {
				$("#checkPwd2").css("color", "red");
				$("#userPwd2").css("border", "3px solid red");
				$("#checkPwd2").text("비밀번호를 먼저 입력하세요.");
				$("#userPwd2").val("");
				pwdCheck2 = false;
				$("#userPwd").focus();
			} else if (pwdCheck == false) {
				$("#checkPwd2").css("color", "red");
				$("#userPwd2").css("border", "3px solid red");
				$("#userPwd2").val("");
				$("#checkPwd2").text("비밀번호 조건을 먼저 만족시켜야합니다.");
				pwdCheck2 = false;
				$("#userPwd").focus();
			} else if ($("#userPwd").val() != userPwd2) {
				$("#checkPwd2").css("color", "red");
				$("#userPwd2").css("border", "3px solid red");
				$("#checkPwd2").text("비밀번호가 일치하지 않습니다.");
				pwdCheck2 = false;
			} else {
				$("#checkPwd2").css("color", "blue");
				$("#userPwd2").css("border", "3px solid blue");
				$("#checkPwd2").text("비밀번호가 일치합니다.");
				pwdCheck2 = true;
			}

		});

		

		$(".phone").keyup(function() {
			var phoneRe1 = /^[0-9]{3,4}$/;
			var phoneRe2 = /^[0-9]{4}$/;
			var tel1 = $("#tel1").val();
			var tel2 = $("#tel2").val();
			
			if (tel1 == ""  && tel2 == "" ) {
				$("#checkPhone").css("color", "red");
				$("#tel1").css("border", "3px solid red");
				$("#tel2").css("border", "3px solid red");
				$("#checkPhone").text("번호을 입력하세요.");
				phoneCheck = false;
			} else if (!phoneRe1.test(tel1) || !phoneRe2.test(tel2) ) {
				$("#checkPhone").css("color", "red");
				$("#tel1").css("border", "3px solid red");
				$("#tel2").css("border", "3px solid red");
				$("#checkPhone").text("3~4자의 숫자");
				phoneCheck = false;
			} else {
				$("#checkPhone").css("color", "blue");
				$("#tel0").css("border", "3px solid blue");
				$("#tel1").css("border", "3px solid blue");
				$("#tel2").css("border", "3px solid blue");
				$("#checkPhone").text("유효한 전화번호입니다.");
				phoneCheck = true;
			}
		});
		
		
		
		
		// 정보수정
		function updateMember(){
			if(pwdCheck  == false){
				alert("비밀번호를 확인해주세요.");
				$("#userPwd").focus();
			}else if(pwdCheck2  == false){
				alert("비밀번호 일치여부를 확인해주세요.");
				$("#userPwd2").focus();
			}else if(phoneCheck  == false){
				alert("전화번호를 확인해주세요.");
				$("#tel1").focus();
			}else if($("#emailId").val() == ""){
				alert("이메일을 입력해주세요.");
				$("#emailId").focus();
			}else if($("#address").val() == ""){
				alert("주소를 입력해주세요.");
				$("#emailId").focus();
			}else{
				if(!confirm("정말로 정보를 수정하시겠습니까 ?")){
					return false;
				};
				$("#updateForm").submit();
			}	
		}
	
	</script>
	
	
	<script type="text/javascript">
	
	// 메인으로 이동 함수
	function goMain() {
		location.href = "<%=request.getContextPath()%>/index.jsp";
	}
	
	$(".btns").hover(function() {
		  $(this).css({"cursor": "pointer"});
		}, function(){
		 //$(this).css({"background":"black"})
		});
	
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
	
	
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address").value = '';
                
                } else {
                    document.getElementById("address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               
                document.getElementById("address").value = addr+"  ("+data.zonecode+")";
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	
</script>
	
		
</body>
</html>