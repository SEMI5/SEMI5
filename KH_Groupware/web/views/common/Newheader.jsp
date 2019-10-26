<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
   
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	int userNo = 0; 
	if(loginUser != null){
		userNo = loginUser.getUserNo();
	} 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 제이 쿼리 지워야함 쓰려면 메인홈에서 제이쿼리 적용해서 써야함. -->
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">

<title>KH_Groupware</title>

<!--  모두 파비콘을 가져가서 본인 파일에 삽입해주세요  -->
<link rel="shortcut icon" type="image⁄x-icon" href="../../images/KH_favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 
<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Text|Do+Hyeon|Sunflower:300&display=swap" rel="stylesheet">


<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet"> 
 -->



<style>

   /* place holder 감추기*/
   input:focus::-webkit-input-placeholder, textarea:focus::-webkit-input-placeholder { /* WebKit browsers */ color:transparent; } 
   input:focus:-moz-placeholder, textarea:focus:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ color:transparent; } 
   input:focus::-moz-placeholder, textarea:focus::-moz-placeholder { /* Mozilla Firefox 19+ */ color:transparent; } 
   input:focus:-ms-input-placeholder, textarea:focus:-ms-input-placeholder { /* Internet Explorer 10+ */ color:transparent; }




/* @font-face {
	font-family: 'Noto Sans KR', sans-serif;
} */




#menuBar{
   display:block;
   width:100%;
   height: 65px;
   border:none;
   box-sizing:border-box;
   vertical-align:middle;
   padding-left: 15px;
   padding-right: 15px;
   line-height:  73px;
   background-color: #262A2D; /*#353535*/
   border-bottom: 0;
   box-shadow: 0px 1px 3px rgba(0,0,0,0.3);
   z-index: 9999;
   margin:0;
   list-style:none;
   left:0;
   top:0;
   position:fixed;
   color: #F6F6F6;
}


.menu{
	position: abolute;
	width: 10%;
	height: 65px;
	display: table-cell;
	text-align: center;
	z-index: 0px;
	font-weight: bold;
	font-size: 16px;
	font-family:"Nanum Gothic";
}



.logoImg{
	position: relative;
	float: left;
	width: 230px;
}

#logoImg{

	cursor:pointer;
}


.logoImg.hover{
	cursor: pointer;
}

.menu:hover{
	color: #343434;
	font-weight: 800;
	cursor: pointer;
	background: #fcfaf1;
}


.memberMenu:hover{

	background: none;
	color: #fcfaf1;
	 transition-duration: 0.3s;
}
.iconSpan{
	height: 65px;
	padding: 2px;
	padding-left:6px; 
	padding-right: 6px;
	z-index: 0;
}

.iconSpan:hover{
 	background: #fcfaf1;
	color: #343434;
	 transition-duration: 0.3s;
}

.outerDiv{
	margin: -10px;
  padding:0px;
  z-index: 8888;
}

/*  body {margin:0;}; */


.subMenu{
	width: 100%;
	height: 500px;
	margin:0px;
	list-style:none;
	position: fixed;
	z-index: 1000;
	vertical-align:middle;
	line-height:  60px;
   	box-shadow: 0px 1px 3px rgba(0,0,0,0.3);
   	left:0px;
   	right: 0px;
   	top: 65px;
   	background: #fcfaf1;
    border: none;
	display: none;
   
}




.hoverStay{
	background:#fcfaf1;
	color: #343434;
	font-weight: 1000;
}
.textArea{
	float:left;
	height: 70%;
	width: 350px;
	align-text:center; 
	vertical-align:middle;
	padding-top: 50px;
	padding-left: 20px; 
	position: relative;
	font-size: 16px;
	font-weight: bold;
	z-index: 1000;
	left: 120px;
	border: none;
}

.textArea p{
	width: 80px;
	padding:none;
	margin:none;
	border: none;
}



.textArea p span{
	border:none;
	width: 80px;
	padding:none;
	padding-bottom:7px;
	margin:none;
	border: none;
	
}


.textArea p span:hover{
	color: gray;
	cursor:pointer;
	border-bottom: 2px solid black;
}

.imgArea1{
	height: 100%;
	width: 1100px;
	z-index: 1000;
	background-image:url(<%=request.getContextPath()%>/images/helloquence-5fNmWej4tAA-unsplash.jpg); 
	background-size: 1100px 500px;
	background-repeat: no-repeat;
	background-position: center left;
	position:absolute;
	right:0px;

}

