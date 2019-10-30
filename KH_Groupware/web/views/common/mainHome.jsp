<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--    <%
    ArrayList blist = (ArrayList)request.getAttribute("blist");
	ArrayList flist = (ArrayList)request.getAttribute("flist");
	System.out.print("view blist : " + blist);
	System.out.print("view flist : " + flist);
		
	
	ArrayList<Thumbnail> list = (ArrayList<Thumbnail>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	%> --%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta name="description" content="contact form example">
<title>KH_Groupware</title>

<link rel="shortcut icon" type="image⁄x-icon" href="../../images/KH_favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">




<style>
	
::-webkit-scrollbar{
	display:none; 
}
-ms-overflow-style:none;


* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}


/* 슬라이드배너  */
/* Slideshow container */




.slideshow-container {
   max-width: 2000px;
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
/* 메인슬라이더 끝 */

           
           
           
           
           
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
      
.previewBoard1{
border: 1px solid black;
width: 400px;
height: 200px;
position: absolute;
right:0px;
}
.previewBoard2{
border: 1px solid black;
width: 400px;
height: 200px;
position: absolute;
left:0px;
}      
      
.mainOuter{
border: 1px solid green;
width:100%;
height:600px;
display:inline-block;
align: center;
text-align: center;

}

.mainOuter > div{
display:inline-block;
width: 1500px;
height: 600px;
}
         
.mainOuter>div{
position: relative;
display: inline-block;
}

.mainOuter>div .tableDiv{

}

.tableDiv{
position: absolute; 
right: 0px;
width: 830px;
height: 210px;
top: 0px;
border: 1px solid blue;
	
}


iframe{
position: absolute;
left: 0px;
bottom: 0px;
}
          
          
          
.callendarDiv{
	width: 830px;
	border: 1px solid orange;
	height: 370px;
	position: absolute; 
	bottom: 0px;
	right: 0px;
} 
       
.previewThumb{
 absolute: 0px; 
 border: 1px solid purple; 
 height: 200px; 
 width: 600px;
 left: 0px;
} 

/* .w3-table tr:hover{
	background : white;
	color : black;
} */


#saveId {
    position: absolute;
    top: 170px;
    left: 174px;
    margin: 0px;
    padding: 0px;
}


.circle{
	position: absolute; 
	z-index: 1;
	left: 12%;
	bottom: 30%;
	height: 100px;
	text-align: center; 
	vertical-align: middle;
 	width: 100px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    background: #fcfaf1;
    font-weight: bold;
    padding-top: 12px;
}

.circle:hover{
	cursor:pointer;
	background: darkgray;
	color: white;
	transition-duration: 0.5s;
}

body{
	background: #fcfaf1;

}

.teacherInfo{

	cusrsor: pointer;
}

</style>

</head>
<body class="w3-content" style="max-width:2000px;">
<%@ include file = "header.jsp" %>

<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->
	
		<!-- 이미지 슬라이더 부분  -->
		<div style="height:40px;width:100%"></div>
			<div class="slideshow-container">	
				<div class="mySlides fade">
				  <div class="numbertext">1 / 3</div>
				  <div class= "circle" onclick="location.href='infoPage.jsp'"><br>click here!</div>
				  <img src="../../images/mainBack5.jpg" style="width:100%; height:800px; ">
				</div>
				<div class="mySlides fade">
				  <div class="numbertext">2 / 3</div>
				  <img src="../../images/mainBack4.jpg" style="width:100%; height:800px;">
				</div>
				<div class="mySlides fade">	
				  <div class="numbertext">3 / 3</div>
				  <img src="../../images/mainBack2.jpg" style="width:100%; height:800px;">
				</div>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<div style="text-align:center; background:#fcfaf1; padding-top: 10px; margin-bottom:10px;">
				<span class="dot" onclick="currentSlide(1)"></span> 
				<span class="dot" onclick="currentSlide(2)"></span> 
				<span class="dot" onclick="currentSlide(3)"></span> 
			</div>
<!-- 메인 슬라이더  css  -->
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

<br>
<!-- First Grid: Logo & About -->
<div class="w3-row">
  <div class="w3-half w3-black w3-container w3-center" style="height:600px">
    <div class="w3-padding-64">
      <h1>주요 기능</h1>
      <br>
      <a href="#" class="w3-button w3-black w3-block w3-hover-blue-grey w3-padding-16"> 공지사항 </a>
      <a href="#work" class="w3-button w3-black w3-block w3-hover-teal w3-padding-16"> 자유게시판 </a>
      <a href="#work" class="w3-button w3-black w3-block w3-hover-dark-grey w3-padding-16"> 사진게시판 </a>
      <a href="#" class="w3-button w3-black w3-block w3-hover-brown w3-padding-16">자료실</a>
      <a href="#" class="w3-button w3-black w3-block w3-hover-blue-grey w3-padding-16"> 맛집 </a>
      <a href="#" class="w3-button w3-black w3-block w3-hover-teal w3-padding-16"> 일정관리 & 휴가관리 </a>
      
    </div>
    <div class="w3-padding-64">
    </div>
  </div>
  <div class="w3-half w3-blue-grey w3-container" style="height:600px">
    <div id = "teacherInfoArea" class="w3-padding-64 w3-center" onclick = "goPage();" style = "cursor : pointer;">
      <h1>강사 소개</h1>
      <img src="../../images/austin.jpg" class="w3-margin w3-circle teacherInfo" alt="Person" style="width:50%; height : 310px; ">
      <div class="w3-left-align w3-padding-large">
        <p align = "center">IT업계 최고의 강사진을 소개합니다.<br>
      </div>
    </div>
  </div>
