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

<!-- 지워야함 쓰려면 메인홈에서 제이쿼리 적용해서 써야함. -->


<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">

<title>KH_Groupware</title>

<!--  모두 파비콘을 가져가서 본인 파일에 삽입해주세요  -->

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
	position: absolute;
	z-index: 1000;
	vertical-align:middle;
	line-height:  60px;
   	box-shadow: 0px 1px 3px rgba(0,0,0,0.3);
   	left:0px;
   	right: 0px;
   	top: 44px;
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
	top: 155px;
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
	 		<p style="width:130px;"	onclick = "location.href='<%=request.getContextPath()%>/mypage.me?userId=<%=loginUser.getUserId() %>'"><span style="width:130px;">내 정보수정<span></p>
	 		<p style="width:130px;" onclick= "location.href = '<%=request.getContextPath()%>/views/studentPage/stdCalendar.jsp'"><span style="width:130px;" >일정 및 휴가관리<span></p>
	 	</div>
	 	<div class= imgArea2></div>
	 </div>
	
	

</div>
	


<div id="blackOpacity1" class= blackOpacity></div>  <!--  게시판 -->
<div id="blackOpacity2" class= blackOpacity></div>  <!-- 마이페이지  -->
<div id="blackOpacity3" class= blackOpacity></div>   <!-- 강사페이지 -->
<div id="blackOpacity4" class= blackOpacity></div>   <!-- 로그인  -->


<input id= userNo type= hidden value= <%=userNo%>> 


<button style="position: absolute; bottom: 0px;">fasdf</button>
</body>

<script>
function goTasty(){
	alert(":dfsf");
	
}
</script>


</html>