.imgArea2{
	border: none;
	height: 100%;
	width: 1100px;
	z-index: 1000;
 	background-image:url("<%=request.getContextPath()%>/images/damian.jpg");
	background-size: 1100px 500px;
	background-repeat: no-repeat;
	background-position: center left;
	position:absolute;
	right:0px;	
}

.imgArea3{
	border: none;
	height: 100%;
	width: 1100px;
	z-index: 1000;
	background-image:url("<%=request.getContextPath()%>/images/teacherPage.jpg");
	background-size: 1100px 500px;
	background-repeat: no-repeat;
	background-position: center left;
	position:absolute;
	right:0px;	
}



.blackOpacity{
 background:black;
   position:fixed;
   width:100%;
   height:100%;
   opacity: 0.8;
   display:none;
   left:0px;
   right:0px;
   z-index:3;
   float: bottom;
   top:65px;
}

.loginDiv{
   background: #fcfaf1;
   width: 450px; 
   height: 100%; 
   color: black; 
   text-align: center; 
   margin: 0px;
   border: 1px solid lightgray;
   float: right;
   position:fixed; right:-620px;
   z-index:9998;
   top: 65px;
   display:none;
}



.loginArea{
width: 450px;
heigh: 500px;
 z-index: 11;
}

.loginArea input{
	width: 310px;
	height: 35px;
}


.joinArea{
   position: absolute;
   top: 460px;
   width: 450px;
   text-align:center;
   algin:center;
}


.introMenu{
	position:absolute; 
	width: 130px;
	left: 250px;
}
.boardMenu{
	position:absolute; 
	width: 130px;
	left: 380px;
}

.shareMenu{
	position:absolute; 
	width: 130px;
	left: 510px;

}

.elbumMenu{
	position:absolute; 
	width: 130px;
	left: 640px;
}

.tastyMenu{
	position:absolute; 
	width: 130px;
	left: 770px;
}

.mypageMenu{
	position:absolute; 
	width: 130px;
	left: 900px;
}

.teacherMenu{
	position:absolute; 
	width: 130px;
	left: 1030px;
}
.memberMenu{ 
	position: absolute;
	right: 0px;
	font-size: 24px;
}

.icon1{ /* 채팅*/
	position: absolute;
	right: 105px;
}

.icon2{ /*회원가입*/
	position: absolute;
	right: 60px;
}

.icon3{  /*로그인*/
	position: absolute;
	right: 15px;
}


.blackBtn{
	font-size: 15px;  
    outline: none;
    color: #F6F6F6;
    background-color: #262A2D;
    margin:auto;
    padding:auto;
    width: 350px;
    height: 50px;
    cursor: pointer;
    border : none;
    text-align: center;
    vertical-align: middle;
    font-weight: bold;
}

.blackBtn1:hover{
	background: #f53f29;
	color: white;
	
}

.blackBtn2:hover{
	background: #E7E3E3;
	color: #262A2D;
}


#saveId{
	position: absolute;
	top: 171px;
	left:174px;
	margin: 0px;
	padding: 0px;
}

.saveIDLabel{
	font-weight:550;
	font-size:8px
}


#userPwd:focus{
	outline: 2px solid #2478FF
}

#userId:focus{
	outline: 2px solid #2478FF

}


body{ 
	margin: 0px;
	overflow-x:hidden;   /*스크롤 가로  잠금*/	
	font-family:"Nanum Gothic";
}

</style>

</head>

<body>

