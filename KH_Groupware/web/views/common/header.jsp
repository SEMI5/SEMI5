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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src = "../js/jquery-3.2.1.min.js" type = "text/javascript"></script> -->



<title>KH_Groupware</title>

<!--  모두 파비콘을 가져가서 본인 파일에 삽입해주세요  -->
<link rel="shortcut icon" type="image⁄x-icon" href="../../images/KH_favicon.ico">

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">


<style>

   /* place holder 감추기*/
   input:focus::-webkit-input-placeholder, textarea:focus::-webkit-input-placeholder { /* WebKit browsers */ color:transparent; } 
   input:focus:-moz-placeholder, textarea:focus:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ color:transparent; } 
   input:focus::-moz-placeholder, textarea:focus::-moz-placeholder { /* Mozilla Firefox 19+ */ color:transparent; } 
   input:focus:-ms-input-placeholder, textarea:focus:-ms-input-placeholder { /* Internet Explorer 10+ */ color:transparent; }




/* @font-face {
	font-family: 'Noto Sans KR', sans-serif;
} */

#chattingBtn{
	float: right;
}



#menuBar{
   display:block;
   width:100%;
   height: 65px;
   border:none;
   box-sizing:border-box;
   vertical-align:middle;
   padding-left: 15px;
   padding-right: 15px;
   line-height:  60px;
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
.navbar1 {
    overflow: hidden;
    background-color: white;
    border : none;
    width: 100%;
    margin-top:15px;
    margin-left:0px;
    /* position: fixed; */
     position:relative;
    left: 0px;
    right: 0px;
     z-index: 1;


.menu{
   position: abolute;
   width: 10%;
   height: 65px;
   display: table-cell;
   text-align: center;
   z-index: 0px;
   font-weight: bold;
   font-size: 16px;
   font-family:"Nanum Gothic"
}

#logo{

}


.logoImg{
   position: relative;
   float: left;
   width: 230px;
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
   font-family:"Nanum Gothic";
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

.imgArea{
   border: none;
   height: 100%;
   width: 1100px;
   display: inline-block;
   z-index: 1000;
   float:right;
}



.blackOpacity{
   background:black;
   position:absolute;
   top: 20px;
   width:100%;
   height:100%;
   opacity: 0.8;
   display:none;
   left:0px;
   right:0px;
   z-index:7;

}

.loginDiv{
   background: white; 
   width: 500px; 
   height: 100%; 
   color: black; 
   text-align: center; 
   margin: 0px;
   border: 1px solid lightgray;
   position:absolute; right:-610px;
   z-index:10;
   display:none;
}



.loginArea{
width: 450px;
heigh: 500px;
border: 1px solid black;
 z-index: 11;
}

.joinArea{

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
    color: white;
    background-color: black; /*부모랑 같은 색 */
    margin:auto;
    padding:auto;
    width: 350px;
    height: 50px;
    cursor: pointer;
    border : none;
    text-align: center;
    vertical-align: middle;
}

.blackBtn1:hover{
   background: #f53f29;
   color: white;
   
}

.blackBtn2:hover{
   background: #E7E3E3;
   color: #262A2D;
}


body{ 
   margin: 0px;
   overflow-x:hidden;   /*스크롤 가로  잠금*/   
}

.menubarImg{
   height:500px;
   width:1100px;
   border:none;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

.saveIDLabel{
	font-weight:550;
	font-size:8px;
}


#userPwd:focus{
	outline: 2px solid #2478FF;
}

#userId:focus{
	outline: 2px solid #2478FF;

}


</style>

</head>

<body>

