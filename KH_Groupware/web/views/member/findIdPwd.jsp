<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.emailjs.com/sdk/2.3.2/email.min.js"></script>

<title>Insert title here</title>

<style>
	#outer{
		border: 3px solid black;
		width: 100%;
	}
	
	#findId{
		border: 3px solid black;
		display: inline-block;
		width: 40%;
		margin: 4%;
		margin-left: 5%;
		margin: 5%;
		margin-top: 30px;
	}

	#findPwd{
		border: 3px solid black;
		display: inline-block;
		width: 40%;
		margin: 4%;
		margin-top: 30px;
	}

	.btn{
		width : 10%;
		margin-top: 50px;
		margin-left: 45%;
		margin-right: 45%;
	}
	

</style>
</head>
<body>
	<div id = "outer">
		<h1>아이디/비밀번호 찾기</h1>
		<div id = "findId">
			<h3>아이디 찾기</h3>
			<table id = "idTable" align = "center">
				<tr>
					<td id = "nameI">이름</td>
					<td><input type = "text"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td id = "emailPtI"><input type = "text" name = "emailId" style="width: 141px; margin-right: 5px;" required="required"><em>@</em>
					<input type="text" name="email2I" value="naver.com" style="width: 220px; margin-left: 0px;" ReadOnly="true" placeholder = "naver.com">
					</td>
					<th>
					<select id = "selctEmailI" name = "selctEmail" class = "info" style="width: 150px; margin-left: 0px; height: 40px;" onchange="SetEmailTailI(selctEmailI.options[this.selectedIndex].value)" >
						<!-- <option value = "notSelected">====선택====</option> -->
						<option value = "naver.com">naver.com</option> 
						<option value = "goole.com">google.com</option>
						<option value = "hanmail.net">hanmail.net</option>
						<option value = "yahoo.com">yahoo.com</option>
						<option value = "nate">nate.com</option>
						<option value = "hotmail.com">hotmail.com</option>
						<option value = "daum.net">daum.net</option>
						<option value = "etc">직접입력</option>
					</select>
					</th>
				</tr>
				<tr>
					<td></td>
					<td id = "infoI"></td>
				</tr>
			</table>
			<button id = "idBtn" class = "btn" onclick="sendEmail('id')">확인</button>
		</div>
		
		
		<div id = "findPwd">
			<h3>비밀번호 찾기</h3>
			<table id = "pwdTable" align = "center" >
				<tr>
					<td id = "idP">아이디</td>
					<td><input type = "text"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td id = "emailPtP"><input type = "text" name = "emailId" style="width: 141px; margin-right: 5px;" required="required"><em>@</em>
					<input type="text" name="email2P" value="naver.com" style="width: 220px; margin-left: 0px;" ReadOnly="true" placeholder = "naver.com">
					</td>
					<th>
					<select id = "selctEmailP" name = "selctEmail" class = "info" style="width: 150px; margin-left: 0px; height: 40px;" onchange="SetEmailTailP(selctEmailP.options[this.selectedIndex].value)" >
						<!-- <option value = "notSelected">====선택====</option> -->
						<option value = "naver.com">naver.com</option> 
						<option value = "goole.com">google.com</option>
						<option value = "hanmail.net">hanmail.net</option>
						<option value = "yahoo.com">yahoo.com</option>
						<option value = "nate">nate.com</option>
						<option value = "hotmail.com">hotmail.com</option>
						<option value = "daum.net">daum.net</option>
						<option value = "etc">직접입력</option>
					</select>
					</th>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<select id = "tel0" class = "phone" name = "phone1" style="width: 90px; margin-left: 10px; height: 48px;">
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "016">016</option>
							<option value = "019">019</option>
						</select>
						<input id = "tel1" class = "phone" type="tel" maxlength="4" name="phone2" style="width: 130px;  margin-left: 15px;">
						<input id = "tel2" class = "phone" type="tel" maxlength="4" name="phone3" style="width: 130px;  margin-left: 15px;">
					</td>
				</tr>
				<tr>
					<td></td>
					<td id ="infoP"></td>
				</tr>
			</table>
			<button id = "pwdBtn" class = "btn" onclick="sendEmail('pwd')">확인</button>
		</div>
	</div>
	
<script type="text/javascript">
function SetEmailTailI(emailValue) {
	  var email = document.all("email")    // 사용자 입력
	  var emailTail = document.all("email2I") // Select box
	  
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
function SetEmailTailP(emailValue) {
	  var email = document.all("email")    
	  var emailTail = document.all("email2P") 
	  
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

</script>
	
<script type="text/javascript">
function sendEmail(idOrPwd){
	var id;
	var pwd;
	if(idOrPwd == "id"){
		$.ajax({
			url : "/KH_Groupware/findId.me",
			data : {
				userName : $("#nameI"),
				emailId : $("#emailPtI"),
				emailTail : $("#email2I")
			},
			success : function(data) {
				if(data == null){
					$("#infoI").html("없음");
				}else{
					id = data;
				}
			}
		});
	}else{
		$.ajax({
			url : "/KH_Groupware/findPwd.me",
			data : {
				userId : $("#idP"),
				emailId : $("#emailPtP"),
				emailTail : $("#email2P"),
				tel0 : $("#tel0"),
				tel1 : $("#tel1"),
				tel2 : $("#tel2"),
			},
			success : function(data) {
				if(data == 0){
					$("#infoP").html("없음");
				}else{
					pwd = data;
				}
			}
		});
	}
	

	(function(){
	   if(idOrPwd == "id"){
		   var emailC = {
				contents : "찾으시는 아이디는" +id+" 입니다.",
				userEmail : $("#emailPtI").val()+"@"+$("#email2I").val()
		   }
	   }else if(idOrPwd == "pwd"){
		   var emailC = {
				contents : "임시비밀번호는 "+pwd+"입니다.",
				userEmail : $("#emailPtP").val()+"@"+$("#email2P").val()
		   }
	   }
      emailjs.init("user_1Xuzxxg4iKutLXCbWcLL9");
      emailjs.send("asdhyoo@gmail.com","template_k2P6Sw73",emailC)
      .then(function(response) {
          console.log("SUCCESS. status=%d, text=%s", response.status, response.text);
      }, function(err) {
          console.log("FAILED. error=", err);
      });
   })();
}
</script>
</body>
</html>