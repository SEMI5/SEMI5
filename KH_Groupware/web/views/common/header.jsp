<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
<<<<<<< HEAD

	int userNo = 0; 
	if(loginUser != null){
		userNo = loginUser.getUserNo();
	} 
<<<<<<< HEAD

=======

=======
>>>>>>> refs/remotes/origin/master
>>>>>>> refs/remotes/origin/master
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 지워야함 쓰려면 메인홈에서 제이쿼리 적용해서 써야함. -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src = "../js/jquery-3.2.1.min.js" type = "text/javascript"></script> -->



<title>KH_Groupware</title>
<link rel="shortcut icon" type="image⁄x-icon" href="../../images/KH_favicon.ico">
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

body{
   margin: 0px;
   overflow-x:hidden;   
   
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

 }
.navBtn1{
    font-size: 15px;  
    outline: none;
    color: black;
    background-color: inherit; 	/*부모랑 같은 색 */
    margin-left: 20px;
    margin-right:20px;
    padding:auto;
    height: 70px;
    cursor: pointer;
    border : none;
    display: inline-block;
    text-align: center;
    vertical-align: middle;
}

.navBtn1:hover{
    color: darkgray;
    border-bottom: 3px solid black;
    transition-duration: 0.3s; 
}

img {
   vertical-align: middle;
   border:none;
}
.subNavbar1{
   border: 1px solid lightgray;
   width:100%;
   height: 500px;
   display:none;
   position:absolute; 
   background: white;
   left:0px;
   z-index:10;
}
#searchBar{
   border: 1px solid lightgray;
   width:100%;
   height: 200px;
   display:none;
   position:absolute;
   z-index:10;
   background:white;
   left:0px;

}

.menuList{
   border: none;
   padding: 40px;
   display: inline-block;
   
}

li{
   margin:30px;
    list-style-type : none 
}

li:hover{
   color: darkgray;
   cursor: pointer;
}
 
.btnImg{
   border: none;
   display: inline-block;
   float:right;
   margin:0px; 
   padding:0px;
}
 
.hoverStay{
   border-bottom: 10px solid black;
   transition-duration: 0.3s;
}

.hoverStay:hover{
   border-bottom: 10px solid black;
   transition-duration: 0.3s;
}


#searchBtn {
   float:right;
}
#myPageBtn {
   float: right;
}



.blackOpacity{
   background:black;
   position:absolute;
   width:100%;
   height:880px;
   opacity: 0.8;
   display:none;
   left:0px;
   right:0px;
   z-index:7;

}

.loginDiv{
   background: white; 
   width: 500px; 
   height: 90%; 
   color: black; 
   text-align: center; 
   margin: 0px;
   border: 1px solid lightgray;
   position:absolute; right:-610px;
   z-index:10;
   display:none;
}

.login{
	border:none;
	height: 400px;
	width: 100%;
	text-align: left; 
	padding: 70px;
}

.join{
	border:none; 
	border-top: 1px solid lightgray;
	height:320px;
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

.blackBtn:hover{

	background-color: darkgray;
}

/* 검색창 css */
* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}