<div id= outerDiv>
   <div id= "menuBar" >
         <div class ="menu logoImg">KH정보교육원사진</div>
         <div class= "menu introMenu">소개</div>
         <div class= "menu boardMenu" onclick = "showBoardDiv();">게시판</div>
         <div class= "menu shareMenu">공유자료</div>
         <div class= "menu elbumMenu">앨범</div>
         <div class= "menu tastyMenu">맛집</div>
         <div class= "menu mypageMenu" onclick = "showMypageDiv();">마이페이지</div>
         <div class= "menu teacherMenu" onclick = "showTeacherDiv();">강사페이지</div>
         <div class= "menu memberMenu">
            <span class= "iconSpan icon1"><i class="fa fa-comments" aria-hidden="true"></i></span>&nbsp;
            <span class= "iconSpan icon2"><i class="fa fa-sign-in" aria-hidden="true"></i></span>&nbsp;
            <span id= "loginIcon" class= "iconSpan icon3" onclick= "loginDivShow();"><i class="fa fa-user" aria-hidden="true" ></i></span>
         </div>
    </div>   
      
      
   <!-- 게시판 서브메뉴 div -->
    <div id= "boardDiv" class="subMenu" data-value = "0">
       <div class= textArea>
          <p><span>공지사항</span></p>
          <p><span>자유게시판</span></p>
          <p><span>사진게시판</span></p>
       </div>
       <div class= imgArea>
             <img src="../../images/helloquence-5fNmWej4tAA-unsplash.jpg" class= "menubarImg">
       </div>
    </div>
   
   <!-- 마이페이지 서브메뉴 div -->   
   <div id= "mypageDiv" class="subMenu" data-value = "0">
       <div class= textArea>
          <p style="width:130px;"><span style="width:130px;">내 정보수정<span></p>
          <p style="width:130px;"><span style="width:130px;" >일정 및 휴가관리<span></p>
       </div>
       <div class= imgArea>
          <img src="../../images/damian.jpg" class= "menubarImg">
       </div>
    </div>
   
   
   <!-- 강사페이지 서브메뉴 div -->   
   <div id= "teacherDiv" class="subMenu" data-value = "0">
       <div class= textArea>
          <p>가입승인</p>
          <p>학생관리</p>
          <p>자리배치</p>
       </div>
       <div class= imgArea>
          <img src="../../images/teacherPage.jpg" class= "menubarImg">
       </div>
    </div>
    
    <div id= "loginDiv" class="loginDiv" data-value = "0">
      <div class=loginArea>
         <div>
            <br><br>
            <span>회원이시면 로그인해주세요</span><br><br>
            <span>ID:</span><input type="text" name = "userId" id = "userId"  placeholder="Enter UserId"><br>
            <span>PW:</span><input type="text"  name = "userPwd" id = "userPwd" placeholder="Enter Password"><br> 
            
            <input type = "checkbox" name = "saveID" id = "saveId"><label for = "saveId">아이디 저장하기</label><br><br>
            
            <button class = " blackBtn blackBtn1" type = "submit" onclick = "login();" type="button">로그인</button><br><br>
            <button class = "blackBtn blackBtn2" loginBtn" type = "submit" onclick = "login();" type="button">아이디 찾기</button>
         </div>
      </div>
      <div class=joinArea>
         <div>
            <span>비회원이시면 가입해주세요</span>
         </div>
      </div>
   </div>
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
	<%--  		<p style="width:130px;"	onclick = "location.href='<%=request.getContextPath()%>/mypage.me?userId=<%=loginUser.getUserId() %>'"><span style="width:130px;">내 정보수정<span></p>
	 		<p style="width:130px;" onclick= "location.href = '<%=request.getContextPath()%>/views/studentPage/stdCalendar.jsp'"><span style="width:130px;" >일정 및 휴가관리<span></p> --%>
<%-- 	 		<p style="width:130px;"	onclick = "location.href='<%=request.getContextPath()%>/mypage.me?userId=<%=loginUser.getUserId() %>'">내 정보수정</p>
	 		<p style="width:130px;" onclick= "location.href = '<%=request.getContextPath()%>/views/studentPage/stdCalendar.jsp'">일정 및 휴가관리</p> --%>
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
				<button class = "blackBtn blackBtn2" onclick = "location.href='<%=request.getContextPath()%>/mypage.me?userId=<%=loginUser.getUserId() %>'">내 정보수정 </button><br><br><br>
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


