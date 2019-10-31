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
	position: relative;
}

.outer label, .outer td{
	color : black;
	
}
	
#joinForm{
	margin-top: 40px;
		
}
	
input{
	font-size: 20px;
	margin-top : 20px;
	width: 400px;
	height: 40px;
	margin-left: 20px;

}
	
#idCheck, #joinBtn, #searchAdd{
		margin-top: 2px;
		background : black;
		color : white;
		border-radius : 10px;
		width : 150px;
		height : 40px;
		text-align : center;
		border: none;
		padding: 10px 16px;
		font-size: 15px;
		cursor: pointer;
	    box-shadow: 0 5px #999;
}
#idCheck:hover, #joinBtn:hover, #searchAdd:hover{
		background-color: #f53f29; 
 	  	color: white;
     	border-radius: 16px;
		
}
#idCheck:active{
		color : white;
  		background-color: #f53f29; 
  		box-shadow: 0 3px #666;
  		transform: translateY(4px);
   		border-radius: 16px;
}
#joinBtn:active{
		color : white;
  		background-color: #f53f29; 
  		box-shadow: 0 3px #666;
  		transform: translateY(4px);
   		border-radius: 16px;
}

/* #searchAdd:actvie{
		color : white;
  		background-color: #f53f29; 
  		box-shadow: 0 3px #666;
  		transform: translateY(4px);
   		border-radius: 16px;
}
 */


#searchAdd{
	align-content: left;
}
	
td{
	margin-top: 20px;
	font-size: 22px;
	text-align : right;
	height: 50px;
	
}
.joinTd{
	width : 100px;

}
select{
	font-size: 20px;
	height: 40px;
	width: 400px;
	/* margin-left: 10px; */
	margin-top: 20px;
}

#joinForm tr{
	margin-bottom: 40px;
	
}
	

#goMain{
	background-color: #f1f1f1;
	color : black;
	border-radius : 16px;
	width : 150px;
	height : 40px;
	text-align : center;
	border: 1px solid black;
	border: none;
	padding: 10px 16px;
	font-size: 15px;
	cursor: pointer;
	box-shadow: 0 5px #999;		
}
	
#goMain:hover{
	background-color: #666;
	color: white;
	border-radius: 16px;
} 

#goMain:active {
	color : white;
  	background-color: #f53f29; 
  	box-shadow: 0 3px #666;
  	transform: translateY(4px);
   	border-radius: 16px;
}


#joinBtn, #goMain{
	display : inline-block;
}
	
.btns{
	margin: 50px;
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
	vertical-align:middle;
	
}
#joinTdbirth{
	margin-right : 77px;
}

.scrollheader {
  	position: fixed;
  	top: 0;
  	z-index: 1;
  	width: 100%;
  	background-color: #f1f1f1;
  	font-size : 35px;
}

.scrollheader h2 {
  	text-align: center;
}

.progress-container {
  	width: 100%;
  	height: 8px;
  	background: #ccc;
}

.progress-bar {
  	height: 8px;
  	background: #f53f29;
  	width: 0%;
}
ㄴ
.memberjoinForm {
  	padding: 100px 0;
  	margin: 50px auto 0 auto;
  	width: 80%;
}
/* 개인정보 탭  */
.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}

.person-content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
 /*  overflow : scroll; */
  background-color: #f1f1f1;
  overflow : scroll;
  height : 100px;
  font-size : 12px;
}

#personinfo{
	width : 490px;

}

#userinfo1{
	width : 20px;
	    position: relative;
    top: 14px;
}
</style>
</head>