<div id= outerDiv>;  
	<div id= "menuBar" >
			<div class =" logoImg" style="line-height:50px;" "><img  id =logoImg src="<%=request.getContextPath()%>/images/logoImg.png" onclick= "location.href = '<%=request.getContextPath()%>/views/common/mainHome.jsp'""></div>
			<div class= "menu introMenu">소개</div>
			<div class= "menu boardMenu" onclick = "showBoardDiv();">게시판</div>
			<div class= "menu shareMenu" onclick = "gonShareFile();">공유자료</div>
			<div class= "menu elbumMenu" onclick= "goElbum();">앨범</div>
			<div class= "menu tastyMenu" onclick = "goTasty();">맛집</div>
			<div class= "menu mypageMenu" onclick = "showMypageDiv();">마이페이지</div>
			<div class= "menu teacherMenu" onclick = "showTeacherDiv();">강사페이지</div>
			<div class= "menu memberMenu">
				<span class= "iconSpan icon1" onclick = "showChattingPOPUP();"><i class="fa fa-comments" aria-hidden="true"></i></span>&nbsp;
				<span class= "iconSpan icon2" onclick = "memberJoin();"><i class="fa fa-sign-in" aria-hidden="true"></i></span>&nbsp;
				<span id= "loginIcon" class= "iconSpan icon3" onclick= "loginDivShow();"><i class="fa fa-user" aria-hidden="true" ></i></span>
			</div>
	 </div>	
		
		
	<!-- 게시판 서브메뉴 div -->
	 <div id= "boardDiv" class="subMenu" data-value = "0">
	 	<div class= textArea>
	 		<p onclick="goNBoard();"><span>공지사항</span></p>
	 		<p onclick="goFBoard();"><span>자유게시판</span></p>
	 	</div>
	 	<div class= imgArea1></div>
	 </div>
	
	<!-- 마이페이지 서브메뉴 div -->	
	<div id= "mypageDiv" class="subMenu" data-value = "0">
	 	<div class= textArea>
		<p style="width:130px;"><span style="width:130px;" onclick = "goMyInfo();">내 정보수정<span></p>  
	  	 <p style="width:130px;" onclick= "location.href = '<%=request.getContextPath()%>/views/studentPage/stdCalendar.jsp'"><span style="width:130px;" >일정 및 휴가관리<span></p> 
	 	</div>
	 	<div class= imgArea2>
	 	</div>
	 </div>
	
	
	<!-- 강사페이지 서브메뉴 div -->	
	<div id= "teacherDiv" class="subMenu" data-value = "0">
	 	<div class= textArea>
	 		<p onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/approvalJoin.jsp'"><span>가입승인</span></p>
	 		<p onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/managementStd.jsp'"><span>학생관리</span></p>
	 		<p onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/seatView.jsp'"><span>자리배치</span></p>
	 	</div>
	 	<div class= imgArea3>
	 	</div>
 	</div>
	 
	 <div id= "loginDiv" class="loginDiv" data-value = "0">
		<div class=loginArea style="align:center;margin-top:40px">
			<br><br>
			<%if(loginUser == null) {%>	
			<span style="font-weight:700; font-size:18px ">회원이시면 로그인해주세요</span><br><br>
			<form id = "loginForm" action ="<%=request.getContextPath()%>/login.me" onsubmit="return validate();" method = "post">
				<div style= "width:440px; align:cetner; ">
				<span style="font-weight:550";>&nbsp;ID:</span>&nbsp;<input id = "userId" type="text" name = "userId" id = "userId"  placeholder="Enter UserId"><br>
				
				<label id ="saveIDLabel" for ="saveId"  style="position:absolute; left:80px; font-size: 13px"><b>아이디 저장하기</b></label>
				<br>
				<input type = "checkbox" name = "saveID" id = "saveId" style="height:15px;width:16px">
				<span style="font-weight:550;margin-top: 10px";>PW:</span>&nbsp;<input id = "userPwd" type="text"  name = "userPwd" id = "userPwd" placeholder="Enter Password" style="margin-top: 10px"><br> <br>
				</div>
				<br>
				
				<!-- 버튼 디포트값 서브밋 -->
				<button class = " blackBtn blackBtn1">로그인</button><br><br><br> 
				<button class = "blackBtn blackBtn2"  type = "button" onclick="">아이디 / 비밀번호 찾기</button>
			</form>
			<% }else{%>
				<span style="font-weight:700; font-size:18px "><%=loginUser.getUserName() %>님의 방문을 환영합니다.</span><br><br>
			   
				<br>
				<button class = "blackBtn blackBtn2" onclick = "goMyInfo();">내 정보수정 </button><br><br><br>
				<button class = " blackBtn blackBtn1" onclick = "logout();" >로그아웃</button>

			</form>
				
				
				
				
			<%}%>
		</div>
		<%if(loginUser == null) {%>	
		<div class=joinArea>
			<div>
				<br><br>
				<span style="font-weight:700; font-size:18px ">비회원이시면 가입해주세요</span>
				<br><br><br>	
				<button class = " blackBtn blackBtn1" type = "submit" type="button" onclick = "memberJoin();">회원가입</button><br><br><br>
			</div>
		</div>
		<%}%>
	</div>
</div>


<div id="blackOpacity1" class= blackOpacity></div>  <!--  게시판 -->
<div id="blackOpacity2" class= blackOpacity></div>  <!-- 마이페이지  -->
<div id="blackOpacity3" class= blackOpacity></div>   <!-- 강사페이지 -->
<div id="blackOpacity4" class= blackOpacity></div>   <!-- 로그인  -->


<input id= userNo type= hidden value= <%=userNo%>> 






