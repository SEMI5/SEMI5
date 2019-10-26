<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container {
  border: 2px solid #ccc;
  background-color: #eee;
  border-radius: 5px;
  padding: 16px;
  margin: 16px 0
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  margin-right: 20px;
  border-radius: 50%;
}

.container span {
  font-size: 20px;
  margin-right: 15px;
}

@media (max-width: 500px) {
  .container {
      text-align: center;
  }
  .container img {
      margin: auto;
      float: none;
      display: block;
  }
}
</style>


</head>
<body>
	<%@ include file = "header.jsp" %>
<br><br>
<h2> 정보교육원 내에서 각 반별로 실제 활용할 수 있는 웹 사이트를 개KH 발한다 본 프로젝트는 강사 간 교육생 교육생 간 교육생의 기본적인 . 
	    그룹웨어 및 클라우드 서비스를 제공하는 것을 목표로 한다. </h2>




<br><br>
<h2> 5조 소개</h2>

<div class="container">
  <img src="../../images/bandmember.jpg" alt="Avatar" style="width:90px">
  <p><span>조 호 관</span> 조 장</p>
  <p> 공지사항 / 자유게시판 구현</p>
</div>

<div class="container">
  <img src="../../images/jb.jpg"" alt="Avatar" style="width:130px; height:130px;"><br>
  <p><span>이 준 배 </span> 조 원 </p>
  <p> 사진 게시판 / 자료실 구현 </p>
</div>

<div class="container">
  <img src="../../images/bandmember.jpg"" alt="Avatar" style="width:90px">
  <p><span>강 현 모</span> 조 원</p>
  <p> 회원가입 / 로그인 / 가입승인 / 학생관리 / 자리배치 구현 </p>
</div>

<div class="container">
  <img src="../../images/bandmember.jpg"" alt="Avatar" style="width:90px">
  <p><span>안 상 재</span> 조 원</p>
  <p> 맛집 / 채팅 구현 </p>
</div>
</body>
</html>