// 각각 자기 자신의 sub메뉴를 제외하고 다른 것을 눌렀을때 서브메뉴가 올라가는 메소드
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

  
// 각각의 div 토글
   function showBoardDiv(){
      if($('#boardDiv').data("value") == "0"){
         $('.boardMenu').addClass("hoverStay"); 
         $('.boardMenu').addClass("boardDown");
         $('#boardDiv').addClass("boardDown");
         $('#boardDiv').children().addClass("boardDown");    
         $('#boardDiv').children().children().addClass("boardDown");             
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
         

//공지사항 바로가기 
function goNBoard(){
		location.href="<%=request.getContextPath()%>/Nlist.bo";	
   function showMypageDiv(){
       if($('#mypageDiv').data("value") == "0"){
            $('.mypageMenu').addClass("hoverStay"); 
            $('.mypageMenu').addClass("mypageDown");
            $('#mypageDiv').addClass("mypageDown");
            $('#mypageDiv').children().addClass("mypageDown");    
            $('#mypageDiv').children().children().addClass("mypageDown");             
            $("#mypageDiv").slideDown(); 
            $("#mypageDiv").data("value", "1");
            $("#blackOpacity2").fadeIn("fast");
         }else{
            $("#mypageDiv").slideUp();  
            $("#TeacherDiv").data("value", "0");
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
   
}
#getName{
	text-align : center;
}
#userId, #userPwd{
	width: 100%;
	height : 35px;
}
.headerbtn1 {
	border: none;
	color: white;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
	display : inline-block;
	width: 100%;
}


.loginBtn, .memberJoinBtn, .myPageBtn, .logoutBtn {
	background-color: #4CAF50;
}
.loginBtn:hover, .memberJoinBtn:hover, .myPageBtn:hover, .logoutBtn:hover{
	background-color: #46a049;
}

.blackBtn{
	background-color :#2196F3;
}
.blackBtn:hover{
	background-color: #0b7dda;
}




//로그아웃 
function logout(){
	location.href = '<%= request.getContextPath() %>/logout.me';
	
	
}


</head>
<div id= "header">
<div class= navbar1>
   <img src ="<%=request.getContextPath() %>/images/khGroupware3.png" onclick= "location.href = '<%=request.getContextPath()%>/views/common/mainHome.jsp'"style=height:50px;cursor:pointer;margin-right:20px;margin-left:20px;padding:0px;>
   <button class= navBtn1 id="navBtn1" data-value="0" onclick="showSubnav1();">소개</button>
   <button class= navBtn1 id="navBtn2" data-value="0" onclick="showSubnav2();">게시판</button>
   <button class= navBtn1 id="navBtn4" data-value="0" onclick="showSubnav4();">마이페이지</button>
   <button class= navBtn1 id="teacherPage" data-value="0" onclick="showSubnav5();">강사페이지</button>
   	<%if(loginUser != null){ %>
   <button class= navBtn1 id="navBtn3" data-value="0" onclick="showSubnav3();">맛집</button>
    <%} %>
   <button class="navBtn1" id= myPageBtn data-value = "0" onclick= "showLoginDiv();"><img src ="<%=request.getContextPath() %>/images/icon/myPage.png" style= width:30px; id=myPageBtnImg></button>
   <button class="navBtn1" id= searchBtn data-value = "0" onclick= "showSearchBar();"><img src ="<%=request.getContextPath() %>/images/icon/readingGlasses.png" style= width:30px; id=serachBtnImg></button>
   <button class="navBtn1" id= chattingBtn data-value = "0" onclick= "showChattingPOPUP();"><img src ="<%=request.getContextPath() %>/images/icon/speechBubble.png" style= width:30px; id=chattingBtnImg></button>
</div>
   <div class= blackOpacity id= blackOpacity1></div>
   <div class= blackOpacity id= blackOpacity2></div>
   
   
   <div class = "subNavbar1" id="boardMenu1">
      <div class= "menuList boardMenu">
         <h3 style=margin:20px;> 소개 </h3>
         <ul>
            <li onclick= "goInfo();"> 소개글 </li>
         </ul>
      </div>
      <div class = "btnImg">
      	<img src="../../images/jessy-smith-zFOm6KzA-7g-unsplash.jpg" style=height:500px; class= "boardMenu">
      </div>
   </div>
   

   <div class = "subNavbar1" id="boardMenu2">
      <div class= "menuList boardMenu">
         <h3 style=margin:20px;>게시판</h3>
         <ul>
         	<input id= userNo type= hidden value= <%=userNo%>> 
            <li onclick= "goNBoard();"> 공지사항 </li>
            <li onclick = "goShareFile();"> 공유자료 </li>
            <li > 퀴즈 </li>
            <li onclick = "goFBoard();"> 자유게시판 </li>
            <li onclick = "goThumbnail();"> 사진게시판 </li>
         </ul>
      </div>
      <div class = "btnImg">
      	<img src="../../images/back_laptop2.jpg" style=height:500px; class= "boardMenu">
      </div>
   </div>

   <div class = "subNavbar1" id="boardMenu3">
      <div class= "menuList boardMenu">
         <h3 style=margin:20px;>커뮤니티</h3>
         <ul>
            <li id="ahn" onclick="location.href = '<%=request.getContextPath()%>/views/map2/mapForm.jsp'"> 근처맛집 </li> 
         </ul>
      </div>
      <div class = "btnImg">
      	<img src="../../images/john-schnobrich-2FPjlAyMQTA-unsplash.jpg" style=height:500px; class= "boardMenu">
      </div>
   </div>
   

   <div class = "subNavbar1" id="boardMenu4">
      <div class= "menuList boardMenu">
         <h3 style=margin:20px;>마이페이지</h3>
         <ul>
            <li> 내정보수정 </li>
            <li onclick= "location.href = '<%=request.getContextPath()%>/views/studentPage/stdCalendar.jsp'"> 일정 및 휴가관리 </li>
         </ul>
      </div>
      <div class = "btnImg">
      	<img src="../../images/helloquence-5fNmWej4tAA-unsplash.jpg" style=height:500px; class= "boardMenu">
      </div>
   </div>
   
   
   <div class = "subNavbar1" id="boardMenu5">
      <div class= "menuList boardMenu">
         <h3 style=margin:20px;>강사페이지</h3>
         <ul>
           <li onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/approvalJoin.jsp'"> 가입승인 </li>
            <li onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/managementStd.jsp'"> 학생관리 </li>
            <li onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/seatView.jsp'"> 자리배치 </li>
         </ul>
      </div>
      <div class = "btnImg">
      	<img src="../../images/damian.jpg" style=height:500px; class= "boardMenu">
      </div>
   </div>
   
   
   <!-- 검색 아이콘 누르면 나오는 메뉴 -->
   <form class="example" action="/action_page.php">
   		<div  id ="searchBar"> 
		  <input type="text" placeholder="Search.." name="search">
		  <button type="submit"><i class="fa fa-search"></i></button>  
	   	</div>
	</form>

	
<!--  <div id ="searchBar">
      <div><h3>검색</h3><input type="text"><button> 확인</button></div> 
   </div> -->
   
   
<div class= loginDiv> 
	<div class= "login">
		<%if(loginUser == null) {%>								<!-- action = 누르면 이동할 경로 (LoginServlet의 같은이름 (별칭의미 login.me) -->
		<h3>회원이시면 로그인해주세요</h3>
		<form id = "loginForm" action ="<%=request.getContextPath()%>/login.me"
									onsubmit="return validate();" method = "post">
		
					<label>UserId </label><br>
					<input type = "text" name = "userId" id = "userId"  placeholder="Enter UserId"><br>	
					<br>
					<label>Password  </label><br>
					<input type = "password" name = "userPwd" id = "userPwd" placeholder="Enter Password"><br>
					<br>
					<input type = "checkbox" name = "saveID" id = "saveId">&nbsp;
					<label for = "saveId">아이디 저장</label><br><br>
					
			<div class = "btns" align = "center">
				<button id = "loginBtn" class = "headerbtn1 loginBtn" type = "submit" onclick = "login();">로그인</button>
			</div>         
		</form>
		<br><br>
		<button id = "memberJoinBtn" class ="headerbtn1 memberJoinBtn" onclick = "memberJoin();">회원가입</button>
		<% } else {%>
		<!-- 로그인시 null값이 아닌경우 -->
			<div id = "userInfo" align = "center">
				
				<h3><label><%=loginUser.getUserName() %>님의 방문을 환영합니다.</label></h3><br><br>
				<div class ="btns" align="right">		<!--절대경로 : 프로젝트명(context root명) jspProject = request.getContextPath() / userId=loginUser.getUserId()  form태그의 get방식과 똑같다(url에 ?)  -->						
					<%-- <div id = "myPage" onclick = "location.href='<%=request.getContextPath()%>/mypage.me?userId=<%=loginUser.getUserId() %>'">정보수정</div> --%>	 <!-- mypage.me는 web-> web-INF-> classes-> MyPageServlet.class을 불러오는것임 -->
					<button id = "myPage" class = "btn myPageBtn" 
					onclick = "location.href='<%=request.getContextPath()%>/mypage.me?userId=<%=loginUser.getUserId() %>'">
					정보수정</button>
					
					<br><br>
					<!-- <div id = "logoutBtn" onclick = "logout();">로그아웃</div> -->
					<button id = "logoutBtn" class = "headerbtn1 logoutBtn" onclick = "logout();">로그아웃</button>
				</div>
			</div>
		</div>
		<%} %>
	
      
      <div class= "join">
      	<br><br><br>
      	<h3>비회원이시면 가입해주세요</h3>
    		<button class = "headerbtn1 blackBtn">회원가입하러 가기</button>
      </div> 
   </div> 
   
    
   
   
   <script>
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
		
		
		// 2. logout() 함수 작성하기 
		function logout(){
			location.href = '<%= request.getContextPath() %>/logout.me';
			
			// LogoutServlet 만들차례 
		}
		
		// 3. 회원가입용 함수 memberJoin() 함수 작성하기
		function memberJoin(){
			location.href="<%=request.getContextPath()%>/views/member/memberJoinForm.jsp";
			location.href ="<%=request.getContextPath()%>/cclass.me";
			// 연산처리나 DB에서 작업이 필요시에는 Servlet단을 거쳐서와야함 // 단순 페이지 이동은 가능
			
		}

		function login(){
			
			alert("ㅇㅇ");
			$("#loginBtn").submit;
		}
		
	</script>

</div>





<script>


	//상단 메뉴바 [소개] 클릭 이벤트 show
	function showSubnav1(){
	   removeSearchBar();
	   if($('#navBtn1').data("value") == "0"){
	      $('#navBtn1').addClass("hoverStay");
	      
	      $("#boardMenu1").children().addClass("stay");
	      $("#boardMenu1").children().children().addClass("stay");
	      $("#boardMenu1").children().children().children().addClass("stay");
	      
	       if($("#boardMenu1").css('display')=='none'){ 
	          $("#navBtn1").data("value", "1")
	         $("#blackOpacity1").fadeIn('fast');
	         $("#boardMenu1").slideDown();     
	      }
	   }else{
	      removeSubnav1();
	   }      
	}
	// 상단 메뉴바 [소개] 클릭 이벤트 close
	   function removeSubnav1(){
			
	      $("#navBtn1").data("value", "0")
	      if($("#boardMenu1").css('display') !='none'){
	         $("#boardMenu1").slideUp();
	          $("#blackOpacity1").fadeOut('fast');
	         $("#navBtn1").removeClass("hoverStay");
	         $("#boardMenu1").children().removeClass("stay");
	         $("#boardMenu1").children().children().removeClass("stay");
	         $("#boardMenu1").children().children().children().removeClass("stay");
	         
	      } 
	   }
   

   // 상단 메뉴바 [게시판] 클릭 이벤트 show
   function showSubnav2(){
      removeSearchBar();
      if($('#navBtn2').data("value") == "0"){
         $('#navBtn2').addClass("hoverStay");
         
         $("#boardMenu2").children().addClass("stay");
         $("#boardMenu2").children().children().addClass("stay");
         $("#boardMenu2").children().children().children().addClass("stay");
         
          if($("#boardMenu2").css('display')=='none'){ 
             $("#navBtn2").data("value", "1")
            $("#blackOpacity1").fadeIn('fast');
            $("#boardMenu2").slideDown();     
         }
      }else{
         removeSubnav2();
      }      
   }
   // 상단 메뉴바 [게시판] 클릭 이벤트 close
      function removeSubnav2(){
         $("#navBtn2").data("value", "0")
         if($("#boardMenu2").css('display') !='none'){
            $("#boardMenu2").slideUp();
             $("#blackOpacity1").fadeOut('fast');
            $("#navBtn2").removeClass("hoverStay");
            $("#boardMenu2").children().removeClass("stay");
            $("#boardMenu2").children().children().removeClass("stay");
            $("#boardMenu2").children().children().children().removeClass("stay");
            
         } 
      }

   
      // 상단 메뉴바 [커뮤니티] 클릭 이벤트 show
      function showSubnav3(){
         removeSearchBar();
         if($('#navBtn3').data("value") == "0"){
            $('#navBtn3').addClass("hoverStay");
            
            $("#boardMenu3").children().addClass("stay");
            $("#boardMenu3").children().children().addClass("stay");
            $("#boardMenu3").children().children().children().addClass("stay");
            
             if($("#boardMenu3").css('display')=='none'){ 
                $("#navBtn3").data("value", "1")
               $("#blackOpacity1").fadeIn('fast');
               $("#boardMenu3").slideDown();     
            }
         }else{
            removeSubnav3();
         }      
      }
      
      // 상단 메뉴바 [커뮤니티] 클릭 이벤트 close
         function removeSubnav3(){
            $("#navBtn3").data("value", "0")
            if($("#boardMenu3").css('display') !='none'){
               $("#boardMenu3").slideUp();
                $("#blackOpacity1").fadeOut('fast');
               $("#navBtn3").removeClass("hoverStay");
               $("#boardMenu3").children().removeClass("stay");
               $("#boardMenu3").children().children().removeClass("stay");
               $("#boardMenu3").children().children().children().removeClass("stay");
               
            } 
         }

         // 상단 메뉴바 [마이페이지] 클릭 이벤트 show
         function showSubnav4(){
            removeSearchBar();
            if($('#navBtn4').data("value") == "0"){
               $('#navBtn4').addClass("hoverStay");
               
               $("#boardMenu4").children().addClass("stay");
               $("#boardMenu4").children().children().addClass("stay");
               $("#boardMenu4").children().children().children().addClass("stay");
               
                if($("#boardMenu4").css('display')=='none'){ 
                   $("#navBtn4").data("value", "1")
                  $("#blackOpacity1").fadeIn('fast');
                  $("#boardMenu4").slideDown();     
               }
            }else{
               removeSubnav4();
            }      
         }
         // 상단 메뉴바 [마이페이지] 클릭 이벤트 close
            function removeSubnav4(){
               $("#navBtn4").data("value", "0")
               if($("#boardMenu4").css('display') !='none'){
                  $("#boardMenu4").slideUp();
                   $("#blackOpacity1").fadeOut('fast');
                  $("#navBtn4").removeClass("hoverStay");
                  $("#boardMenu4").children().removeClass("stay");
                  $("#boardMenu4").children().children().removeClass("stay");
                  $("#boardMenu4").children().children().children().removeClass("stay");
                  
               } 
            }
         
    	// 상단 메뉴바 [강사페이지] 클릭 이벤트 show
            function showSubnav5(){
               removeSearchBar();
               if($('#teacherPage').data("value") == "0"){
                  $('#teacherPage').addClass("hoverStay");
                  
                  $("#boardMenu5").children().addClass("stay");
                  $("#boardMenu5").children().children().addClass("stay");
                  $("#boardMenu5").children().children().children().addClass("stay");
                  
                   if($("#boardMenu5").css('display')=='none'){ 
                      $("#teacherPage").data("value", "1")
                     $("#blackOpacity1").fadeIn('fast');
                     $("#boardMenu5").slideDown();     
                  }
               }else{
                  removeSubnav5();
               }      
            }
            // 상단 메뉴바 [강사페이지] 클릭 이벤트 close
               function removeSubnav5(){
                  $("#teacherPage").data("value", "0")
                  if($("#boardMenu5").css('display') !='none'){
                     $("#boardMenu5").slideUp();
                      $("#blackOpacity1").fadeOut('fast');
                     $("#teacherPage").removeClass("hoverStay");
                     $("#boardMenu5").children().removeClass("stay");
                     $("#boardMenu5").children().children().removeClass("stay");
                     $("#boardMenu5").children().children().children().removeClass("stay");
                     
                  } 
               }      

      // 채팅 클릭시 이벤트
 /*      function showChattingPage() {
    	  location.href="../chatting/chatting.jsp";
	  } */
   
      
      // 돋보기 클릭시 이벤트

      function showSearchBar(){
         if($('#searchBtn').data("value") == "0"){  
            $('#searchBtn').addClass("hoverStay");
            $("#searchBar").children().addClass("stay");
            $("#searchBar").children().children().addClass("stay");
            $("#searchBar").children().children().children().addClass("stay");
            $("#searchBtn").data("value", "1");
             if($("#searchBar").css('display')=='none'){
                $("#blackOpacity1").fadeIn('fast');
                $("#searchBar").slideDown();
            }
         }else{
            removeSearchBar();   
         }
      }

      // 채팅 클릭시 이벤트
 /*      function showChattingPage() {
    	  location.href="../chatting/chatting.jsp";
	  } */
   
      
      // 돋보기 클릭시 이벤트

      function showSearchBar(){
         if($('#searchBtn').data("value") == "0"){  
            $('#searchBtn').addClass("hoverStay");
            $("#searchBar").children().addClass("stay");
            $("#searchBar").children().children().addClass("stay");
            $("#searchBar").children().children().children().addClass("stay");
            $("#searchBtn").data("value", "1");
             if($("#searchBar").css('display')=='none'){
                $("#blackOpacity1").fadeIn('fast');
                $("#searchBar").slideDown();
            }
         }else{
            removeSearchBar();   
         }
      }
















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



<body>

</body>
</html>