<script>



//공지사항 바로가기 
function goNBoard(){
		location.href="<%=request.getContextPath()%>/Nlist.bo";	

}



// 자유게시판으로 바로가기 
function goFBoard(){
		var userNo = $("#userNo").val()
	  if( userNo == 0 ){
			alert("로그인을 해야만 사용가능합니다.");
		}else{
			location.href="<%=request.getContextPath()%>/Flist.bo";	
		}  
}


//공유자료 바로가기 
function gonShareFile(){
	
	location.href="<%=request.getContextPath()%>/list.sh";
}


// 앨범 바로가기 
function goElbum(){
		var userNo = $("#userNo").val()
	  if( userNo == 0 ){
			alert("로그인을 해야만 사용가능합니다.");
		}else{
			location.href="<%=request.getContextPath()%>/list.th";	
		}  
}



//맛집으로 바로가기 
function goTasty(){
	var userNo = $("#userNo").val()
  	if( userNo == 0 ){
			alert("로그인을 해야만 사용가능합니다.");
	}else{
		location.href = "<%=request.getContextPath()%>/views/map2/mapForm.jsp";
	}  
}


// 채팅바로가기 
   function showChattingPOPUP() {
		  window.open("../chatting/chattingPopup.jsp", "", "width=400, height=600, left=100, top=50");
	  }


	function goMyInfo(){
		
		alert("내정보수정 뭔가 이상함. 실행하면안됨")
		
		<%-- if(<%=userNo%> != 0){	
			location.href="<%=request.getContextPath()%>/mypage.me?userId=<%=loginUser.getUserId()%>";  
		}   --%>
	}


// 로그인 및 회원 가입 모음 


// 로그인 input 창 검사 
// 1-1. validate() 함수 작성하기 (form태그가 submit 되었을 때 실행됨) // 로그인 버튼 클릭시 실행함수
function validate(){
	/* input태그는 val() / trim() 공백제거 후 length 길이가 0이면 (입력이 안되었다면) */
	if($("#userId").val().trim().length==0){
		alert("아이디를 입력하세요");
		$("#userId").focus();
		
		return false; // return값이 false면 submit이 되지않는다.
	}
	
	if($("#userPwd").val().trim().length==0){
		alert("비밀번호를 입력하세요");
		$("#userPwd").focus();
		
		return false;
	}
	
	return true; // submit실행
	
}


//로그인 sumbmit
/* function login(){
	alert("최신버전확인!")
	$("#loginBtn").submit;
}
 */

// 회원가입 버튼 
function memberJoin(){
	if(<%=userNo%> != 0){
		alert("이미 회원가입을 하셨습니다.")
		
	}else{
		location.href="<%=request.getContextPath()%>/views/member/memberJoinForm.jsp";
		location.href ="<%=request.getContextPath()%>/cclass.me";
		
	}

	
}




//로그아웃 
function logout(){
	location.href = '<%= request.getContextPath() %>/logout.me';
	
	
}




</script>



<!--이상없음 -->
<script>


// 각각 자기 자신의 sub메뉴를 제외하고 다른 것을 눌렀을때 서브메뉴가 올라가는 메소드
  
 $(function(){


  $('html').click(function(e){ 
		  if( $("#boardDiv").data("value") =="1"){ 
			if(!$(e.target).hasClass("boardDown")){  
				if($('#boardDiv').data("value") == "1"){
					$("#boardDiv").slideUp(); 
					$("#boardDiv").data("value", "0");
					$('.boardMenu').removeClass("hoverStay");
					$("#blackOpacity1").fadeOut("fast");
				}
			} 
		 }
		
		  
		  if( $("#mypageDiv").data("value") =="1"){ 
				if(!$(e.target).hasClass("mypageDown")){  
					if($('#mypageDiv').data("value") == "1"){
						$("#mypageDiv").slideUp(); 
						$("#mypageDiv").data("value", "0");
						$('.mypageMenu').removeClass("hoverStay");
						$("#blackOpacity2").fadeOut("fast");
					}
				} 
			  }
	  
	  
		  if( $("#teacherDiv").data("value") =="1"){ 
				if(!$(e.target).hasClass("teacherDown")){  
					if($('#teacherDiv').data("value") == "1"){
						$("#teacherDiv").slideUp(); 
						$("#teacherDiv").data("value", "0");
						$('.teacherMenu').removeClass("hoverStay");
						$("#blackOpacity3").fadeOut("fast");
					}
				}
			  }
	  
		  if( $("#loginDiv").data("value") =="1"){ 
				if(!$(e.target).hasClass("loginDivShow")){  
					
					removeLoginDiv(); 
				} 
			 }
	});
 
 });
