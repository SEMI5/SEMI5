<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
</head>

<style>

.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   height: 10%;
   background-color: gray;
   color: white;
   text-align: center;
}
</style>

<body>


<!-- header -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">KHGroupware</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">소개</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" onclick= "goNBoard();">공지사항</a></li>
          <li><a href="#" onclick = "goShareFile();">공유자료</a></li>
          <li><a href="#">퀴즈</a></li>
          <li><a href="#">자유게시판</a></li>
          <li><a href="#" onclick = "goThumbnail();">사진게시판</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">마이페이지 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">내정보수정</a></li>
          <li><a href="#">휴가관리</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">강사페이지 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/approvalJoin.jsp'">가입승인</a></li>
          <li><a href="#" onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/managementStd.jsp'">학생관리</a></li>
          <li><a href="#" onclick= "location.href = '<%=request.getContextPath()%>/views/teacherPage/seatView.jsp'">자리배치</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">맛집 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" onclick="location.href = '<%=request.getContextPath()%>/views/map2/mapForm.jsp'">근처맛집</a></li>
        </ul>
      </li>
      <!-- <li><a href="#">마이페이지</a></li>
      <li><a href="#">강사페이지</a></li>
      <li><a href="#">맛집</a></li> -->
    </ul>
    <ul class="nav navbar-nav navbar-right">
    
      <li><a href="#"><img src ="<%=request.getContextPath() %>/images/icon/speechBubble.png" style="width: 25px; "><span> Chatting</span></a></li>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>

</body>
</html>