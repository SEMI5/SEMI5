<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH_Groupware</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="../../images/KH_favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Text|Do+Hyeon|Sunflower:300&display=swap" rel="stylesheet">
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}


/* 슬라이드배너  */
/* Slideshow container */

.slideshow-container {
  /* max-width: 1000px; */
  max-width: 100%;
  position: relative;
  margin: auto; 
  margin-top:1px;
  /* z-index: 1; */
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}


@keyframes stack{
	0% { width: 0; color: rgba(255,255,255,0); }
	40% {color: rgba(255,255,255,1);}
	100% { width: 75%;}
}




.block{
       width: 130px;
       height : 130px;
       border : 1px solid black;
       color : white;
       margin-top : 30px;
       margin-left : 60px;
}

.area1{
      border-style : hidden;
      box-shadow : 5px 5px 3px 2px gray;
      cursor: pointer;
}
.area1:hover{
     opacity: 0.7;
}

.area2{
       border-style : hidden;
       box-shadow : 5px 5px 3px 2px gray;
        cursor: pointer;
}
.area2:hover{
     opacity: 0.7;
}
.area3{
       border-style : hidden;
       box-shadow : 5px 5px 3px 2px gray;
        cursor: pointer;
}
.area3:hover{
     opacity: 0.7;
}
.area4{
      border-style : hidden;
      box-shadow : 5px 5px 3px 2px gray; 
      cursor: pointer;
}
.area4:hover{
     opacity: 0.7;
}
.area5{
      border-style : hidden;
      box-shadow : 5px 5px 3px 2px gray;
      cursor: pointer;
}
.area5:hover{
     opacity: 0.7;
}
.area6{
      border-style : hidden;
      box-shadow : 5px 5px 3px 2px gray;
      cursor: pointer;
}
.area6:hover{
     opacity: 0.7;
}
.area7{
      border-style : hidden;
      box-shadow : 5px 5px 3px 2px gray;
      cursor: pointer;
}
.area7:hover{
     opacity: 0.7;
}    
.area8{
      border-style : hidden;
      box-shadow : 5px 5px 3px 2px gray;
      cursor: pointer;
}
.area8:hover{
     opacity: 0.7;
}    
.area9{
      border-style : hidden;
      box-shadow : 5px 5px 3px 2px gray;
      cursor: pointer;
}
.area9:hover{
     opacity: 0.7;
}    
.area10{
      border-style : hidden;
      box-shadow : 5px 5px 3px 2px gray;
      cursor: pointer;
}
.area10:hover{
     opacity: 0.7;
}    
    
            
.block-test2{
      display : inline-block;
}
           
           
           
           
           
           
#defaultOpen{
	margin-left : 35%;
}

/* #defaultClose{
	margin-left : 120px;
} */

.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 15%;
 
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content */
.tabcontent {
  color: white;
  display: none;
  padding: 50px;
  text-align: center;
  
}

#London {
	background-color: rgb(226,226,226);
}
#Paris {
	background-color: rgb(226,226,226);
}


h1{
	text-align: center;
}
            
</style>

</head>
<header>
	<%@ include file = "header.jsp" %>
</header>
<body>


<!-- 이미지 슬라이더 부분  -->

<!-- <br><br><br><br><br> -->
	<div class="slideshow-container">	
		<div class="mySlides fade">
		  <div class="numbertext">1 / 3</div>
		  <img src="../../images/main1.jpg" style="width:100%; height:350px;">
		</div>
	
		<div class="mySlides fade">
		  <div class="numbertext">2 / 3</div>
		  <img src="../../images/main2.jpg" style="width:100%; height:350px;">
		</div>
	
		<div class="mySlides fade">	
		  <div class="numbertext">3 / 3</div>
		  <img src="../../images/main3.jpg" style="width:100%; height:350px;">
		</div>
		
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
	</div>
	
	<div style="text-align:center">
		<span class="dot" onclick="currentSlide(1)"></span> 
		<span class="dot" onclick="currentSlide(2)"></span> 
		<span class="dot" onclick="currentSlide(3)"></span> 
	</div>
	
	
<script>

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

<br><br>
<hr>
<br>

<h1> 주요 서비스 </h1>
<button class="tablink" onclick="openCity('London', this, 'red')" id="defaultOpen"> 주요기능1 </button>
<button class="tablink" onclick="openCity('Paris', this, 'green')" id="defaultClose" > 주요기능2 </button>
	<br><br><br><br>
	<div id="London" class="tabcontent">
  	<div class = "block block-test2 area1"><img src="../../images/icon/iconmonstr-clipboard-1-240.png" style="width:100%">자유게시판</div>
    <div class = "block block-test2 area2" onclick = "goThumbnail();"><img src="../../images/icon/iconmonstr-picture-1-240.png" style="width:100%">사진게시판</a></div>
    <div class = "block block-test2 area3"><img src="../../images/icon/iconmonstr-note-37-240.png" style="width:100%">공유자료</div>
    <div class = "block block-test2 area4"><img src="../../images/icon/iconmonstr-speech-bubble-18-240.png" style="width:100%">채팅</div>
    <div class = "block block-test2 area5"><img src="../../images/icon/iconmonstr-eat-6-thin-240.png" style="width:100%">맛집</div>
</div>

<div id="Paris" class="tabcontent">
  	<div class = "block block-test2 area6"><img src="../../images/icon/iconmonstr-clipboard-5-240.png" style="width:100%">공지사항</div>
    <div class = "block block-test2 area7"><img src="../../images/icon/iconmonstr-user-30-240.png" style="width:100%">학생관리</div>
    <div class = "block block-test2 area8"><img src="../../images/icon/iconmonstr-window-11-240.png" style="width:100%">자리배치</div>
    <div class = "block block-test2 area9"><img src="../../images/icon/iconmonstr-clipboard-5-240.png" style="width:100%">휴가관리</div>
    <div class = "block block-test2 area10"><img src="../../images/icon/iconmonstr-clipboard-5-240.png" style="width:100%">퀴즈</div>
</div>



<script>
	function openCity(cityName,elmnt,color) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].style.backgroundColor = "";
	  }
	  document.getElementById(cityName).style.display = "block";
	  elmnt.style.backgroundColor = color;
	
	}
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
	
	
	
<%-- 	// gothumbnail 이동
	function gothumbnail(){
			alert('클릭');
			location.href="<%=request.getContextPath()%>/views/thumbnail/thumbnailListView.jsp";
			//ThumbanailListServlet 만들러가기
		} --%>
   	// 4. 사진게시판 작업 시작 (게시판 관련 작업이 끝나면)
	function goThumbnail(){
		location.href="<%=request.getContextPath()%>/list.th";
		//ThumbanailListServlet 만들러가기
	}
</script>




<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	
		
		
		
		
</body>

<footer>

<%-- <%@ include file = "footer.jsp" %> --%>
</footer>
</html>