h3{
	text-align : center;
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







</style>

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
				<button id = "loginBtn" class = "headerbtn1 loginBtn" type ="submit">로그인</button>
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
      function showChattingPOPUP() {
		  window.open("../chatting/chattingPopup.jsp", "", "width=400, height=600, left=100, top=50");
	  }
      
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

      function removeSearchBar(){
         
            $("#searchBtn").data("value", "0") 
            if($("#searchBar").css('display') !='none'){
               $("#searchBar").slideUp();
                $("#blackOpacity1").fadeOut('fast');
               $("#searchBtn").removeClass("hoverStay");
               $("#searchBar").children().removeClass("stay");
               $("#searchBar").children().children().removeClass("stay");
               $("#searchBar").children().children().children().removeClass("stay");
            } 
         
      }
      
      //로그인 div 생성 
      function showLoginDiv(){
            removeSubnav2();
            removeSearchBar();
            
            if($('#myPageBtn').data("value") == "0"){
               $('#myPageBtn').addClass("hoverStay");      
               
               $(".loginDiv").css("display","block")
               
               $(".loginDiv").children().addClass("stay");
               $(".loginDiv").children().children().addClass("stay");
               $(".loginDiv").children().children().children().addClass("stay");
          
               $("#blackOpacity2").fadeIn('2000');
               $(".loginDiv").animate({"right":"0px"},'2000',function(){
                  $("#myPageBtn").data("value","1");
               }); 
            }else{
               removeLoginDiv();
            }
         } 
   
      //로그인 div 제거 
      function removeLoginDiv(){
    	  $(".loginDiv").css("display","none")
         $("#blackOpacity2").fadeOut('2000');
         $(".loginDiv").animate({"right":"-605px"},'2000',function(){
            $("#myPageBtn").data("value","0");
         });
         $("#myPageBtn").removeClass("hoverStay")
          $(".loginDiv").children().removeClass("stay");
          $(".loginDiv").children().children().removeClass("stay");
          $(".loginDiv").children().children().children().removeClass("stay");
      }
         
            
          
       
      // 서브 메뉴바를 제외하고 다른 것을 클릭 시 이벤트 -> 서브메뉴바 올라감.
       $(document).click(function(e){
            if($("#navBtn2").data("value") == "1"){   // 서브 메뉴바 게시판이 내려와있을 때, 
                  if (!$(e.target).is('#boardMenu') && !$(e.target).is('#navBtn2') && !$(e.target).is('.stay')) { //이벤트타겟이 서브메뉴바 이외의 것이라면, 
                        $(".hoverStay").data("value", "0")
                     if($("#boardMenu").css('display') !='none'){
                        $("#boardMenu").slideUp();
                        if($("#blackOpacity1").css('display') !='none'){
                           if(!$(e.target).is('#searchBtn') && 
                              !$(e.target).is('#serachBtnImg') && !$(e.target).is('#navBtn2') && 
                              !$(e.target).is("#myPageBtn") &&!$(e.target).is("#myPageBtnImg")){
                              
                              $(".blackOpacity").fadeOut('fast');
                           }
                           
                           $("#navBtn2").removeClass("hoverStay");
                        }
                     }  
                    }
               
            }
             
            // 돋보기바 제외하고 다른 것을 클릭시 이벤트 
             if($("#searchBtn").data("value") == "1"){ // 돋보기바가 내려와 있을 때,
               if(!$(e.target).is('#searchBar') && !$(e.target).is('.stay') && !$(e.target).is('#searchBtn') && !$(e.target).is('#serachBtnImg')){ //이벤트타겟이 돋보기바 이외의 것이라면, 
                  $("#searchBtn").data("value", "0") 
                  if($("#searchBar").css('display') !='none'){
                     $("#searchBar").slideUp();
                     if(!$(e.target).is('#navBtn2')&&
                        !$(e.target).is("#myPageBtn") &&!$(e.target).is("#myPageBtnImg")){
                        $("#blackOpacity1").fadeOut('fast');
                     }
                      $("#searchBtn").removeClass("hoverStay");
                  } 
               }    
            } 
            
            // 로그인div 외에 다른거 클릭시 이벤트 
              if($("#myPageBtn").data("value") == "1"){
               if(!$(e.target).is('#myPageBtn') && !$(e.target).is('.loginDiv') && !$(e.target).is('#myPageBtnImg') && !$(e.target).is('.stay')){  
                  removeLoginDiv();   
                
                   }   
             } 
      }); 
   	
     // 소개글 이동
     	function goInfo(){
    	 location.href="infoPage.jsp"
    	 
     }
<<<<<<< HEAD
     // 소개글 이동
     	function goInfo(){
    	 location.href="infoPage.jsp"
    	 
     }
=======
>>>>>>> refs/remotes/origin/master
      
      
<<<<<<< HEAD
      
   	// 사진게시판 작업 시작 (게시판 관련 작업이 끝나면)
=======
>>>>>>> refs/remotes/origin/master
   	// 사진게시판 작업 시작 (게시판 관련 작업이 끝나면)
		function goThumbnail(){
			location.href="<%=request.getContextPath()%>/list.th";
		}
   	
   	// 공유자료 작업시작
   		function goShareFile(){
   			location.href="<%=request.getContextPath()%>/list.sh";
   	}
   	
   	
   	
   		function goNBoard(){
  			location.href="<%=request.getContextPath()%>/Nlist.bo";
   		}
   		
   		function goFBoard(){
   			
   			var userNo = $("#userNo").val()
   		
   			
   		  if( userNo == 0 ){
   				alert("로그인을 해야만 사용가능합니다.");
   			}else{
   				location.href="<%=request.getContextPath()%>/Flist.bo";	
   			}  
  			  
   		}
   	
</script>



<body>

</body>
</html>