// 각각의 div 토글
	function showBoardDiv(){
	   if($('#boardDiv').data("value") == "0"){
	      $('.boardMenu').addClass("hoverStay"); 
	      $('.boardMenu').addClass("boardDown");
	      $('#boardDiv').addClass("boardDown");
	      $('#boardDiv').children().addClass("boardDown");    
	      $('#boardDiv').children().children().addClass("boardDown");    	      
	      $('#boardDiv').children().children().children().addClass("boardDown");    	      
	      $("#boardDiv").slideDown(); 
	      $("#blackOpacity1").fadeIn("fast");
	      $("#boardDiv").data("value", "1");
	   }else{
		   $("#boardDiv").slideUp();  
		   $("#boardDiv").data("value", "0");
		   $('.boardMenu').removeClass("hoverStay");
		   $("#blackOpacity1").fadeOut("fast");
	   }
	}
	      

	function showMypageDiv(){
		 if($('#mypageDiv').data("value") == "0"){
		      $('.mypageMenu').addClass("hoverStay"); 
		      $('.mypageMenu').addClass("mypageDown");
		      $('#mypageDiv').addClass("mypageDown");
		      $('#mypageDiv').children().addClass("mypageDown");    
		      $('#mypageDiv').children().children().addClass("mypageDown");    	      
		      $('#mypageDiv').children().children().children().addClass("mypageDown");    	      
		      $("#mypageDiv").slideDown(); 
		      $("#mypageDiv").data("value", "1");
		      $("#blackOpacity2").fadeIn("fast");
		   }else{
			   $("#mypageDiv").slideUp();  
			   $("#mypageDiv").data("value", "0");
			   $('.mypageMenu').removeClass("hoverStay");
			   $("#blackOpacity2").fadeOut("fast");
		   }
	}
	
	
	function showTeacherDiv(){
		 if($('#teacherDiv').data("value") == "0"){
		      $('.teacherMenu').addClass("hoverStay");
		      $('.teacherMenu').addClass("teacherDown");
		      $('#teacherDiv').addClass("teacherDown");
		      $('#teacherDiv').children().addClass("teacherDown");    
		      $('#teacherDiv').children().children().addClass("teacherDown");   
		      $('#teacherDiv').children().children().children().addClass("teacherDown");    
		      $("#teacherDiv").slideDown(); 
		      $("#teacherDiv").data("value", "1");
		      $("#blackOpacity3").fadeIn("fast");
		      
		   }else{
			   $("#teacherDiv").slideUp();  
			   $("#teacherDiv").data("value", "0");
			   $('.teacherMenu').removeClass("hoverStay");
			   $("#blackOpacity3").fadeOut("fast");
		   }
	}
	
	function loginDivShow(){
        if($('#loginDiv').data("value") == "0"){
           $('#loginIcon').addClass("hoverStay");      
           $(".loginDiv").css("display","block")
           $("#loginIcon").addClass("loginDivShow");
           $(".loginDiv").addClass("loginDivShow");
           $(".loginDiv").children().addClass("loginDivShow");
           $(".loginDiv").children().children().addClass("loginDivShow");
           $(".loginDiv").children().children().children().addClass("loginDivShow");
           $(".loginDiv").children().children().children().children().addClass("loginDivShow");
           $(".loginDiv").children().children().children().children().children().addClass("loginDivShow");
           $("#blackOpacity4").fadeIn('2000');
           $(".loginDiv").animate({"right":"0px"},'2000',function(){
           $("#loginDiv").data("value","1"); 
           }); 
        }else{
        	  $("#blackOpacity2").fadeOut('2000');
              $(".loginDiv").animate({"right":"-605px"},'2000',function(){
                 $(".loginDiv").css("display","none") 
              });
              $("#blackOpacity4").fadeOut('2000');	
              $("#loginDiv").data("value","0");
              $("#loginIcon").removeClass("hoverStay") 
        } 
		
	}
	
	  //로그인 div 제거 
    function removeLoginDiv(){
       $("#blackOpacity2").fadeOut('2000');
       $(".loginDiv").animate({"right":"-605px"},'2000',function(){
          $(".loginDiv").css("display","none") 
       });
       $("#blackOpacity4").fadeOut('2000');
       $("#loginDiv").data("value","0");
       $("#loginIcon").removeClass("hoverStay")
    }
	  
	
</script>






</body>
</html>