</div>

<script>
	function goPage(){
		 location.href="teacherInfoPage.jsp";
		}
</script>

<!-- Second Grid: Work & Resume -->
<div class="w3-row">
  <div class="w3-half w3-light-grey w3-center" style= "width : 100%; min-height:800px" id="work">
    <div class="w3-padding-64">
      <h2>교 육 시 설</h2>
      <p>최고의 교육 환경에서 IT인재를 양성합니다</p>
    </div>
    <div class="w3-row" >
    
      <div class="w3-half" id = "imgArea1"">
        <img src="../../images/104.jpg" style="width:100%; height:300px; padding : 5px;">
      </div>
      <div class="w3-half" id = "imgArea2">
        <img src="../../images/108.jpg" style="width:100%; height:300px; padding : 5px;">
      </div>
    </div>
    <div class="w3-row w3-hide-small">
      <div class="w3-half" id = "imgArea3">
        <img src="../../images/105.jpg" style="width:100%; height:300px; padding : 5px;">
      </div>
      <div class="w3-half" id = "imgArea4">
        <img src="../../images/122.jpg" style="width:100%; height:300px; padding : 5px;">
      </div>
    </div>

    <div class="w3-row w3-hide-small">
      <div class="w3-half" id = "imgArea5">
        <img src="../../images/128.jpg" style="width:100%; height:300px; padding : 5px;">
      </div>
      <div class="w3-half" id = "imgArea6">
        <img src="../../images/123.jpg" style="width:100%; height:300px; padding : 5px;">
      </div>
    </div><br>



<!-- Third Grid: Swing By & Contact -->
<div class="w3-row" id="contact">
  <div class="w3-half w3-dark-grey w3-container w3-center" style="height:600px; font-family : Verdana; font-size:1.4em">
    <div class="w3-padding-64" style= "padding-bottom: 0px";>
      <h1> 이거 사조 (5조)</h1>
      <p> 조 장 - 조 호 관 </p>
      <p> 조 원 - 강 현 모, 안 상 재, 이 준 배  </p>
      <p>+00 1515151515</p>
      <p>kh@kh.com</p>
    </div>
    <div class="w3-padding-64">
      
      
    </div>
  </div>
  
  
  <!-- 이메일 보내기  -->
 
 		  
  <div class="w3-half w3-teal w3-container" style="height:600px">
    <div class="w3-padding-64 w3-padding-large">
      <h1>Contact</h1>
      <p class="w3-opacity">GET IN TOUCH</p>
		<form class="gform w3-container w3-card w3-padding-32 w3-white" method="POST" data-email="hokwan927423@gmail.com"
 		  action="https://script.google.com/macros/s/AKfycbxMnCIbQNqL49LIUdqE85erR2lzc1SsyArIbqosOg/exec">        
        <div class="w3-section">
          <label>Name</label>
          <input class="w3-input" style="width:100%;" type="text" required name="name">
        </div>
        
        <div class="w3-section">
          <label>Email</label>
          <input class="w3-input" style="width:100%;" type="email" required name="email">
        </div>
        
        <div class="w3-section">
          <label>Message</label>
          <input class="w3-input" style="width:100%;" type="text" required name="message">
        </div>
         <input id="honeypot" type="hidden" name="honeypot" value="">
         <button type="submit" class="w3-button w3-teal w3-right">Send</button>
	        <div style="display:none" class="thankyou_message">
	         <h2><em>감사합니다.</em> 말씀해주신 의견 적극 검토해보겠습니다!
			 </h2>
			</div>
		 </form>
    </div>
  </div>
	
</div>

 <script data-cfasync="false" src="form-submission-handler.js"></script>
<script data-cfasync="false" type="text/javascript"
			src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>






























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
	
	

	
	
	
   	// 사진 게시판으로 이동
	function goThumbnail(){
		location.href="<%=request.getContextPath()%>/list.th";
	}
   	
   	// 자료실로 이동
   	function goShare(){
   		location.href="<%=request.getContextPath()%>/list.sh";
   	}
   	
</script>

<br><br><br><br><br><br><br><br><br><br><br>
	<div>
		<img src="<%=request.getContextPath() %>/images/suit.jpg" style="width:100%; height:100%;"> 
	</div>


		
	
	

</div><!-- container -->
   </div><!-- mainContent -->
			<%@ include file = "footer.jsp" %>
</body>

</html>