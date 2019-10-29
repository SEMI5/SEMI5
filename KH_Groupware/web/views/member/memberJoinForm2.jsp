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
		margin-top : 20px;
		width: 400px;
		height: 40px;
		margin-left: 60px;
	}
	
	#idCheck, #joinBtn, #searchAdd{
		margin-top: 2px;
		background : black;
		color : white;
		border-radius : 5px;
		width : 150px;
		height : 40px;
		text-align : center;
	}
	
	#searchAdd{
		align-content: left;
	}
	
	td{
		margin-top: 20px;
		font-size: 22px;
		text-align : right;
		height: 50px;
	}
	
	select{
		font-size: 20px;
		height: 40px;
		width: 400px;
		margin-left: 200px;
		margin-top: 20px;
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
	}


.scrollheader {
  position: fixed;
  top: 0;
  z-index: 1;
  width: 100%;
  background-color: #f1f1f1;
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
  background: #4caf50;
  width: 0%;
}

.memberjoinForm {
  padding: 100px 0;
  margin: 50px auto 0 auto;
  width: 80%;
}

</style>
</head>

<header>
	<%@ include file = "/views/common/header.jsp" %>
</header>

<body>
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->



				<div class="scrollheader">
				  <h2>Scroll Indicator</h2>
				  <div class="progress-container">
				    <div class="progress-bar" id="myBar"></div>
				  </div>  
				</div>
				
				 <div class = "memberjoinForm">
						<br>
						<h1 align="left" style="font-size : 50px;"><em>회원가입</em></h1>
						
						<form id = "joinForm" action = "<%=request.getContextPath() %>/insert.me" method ="post" >
							<table align = "center">
								<tr>
									<td width ="200px"> * 아이디 </td>
									<td><input id = "userId" type = "text" maxlength ="13" name = "userId" requi#f53f29></td>  <!--requi#f53f29 미입력시 값을 입력하세요 문구뜸  -->
									<th class = "info"><div id = "checkId" class = "checkInfo"></div></th>
									<!-- <td width ="200px"><div id="idCheck" class = "btns"">중복확인</div></td> -->
								</tr>
								<tr>
									<td> * 비밀번호 </td>
									<td><input id = "userPwd" type ="password" maxlength="20" name ="userPwd" requi#f53f29></td>
									<th class = "info"><div id = "checkPwd" class = "checkInfo"></div></th>
								</tr>
								<tr>
									<td>* 비밀번호 확인</td>
									<td><input id = "userPwd2" type="password" maxlength="20" name="userPwd2" requi#f53f29></td>
									<th class = "info"><div id = "checkPwd2" class = "checkInfo"></div></th>
								</tr>
								<tr>
									<td> * 이름 </td>
									<td><input id = "userName" type = "text" maxlength="5" name="userName" requi#f53f29></td>
									<th class = "info"><div id = "checkName" class = "checkInfo"></div></th>
								</tr>
								<tr>
									<td> * 생년월일 </td>
									<td>
										<input type = "text" id = "RRN" maxlength="8" name="userRRN" style="width: 159px; margin-left: 0px;" requi#f53f29>
										<input id = "genderM" type = "radio"  name="userGender" value = "1" style="width: 20px; height: 20px;" requi#f53f29>
										<label for = "genderM" >남</label>
										<input id = "genderY" type = "radio"  name="userGender" value = "2" style="width: 20px; height: 20px;" requi#f53f29>
										<label for = "genderY" >여</label>
									</td>
									<th class = "info"><div id = "checkRRN" class = "checkInfo"></div></th>
								</tr>
								
								<tr>
									<td> * 연락처 </td>
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
									<th class = "info"><div id = "checkPhone" class = "checkInfo"></div></th>
								</tr>
								<tr>
									<td> * 이메일 </td>
									<td id = "emailPt"><input type = "text" name = "emailId" style="width: 141px; margin-right: 5px;" requi#f53f29="requi#f53f29"><em>@</em>
									<input type="text" name="email2" value="naver.com" style="width: 220px; margin-left: 0px;" ReadOnly="true" placeholder = "naver.com">
									</td>
									<th>
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
									</th>
								</tr>
								<tr>
									<td> * 주소 </td>
									<td><input type="text" id="address" name = "address" placeholder="주소" ReadOnly = "true" requi#f53f29="requi#f53f29"></td>
									<th><input type="button" id = "searchAdd" class = "info" onclick="execDaumPostcode()" value="우편번호 찾기" style = "margin-left: 0px"></th>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" id="detailAddress" name = "detailAdd" placeholder="상세주소"></td>
								</tr>
								<tr>
									<td> * 반 </td>
									<td><select name = "class" style="width:404px;">
									<%for(int i = 0 ; i < cList.size(); i++ ){ %>
										<option value = "<%=cList.get(i).getcId()%>"><%=cList.get(i).getcName() %></option>
									<% }%> 
									</select></td>
									<td></td>
								</tr>
					
							</table>
							
							<div align = "center">
								<!-- submit 방법 1 (함수활용해서 submit하기 )(requi#f53f29동작 안함) -->
								<div class = "btns" id = "joinBtn" onclick = "insertMember();">가입하기</div> <!--함수방식은 requi#f53f29 적용이안됨-->
								
								<!-- submit 방법 2 -->
								<!-- <input id = "joinBtn" type="submit" value ="가입하기">	 -->			<!-- submit버튼으로 만들어서 실행해야 input태그들의 requi#f53f29이 발동함 -->
								
								<!-- InsertMemberServlet 만들러 감 -->
								<div class = "btns" id = "goMain" onclick = "goMain();">메인으로</div>
								
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
						$("#userId").css("border", "3px solid #f53f29");
						$("#checkId").text("아이디를 입력하세요.");
						idCheck = false;
					} else if (!idRe.test(userId)) {
						$("#checkId").css("color", "#f53f29");
						$("#userId").css("border", "3px solid #f53f29");
						$("#checkId").text("4-12의 영문자,숫자만 입력가능합니다.");
						idCheck = false;
					} else if (data > 0) {
						$("#checkId").css("color", "#f53f29");
						$("#userId").css("border", "3px solid #f53f29");
						$("#checkId").text("중복된 아이디입니다.");
						idCheck = false;
					} else {
						$("#checkId").text("사용가능한 아이디입니다.");
						$("#checkId").css("color", "blue");
						$("#userId").css("border", "3px solid blue");
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
				$("#userPwd").css("border", "3px solid #f53f29");
				$("#checkPwd").text("비밀번호를 입력하세요.");
				pwdCheck = false;
			} else if (!pwdRe.test(userPwd)) {
				$("#checkPwd").css("color", "#f53f29");
				$("#userPwd").css("border", "3px solid #f53f29");
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
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "3px solid #f53f29");
				$("#checkPwd2").text("비밀번호를 먼저 입력하세요.");
				$("#userPwd2").val("");
				pwdCheck2 = false;
				$("#userPwd").focus();
			} else if (pwdCheck == false) {
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "3px solid #f53f29");
				$("#userPwd2").val("");
				$("#checkPwd2").text("비밀번호 조건을 먼저 만족시켜야합니다.");
				pwdCheck2 = false;
				$("#userPwd").focus();
			} else if ($("#userPwd").val() != userPwd2) {
				$("#checkPwd2").css("color", "#f53f29");
				$("#userPwd2").css("border", "3px solid #f53f29");
				$("#checkPwd2").text("비밀번호가 일치하지 않습니다.");
				pwdCheck2 = false;
			} else {
				$("#checkPwd2").css("color", "blue");
				$("#userPwd2").css("border", "3px solid blue");
				$("#checkPwd2").text("비밀번호가 일치합니다.");
				pwdCheck2 = true;
			}

		});

		$("#userName").keyup(function() {
			var nameRe = /^[가-힣]{2,6}$/;
			var userName = $("#userName").val();

			if (userName == "") {
				$("#checkName").css("color", "#f53f29");
				$("#userName").css("border", "3px solid #f53f29");
				$("#checkName").text("이름을 입력하세요.");
				nameCheck = false;
			} else if (!nameRe.test(userName)) {
				$("#checkName").css("color", "#f53f29");
				$("#userName").css("border", "3px solid #f53f29");
				$("#checkName").text("2~6자의 한글");
				nameCheck = false;
			} else {
				$("#checkName").css("color", "blue");
				$("#userName").css("border", "3px solid blue");
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
				$("#tel1").css("border", "3px solid #f53f29");
				$("#tel2").css("border", "3px solid #f53f29");
				$("#checkPhone").text("번호을 입력하세요.");
				phoneCheck = false;
			} else if (!phoneRe.test(tel1) || !phoneRe.test(tel2) ) {
				$("#checkPhone").css("color", "#f53f29");
				$("#tel1").css("border", "3px solid #f53f29");
				$("#tel2").css("border", "3px solid #f53f29");
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
		
		$("#RRN").keyup(function() {
			var RRNre = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/
			var rrn = $("#RRN").val();

			
			if (rrn == ""  ) {
				$("#checkRRN").css("color", "#f53f29");
				$("#RRN").css("border", "3px solid #f53f29");
				$("#checkRRN").text("번호을 입력하세요.");
				rrnCheck  = false;
			} else if (!RRNre.test(rrn)) {
				$("#checkRRN").css("color", "#f53f29");
				$("#RRN").css("border", "3px solid #f53f29");
				$("#checkRRN").text("정확한 생년월일 8자리");
				rrnCheck  = false;
			} else {
				$("#checkRRN").css("color", "blue");
				$("#RRN").css("border", "3px solid blue");
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
// When the user scrolls the page, execute myFunction 
window.onscroll = function() {myFunction()};

function myFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  document.getElementById("myBar").style.width = scrolled + "%";
}
</script>

</body>
</html>