<body>
<div id="container" style=""><!-- container -->
   <div id="mainContent" style=""><!-- mainContent -->


					<div class="scrollheader">
					  <h2><em>회원가입</em></h2>
					  <div class="progress-container">
					    <div class="progress-bar" id="myBar"></div>
					  </div>  
					</div>
					<br><br><br><br><br><br><br>
						<div>
							<img src="<%=request.getContextPath() %>/images/hello.jpg" style="width:100%; height:300px;">
						</div>
					 <div class = "memberjoinForm">
							<br>
							
							<form id = "joinForm" action = "<%=request.getContextPath() %>/insert.me" method ="post" >
							  <h2 align = "center"><em>KH_GroupWare에 오신걸 환영합니다.</em></h2>
								<table align = "center">
									<tr>
										<th width ="200px;"> * 아이디 </th>
										<td><input id = "userId" type = "text" maxlength ="13" name = "userId" requi#f53f29>
										<div id = "checkId" class = "checkInfo" style = "font-size : 0.7em"></div></td>
										  							<!--requi#f53f29 미입력시 값을 입력하세요 문구뜸  -->
										<!-- <td width ="200px"><div id="idCheck" class = "btns"">중복확인</div></td> -->
									</tr>
									<tr>
										<th> * 비밀번호 </th>
										<td><input id = "userPwd" type ="password" maxlength="20" name ="userPwd" requi#f53f29>
										<div id = "checkPwd" class = "checkInfo" style = "font-size : 0.7em"></div></td>
									</tr>
									<tr>
										<th>* 비밀번호 확인</th>
										<td><input id = "userPwd2" type="password" maxlength="20" name="userPwd2" requi#f53f29>
										<div id = "checkPwd2" class = "checkInfo" style = "font-size : 0.7em"></div></td>
									</tr>
									<tr>
										<th> * 이름 </th>
										<td><input id = "userName" type = "text" maxlength="5" name="userName" requi#f53f29>
										<div id = "checkName" class = "checkInfo" style = "font-size : 0.7em"></div></td>
									</tr>
									<tr>
										<th> * 생년월일 </th>
										<td>
											<div id ="joinTdbirth">
											<input type = "text" id = "RRN" maxlength="8" name="userRRN" style="width: 159px; margin-left: 0px;" requi#f53f29>
											<input id = "genderM" type = "radio"  name="userGender" value = "1" style="width: 20px; height: 20px;" requi#f53f29>
											<label for = "genderM" >남</label>
											<input id = "genderY" type = "radio"  name="userGender" value = "2" style="width: 20px; height: 20px;" requi#f53f29>
											<label for = "genderY" >여</label>
											</div>
											<div id = "checkRRN" class = "checkInfo" style = "font-size : 0.7em"></div>
										</td>
									</tr>
									
									<tr>
										<th> * 연락처 </th>
										<td>
											<select id = "tel0" class = "phone" name = "phone1" style="width: 90px; margin-left: 10px; height: 48px;">
												<option value = "010">010</option>
												<option value = "011">011</option>
												<option value = "016">016</option>
												<option value = "019">019</option>
											</select>
											<input id = "tel1" class = "phone" type="tel" maxlength="4" name="phone2" style="width: 130px;  margin-left: 15px;">
											<input id = "tel2" class = "phone" type="tel" maxlength="4" name="phone3" style="width: 130px;  margin-left: 15px;">
											<div id = "checkPhone" class = "checkInfo" style = "font-size : 0.7em"></div>
										</td>
									</tr>
									<tr>
										<th> * 이메일 </th>
										<td id = "emailPt"><input type = "text" name = "emailId" style="width: 141px; margin-right: 5px;" requi#f53f29="requi#f53f29"><em>@</em>
										<input type="text" name="email2" value="naver.com" style="width: 220px; margin-left: 0px;" ReadOnly="true" placeholder = "naver.com">
										</td>
										<td>
										<select id = "selctEmail" name = "selctEmail" class = "info" style="width: 150px; margin-left: 0px; height: 40px;" onchange="SetEmailTail(selctEmail.options[this.selectedIndex].value)" >
											<!-- <option value = "notSelected">====선택====</option> -->
											<option value = "naver.com">naver.com</option> 
											<option value = "goole.com">google.com</option>
											<option value = "hanmail.net">hanmail.net</option>
											<option value = "yahoo.com">yahoo.com</option>
											<option value = "nate.com">nate.com</option>
											<option value = "hotmail.com">hotmail.com</option>
											<option value = "daum.net">daum.net</option>
											<option value = "etc">직접입력</option>
										</select>
										</td>
									</tr>
									<tr>
										<th> * 주소 </th>
										<td><input type="text" id="address" name = "address" placeholder="주소" ReadOnly = "true" requi#f53f29="requi#f53f29"></td>
										<td><input type="button" id = "searchAdd" class = "info" onclick="execDaumPostcode()" value="우편번호 찾기" style = "margin-left: 0px"></td>
									</tr>
									<tr>
										<th></th>
										<td><input type="text" id="detailAddress" name = "detailAdd" placeholder="상세주소"></td>
									</tr>
									<tr>
										<th> * 반 </th>
										<td><select name = "class" style="width:404px;">
										<%for(int i = 0 ; i < cList.size(); i++ ){ %>
											<option value = "<%=cList.get(i).getcId()%>"><%=cList.get(i).getcName() %></option>
										<% }%> 
										</select></td>
										<td></td>
									</tr>
						
								</table>
								<table id = "personinfo" align = "center">
									<tr>
										<td>
											<p><span style = "font-size:18px;">
												필수동의 항목 및 개인정보 수집 및 이용 동의(선택),마케팅 정보 수신(선택)에 모두 동의합니다.</span><input type = "checkbox" id = "userinfo1"></p>
																				
										</td>
									</tr>
									<tr>
										
									</tr>
									<tr>
									<td>
										<button type="button" class="collapsible"><span style = "color:#f53f29;">[필수]</span> 이용약관 동의</button>
										<div class="person-content">
											<p>제 1 조 (목적)
													본 약관은 KHGROUPWARE (이하 "회사")가 운영하는 "서비스"를 이용함에 있어 "회사"와 회원간의 이용 조건 및 제반 절차, 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 한다.
													제 2 조 (용어의 정의)
													이 약관에서 사용하는 용어의 정의는 아래와 같다.
													
													① "사이트"라 함은 회사가 서비스를 "회원"에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일웹, 앱 등의 서비스를 제공하는 모든 매체를 통칭하며, 통합된 하나의 회원 계정(아이디 및 비밀번호)을 이용하여 서비스를 제공받을 수 있는 아래의 사이트를 말한다.
													- www.khgroupware.co.kr
													- https://www.iei.or.kr
													- www.campusmon.com
													- m.jobkorea.co.kr
													- m.albamon.com
													- learning.jobkorea.co.kr
													② "서비스"라 함은 회사가 운영하는 사이트를 통해 개인이 구직, 교육 등의 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 사이트에서 제공하는 모든 부대 서비스를 말한다.
													③ "회원"이라 함은 "회사"가 제공하는 서비스를 이용하거나 이용하려는 자로, 페이스북 등 외부 서비스 연동을 통해 "회사"와 이용계약을 체결한자 또는 체결하려는 자를 포함하며, 아이디와 비밀번호의 설정 등 회원가입 절차를 거쳐 회원가입확인 이메일 등을 통해 회사로부터 회원으로 인정받은 "개인회원"을 말한다.
													④ "아이디"라 함은 회원가입 시 회원의 식별과 회원의 서비스 이용을 위하여 "회원"이 선정하고 "회사"가 부여하는 문자와 숫자의 조합을 말한다.
													⑤ "비밀번호"라 함은 위 제4항에 따라 회원이 회원가입시 아이디를 설정하면서 아이디를 부여받은 자와 동일인임을 확인하고 "회원"의 권익을 보호하기 위하여 "회원"이 선정한 문자와 숫자의 조합을 말한다.
													⑥ "비회원"이라 함은 회원가입 절차를 거치지 않고 "회사"가 제공하는 서비스를 이용하거나 하려는 자를 말한다.
													제 3 조 (약관의 명시와 개정)
													① "회사"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처 등을 "회원"이 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 "회원"에게 공지해야 한다.
													② "회사"는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련법을 위반하지 않는 범위에서 이 약관을 개정할 수 있다.
													③ "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지한다. 단 "회원"의 권리, 의무에 중대한 영향을 주는 변경의 경우에는 적용일자 30일 전부터 공지하도록 한다.
													④ "회원"은 변경된 약관에 대해 거부할 권리가 있다. "회원"은 변경된 약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. "회원"이 거부하는 경우 본 서비스 제공자인 "회사"는 15일의 기간을 정하여 "회원"에게 사전 통지 후 당해 "회원"과의 계약을 해지할 수 있다. 만약, "회원"이 거부의사를 표시하지 않거나, 전항에 따라 시행일 이후에 "서비스"를 이용하는 경우에는 동의한 것으로 간주한다.
													제 4 조 (약관의 해석)
													① 이 약관에서 규정하지 않은 사항에 관해서는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등의 관계법령에 따른다.
													② 각 사이트 및 서비스 이용약관이 있는 경우에는 서비스 이용약관이 우선한다.
													③ "회원"이 "회사"와 개별 계약을 체결하여 서비스를 이용하는 경우에는 개별 계약이 우선한다.
													제 5 조 (이용계약의 성립)
													① "회사"의 서비스 이용계약(이하 "이용계약")은 서비스를 이용하고자 하는 자가 본 약관과 개인정보처리방침을 읽고 "동의" 또는 "확인" 버튼을 누른 경우 본 약관에 동의한 것으로 간주한다.
													② 제1항 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있으며, "회원"은 본인인증에 필요한 이름, 생년월일, 연락처 등을 제공하여야 한다.
													③ "회원"이 이용신청(회원가입 신청) 작성 후에 "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다.
													④ 페이스북 등 외부 서비스와의 연동을 통해 이용계약을 신청할 경우, 본 약관과 개인정보처리방침, 서비스 제공을 위해 "회사"가 "회원"의 외부 서비스 계정 정보 접근 및 활용에 "동의" 또는 "확인" 버튼을 누르면 "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다.
													<br><input type = "checkbox" id = "userinfo1">
										</div>
									</td>
									</tr>
									<tr>
									<td>
										<button type="button" class="collapsible"><span style = "color:#f53f29;">[필수]</span> 개인정보 수집 및 이용 동의</button>
										<div class="person-content">
											<p>1. 수집하는 개인정보 항목 및 이용 목적
													1) 회원가입 시
													- 수집목적 : 회원제 서비스 가입 및 본인여부 확인
													- 수집항목 : 이름, 아이디, 비밀번호, 휴대폰번호, e-메일, 생년월일, 성별, 주소
													
													2) 이력서 등록 시
													- 수집목적 : 이력서 작성
													- 수집항목 : 이름, 연락처(전화번호/휴대폰/e-메일), 학력사항, 경력사항, 생년월일, 성별, 사진, 홈페이지, 우편번호, 주소, 자기소개서
													
													3) 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
													- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록, 광고 ID
													- 모바일 서비스의 특성상 단말기 모델 정보가 수집될 수 있으나, 이는 개인을 식별할 수 없는 형태입니다.
													
													2. 개인정보의 보유 및 이용기간
													회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 이용기간이 종료한 경우 개인정보를 지체 없이 파기합니다.
													단, 상법 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유합니다.</p>
													<br><input type = "checkbox" id = "userinfo1">
										</div>
									</td>
									</tr>
												<tr>
									<td>
										<button type="button" class="collapsible">[선택] 개인정보 수집 및 이용 동의</button>
										<div class="person-content">
											<p>1. 수집하는 개인정보 항목 및 이용 목적
													1) 이력서 등록 시
													- 수집목적 : 이력서 작성
													- 수집항목 : 취업우대사항(보훈대상, 취업보호대상, 장애여부, 병역사항, 고용지원금대상)
													
													2. 개인정보의 보유 및 이용기간
													회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 이용기간이 종료한 경우 개인정보를 지체 없이 파기합니다.
													단, 상법 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유합니다.</p>
													<br><input type = "checkbox" id = "userinfo1">
										</div>
									</td>
									</tr>
									
									
					
								</table>
								<div align = "center">
									<!-- submit 방법 1 (함수활용해서 submit하기 )(requi#f53f29동작 안함) -->
									<!-- <div class = "btns" id = "joinBtn" onclick = "insertMember();">가입하기</div> 함수방식은 requi#f53f29 적용이안됨 -->
									<input type="button" class = "btns" id = "joinBtn" onclick="insertMember()" value="가입하기">
									<!-- submit 방법 2 -->
									<!-- <input id = "joinBtn" type="submit" value ="가입하기">	 -->			<!-- submit버튼으로 만들어서 실행해야 input태그들의 requi#f53f29이 발동함 -->
									
									<!-- InsertMemberServlet 만들러 감 -->
									<!-- <div class = "btns" id = "goMain" onclick = "goMain();">메인으로</div> -->
									<input type="button" class = "btns" id = "goMain" onclick="goMain()" value="메인으로">
								</div>
							</form>
						</div>
						
						
						
						<!-- 중복체크 팝업창 -->
						<div id = "idCheckPop">
								<h1>test</h1>
								
								
		</div><!-- container -->
</div><!-- mainContent -->
<%@ include file = "/views/common/footer.jsp" %>								
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


	////////////////////////////////////////////////// 유효성검사 /////////////////////////////////////////////
	
		
		idCheck = false;
		pwdCheck = false;
		pwdCheck2 = false;
		nameCheck = false;
		phoneCheck = false;
		rrnCheck = false;
		
		
		
		$("#userId").keyup(function() {
			var userId = $("#userId").val();
			var idRe = /^[a-z,A-z,0-9]{4,12}$/;

			$.ajax({
				url : "/KH_Groupware/checkId.me",
				data : {
					userId : userId
				},
				success : function(data) {
					if (userId == "") {
						$("#checkId").css("color", "#f53f29");
						$("#userId").css("border", "2px solid #f53f29");
						$("#checkId").text("아이디를 입력하세요.");
						idCheck = false;
					} else if (!idRe.test(userId)) {
						$("#checkId").css("color", "#f53f29");
						$("#userId").css("border", "2px solid #f53f29");
						$("#checkId").text("4-12의 영문자,숫자만 입력가능합니다.");
						idCheck = false;
					} else if (data > 0) {
						$("#checkId").css("color", "#f53f29");
						$("#userId").css("border", "2px solid #f53f29");
						$("#checkId").text("중복된 아이디입니다.");
						idCheck = false;
					} else {
						$("#checkId").text("사용가능한 아이디입니다.");
						$("#checkId").css("color", "blue");
						$("#userId").css("border", "2px solid blue");
						idCheck = true;
					}
				}
			});
		});

		$("#userPwd").keyup(function() {
			var userPwd = $("#userPwd").val();
			var pwdRe = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

			if (userPwd == "") {
				$("#checkPwd").css("color", "#f53f29");
				$("#userPwd").css("border", "2px solid #f53f29");
				$("#checkPwd").text("비밀번호를 입력하세요.");
				pwdCheck = false;
			} else if (!pwdRe.test(userPwd)) {
				$("#checkPwd").css("color", "#f53f29");
				$("#userPwd").css("border", "2px solid #f53f29");
				$("#checkPwd").text("문자,숫자,특수문자를 포함한 8-20자");
				pwdCheck = false;
			} else {
				$("#checkPwd").css("color", "blue");
				$("#userPwd").css("border", "2px solid blue");
				$("#checkPwd").text("사용가능한 비밀번호입니다.");
				pwdCheck = true;
			}
		});

		$("#userPwd2").keyup(function() {
			var userPwd2 = $("#userPwd2").val();

			if ($("#userPwd1") == "") {
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "2px solid #f53f29");
				$("#checkPwd2").text("비밀번호를 먼저 입력하세요.");
				$("#userPwd2").val("");
				pwdCheck2 = false;
				$("#userPwd").focus();
			} else if (pwdCheck == false) {
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "2px solid #f53f29");
				$("#userPwd2").val("");
				$("#checkPwd2").text("비밀번호 조건을 먼저 만족시켜야합니다.");
				pwdCheck2 = false;
				$("#userPwd").focus();
			} else if ($("#userPwd").val() != userPwd2) {
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "2px solid #f53f29");
				$("#checkPwd2").text("비밀번호가 일치하지 않습니다.");
				pwdCheck2 = false;
			} else {
				$("#checkPwd2").css("color", "blue");
				$("#userPwd2").css("border", "2px solid blue");
				$("#checkPwd2").text("비밀번호가 일치합니다.");
				pwdCheck2 = true;
			}

		});

		$("#userName").keyup(function() {
			var nameRe = /^[가-힣]{2,6}$/;
			var userName = $("#userName").val();

			if (userName == "") {
				$("#checkName").css("color", "#f53f29");
				$("#userName").css("border", "2px solid #f53f29");
				$("#checkName").text("이름을 입력하세요.");
				nameCheck = false;
			} else if (!nameRe.test(userName)) {
				$("#checkName").css("color", "#f53f29");
				$("#userName").css("border", "2px solid #f53f29");
				$("#checkName").text("2~6자의 한글");
				nameCheck = false;
			} else {
				$("#checkName").css("color", "blue");
				$("#userName").css("border", "2px solid blue");
				$("#checkName").text("유효한 이름입니다.");
				nameCheck = true;
			}
		});

		$(".phone").keyup(function() {
			var phoneRe = /^[0-9]{3,4}$/;
			var tel1 = $("#tel1").val();
			var tel2 = $("#tel2").val();
			
			if (tel1 == ""  && tel2 == "" ) {
				$("#checkPhone").css("color", "#f53f29");
				$("#tel1").css("border", "2px solid #f53f29");
				$("#tel2").css("border", "2px solid #f53f29");
				$("#checkPhone").text("번호을 입력하세요.");
				phoneCheck = false;
			} else if (!phoneRe.test(tel1) || !phoneRe.test(tel2) ) {
				$("#checkPhone").css("color", "#f53f29");
				$("#tel1").css("border", "2px solid #f53f29");
				$("#tel2").css("border", "2px solid #f53f29");
				$("#checkPhone").text("3~4자의 숫자");
				phoneCheck = false;
			} else {
				$("#checkPhone").css("color", "blue");
				$("#tel0").css("border", "2px solid blue");
				$("#tel1").css("border", "2px solid blue");
				$("#tel2").css("border", "2px solid blue");
				$("#checkPhone").text("유효한 전화번호입니다.");
				phoneCheck = true;
			}
		});
		
		$("#RRN").keyup(function() {
			var RRNre = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/
			var rrn = $("#RRN").val();

			
			if (rrn == ""  ) {
				$("#checkRRN").css("color", "#f53f29");
				$("#RRN").css("border", "2px solid #f53f29");
				$("#checkRRN").text("번호을 입력하세요.");
				rrnCheck  = false;
			} else if (!RRNre.test(rrn)) {
				$("#checkRRN").css("color", "#f53f29");
				$("#RRN").css("border", "2px solid #f53f29");
				$("#checkRRN").text("정확한 생년월일 8자리");
				rrnCheck  = false;
			} else {
				$("#checkRRN").css("color", "blue");
				$("#RRN").css("border", "2px solid blue");
				$("#checkRRN").text("유효한 생년월일입니다.");
				rrnCheck  = true;
			}
		});
		
		
		// 회원가입 하기 함수
		function insertMember(){
			if(idCheck == false){
				alert("아이디를 확인해주세요.");
				$("#userId").focus();
			}else if(pwdCheck  == false){
				alert("비밀번호를 확인해주세요.");
				$("#userPwd").focus();
			}else if(pwdCheck2  == false){
				alert("비밀번호 일치여부를 확인해주세요.");
				$("#userPwd2").focus();
			}else if(nameCheck  == false){
				alert("이름를 확인해주세요.");
				$("#userName").focus();
			}else if(phoneCheck  == false){
				alert("전화번호를 확인해주세요.");
				$("#tel1").focus();
			}else if(rrnCheck  == false){
				alert("생년월일를 확인해주세요.");
				$("#RRN").focus();
			}else if($("input:radio[name='userGender']").is(":checked")==false){
				alert("성별을 선택해주세요.");
				$("input:radio[name='userGender']").focus();
			}else if($("#emailId").val() == ""){
				alert("이메일을 입력해주세요.");
				$("#emailId").focus();
			}else if($("#address").val() == ""){
				alert("주소를 입력해주세요.");
				$("#emailId").focus();
			}else{
				if(!confirm("정말로 회원가입하시겠습니까 ?")){
					return false;
				};
				$("#joinForm").submit();
			}	
		}
	
		
		
		
		
		
		
		
		
		
		// 메인으로 이동 함수
		function goMain() {
			location.href = "<%=request.getContextPath()%>/index.jsp";
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
    
    
// 상단 스크롤 script    
// When the user scrolls the page, execute myFunction 
window.onscroll = function() {myFunction()};

function myFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  document.getElementById("myBar").style.width = scrolled + "%";
}


// 개인정보 동의 탭
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}


</script>

</body>
</html>