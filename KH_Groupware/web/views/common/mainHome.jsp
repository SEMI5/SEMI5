<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH_Groupware</title>

<link rel="shortcut icon" type="image⁄x-icon" href="../../images/KH_favicon.ico">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
        
/* 갤러리 */

/* 썸네일이미지를올려놓을갤러리스타일*/
#gallery_area {
	/* 	border: 1px solid black; /* 굵은테두리*/ */
		width: 100%; /* 너비*/
		height: 600px; /* 높이*/
		margin-left: auto; /* 여백자동*/
		margin-right: auto;
		overflow: visible; /* 오버플로일경우visible로*/
		background: white; /* 배경색*/
		/* -webkit-box-shadow: #272229 10px 10px 20px; */ /* 박스그림자*/
		/* -moz-box-shadow: #272229 10px 10px 20px;
		box-shadow: #272229 10px 10px 20px; */
}

/* 썸네일목록전체스타일*/
#gallery_area ul{
	margin-left: 140px; /* 갤러리가운데에콘텐츠가올수있도록*/
	margin-top : 20px;
	
}

/* 썸네일각항목에대한스타일*/
#gallery_area ul li {
		list-style:none; /* 불릿없앰*/
		display:inline-table; /* 테이블스타일로배치*/
		padding:10px;/* 안여백은각각10px로*/
}

/* 평소큰이미지.pic 에대한스타일*/
#gallery_area ul li .pic{
		-webkit-transition: all 0.6s ease-in-out; /* 웹킷브라우저에서트랜지션효과가나타나도록*/
		width:400px; /* 너비*/
		height:300px; /* 높이*/
		opacity:0; /* 페이드아웃효과*/
		visibility:hidden; /* 처음에는보이지않게*/
		position:absolute; /* 고정위치*/
		margin-top:10px; /* 상단여백*/
		margin-left:-20px; /* 왼쪽으로20픽셀이동해서*/
		border:1px solid black; /* 검은색테두리그림*/
		-webkit-box-shadow:#272229 2px 2px 10px; /* 박스그림자*/
		-moz-box-shadow:#272229 2px 2px 10px; /* 박스그림자*/
		box-shadow:#272229 2px 2px 10px; /* 박스그림자*/
}

/*마우스 오버 효과주기*/
#gallery_area ul li .small:hover{
		cursor:pointer;
}

/* 썸네일이미지위로마우스오버했을때큰이미지의스타일* */
#gallery_area ul li:hover .pic {
		width:400px; /* 너비*/
		height:300px; /* 높이*/
		opacity:1; /* 불투명하게*/
		visibility:visible; /* 화면에보임*/
		float:right; /* 오른쪽으로플로팅*/
}

#gallery_textarea{
	font-size : 2.5em;
	margin-left : 195px;
}

  
.outerblockarea{
	width : 100%;
	height : 600px;
	background : yellow;
}  
.blockarea{
     display : inline-block;
     float : right;
}

.plusBtn:hover{
     opacity: 0.8;
     cursor : pointer;
}  
  








/* 타임라인 */
/* The actual timeline (the vertical ruler) */
.timeline {
  position: relative;
  max-width: 800px;
  height : 700px;
  margin: 30 auto;
}

/* The actual timeline (the vertical ruler) */
.timeline::after {
  content: '';
  position: absolute;
  width: 6px;
  background-color: white;
  top: 0;
  bottom: 0;
  left: 50%;
  margin-left: -3px;
  height : 600px;
}

/* Container around content */
.container {
  padding: 10px 40px;
  position: relative;
  background-color: inherit;
  width: 50%;
}

/* The circles on the timeline */
.container::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;	
  right: -17px;
  background-color: white;
  border: 4px solid #C94F44;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

/* Place the container to the left */
.left {
  left: 0;
}

/* Place the container to the right */
.right {
  left: 50%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  right: 30px;
  border: medium solid white;
  border-width: 10px 0 10px 10px;
  border-color: transparent transparent transparent white;
}

/* Add arrows to the right container (pointing left) */
.right::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
  left: -16px;
}

/* The actual content */
.contentmonth {
  padding: 20px 30px;
  background-color: white;
  position: relative;
  border-radius: 6px;
}
.contentmonth:hover {
  opacity: 0.8;
   cursor : pointer;
}



/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .timeline::after {
  left: 31px;
  }
  
  /* Full-width containers */
  .container {
  width: 100%;
  padding-left: 70px;
  padding-right: 25px;
  }
  
  /* Make sure that all arrows are pointing leftwards */
  .container::before {
  left: 60px;
  border: medium solid white;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
  }

  /* Make sure all circles are at the same spot */
  .left::after, .right::after {
  left: 15px;
  }
  
  /* Make all right containers behave like the left ones */
  .right {
  left: 0%;
}  


</style>

</head>
<header>
	
</header>
<body>
		<%@ include file = "header.jsp" %>
<!-- 이미지 슬라이더 부분  -->

<div style="height:46px;width:100%"></div>
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
    <div class = "block block-test2 area3"  onclick = "goShare();"><img src="../../images/icon/iconmonstr-note-37-240.png" style="width:100%">공유자료</div>
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

<div class= "mainOuter">
	<div style="border: 1px solid red">
		
		<div class=previewThumb></div>
		<iframe width="600px" height="337px" src="https://www.youtube.com/embed/LGJe_ZchraY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<div class= tableDiv >
		<table class="previewBoard1"> 
			<tr>
				<td>공지사항</td>
				<td>더보기</td>
			</tr> 
			<tr>
			<td>공지사항 어쩌구 안내 사항1</td>
			<td>날짜 들어갈자림 </td>
			</tr>
			<tr>
			<td>공지사항 어쩌구 안내 사항2</td>
			<td>날짜 들어갈자림 </td>
			</tr>
			<tr>
			<td>공지사항 어쩌구 안내 사항3</td>
			<td>날짜 들어갈자림 </td>
			</tr>
		</table>
		<table class="previewBoard2"> 
			<tr>
				<td>공지사항</td>
				<td>더보기</td>
			</tr> 
			<tr>
			<td>공지사항 어쩌구 안내 사항1</td>
			<td>날짜 들어갈자림 </td>
			</tr>
			<tr>
			<td>공지사항 어쩌구 안내 사항2</td>
			<td>날짜 들어갈자림 </td>
			</tr>
			<tr>
			<td>공지사항 어쩌구 안내 사항3</td>
			<td>날짜 들어갈자림 </td>
			</tr>
		</table>
		</div>
		
		<div class= callendarDiv> 
			callendar		
		</div>
	</div>
	<br><br><br><br>
</div>



</body>

	
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
<br><br><br><br><br><br>
<div class = "outerblockarea">
	<!-- <div class = "blockarea" style="width : 49%; height:600px; background : blue; margin-left : 14px;" > 첫 번째 영역 </div> -->
		<div class = "blockarea" style="width : 50%; height:600px; background : #dfdfdf;">
			<div class = "timeArea" style="width : 80%; height:500px; margin-left : 20px; ">
				<p class = "plusBtn" style = "font-size : 25px; color : black;"> 학 사 일 정 <span style = "float : right;"><i class="fa fa-plus" aria-hidden="true"></i></span></p>
				<hr style = "border : 2px solid white;">
					<div class="timeline">
					  <div class="container left">
					    <div class="contentmonth">
					      <h3>2019.07.03</h3>
					      <p> 프로그래밍 언어활용  </p>
					    </div>
					  </div>
					 
					  <div class="container right">
					    <div class="contentmonth">
					      <h3>2019.07.17</h3>
					      <p>요구사항 확인 </p>
					    </div>
					  </div>
					  
					   <div class="container left">
					    <div class="contentmonth">
					      <h3>2019.07.24</h3>
					      <p>자바기반<br> 애플리케이션 개발 </p>
					    </div>
					  </div>
					  
					  
					</div>  
			</div>
		</div>
		
			<div class = "blockarea" style="width : 50%; height:600px; background : #ededed;">
			<div class = "timeArea" style="width : 80%; height:500px; margin-left : 20px; ">
				<p class = "plusBtn" style = "font-size : 25px; color : black;"> 공 지 사 항<span style = "float : right;"><i class="fa fa-plus" aria-hidden="true"></i></span></p>
				<hr style = "border : 2px solid white;">
				
				
				
				
			</div>
	</div>
	
	
	
</div>
<br>

<!-- <h1> 주요 서비스 </h1>
<button class="tablink" onclick="openCity('London', this, 'red')" id="defaultOpen"> 주요기능1 </button>
<button class="tablink" onclick="openCity('Paris', this, 'green')" id="defaultClose" > 주요기능2 </button>
	<br><br><br><br>
	<div id="London" class="tabcontent">
  	<div class = "block block-test2 area1"><img src="../../images/icon/iconmonstr-clipboard-1-240.png" style="width:100%">자유게시판</div>
    <div class = "block block-test2 area2" onclick = "goThumbnail();"><img src="../../images/icon/iconmonstr-picture-1-240.png" style="width:100%">사진게시판</a></div>
    <div class = "block block-test2 area3"  onclick = "goShare();"><img src="../../images/icon/iconmonstr-note-37-240.png" style="width:100%">공유자료</div>
    <div class = "block block-test2 area4"><img src="../../images/icon/iconmonstr-speech-bubble-18-240.png" style="width:100%">채팅</div>
    <div class = "block block-test2 area5"><img src="../../images/icon/iconmonstr-eat-6-thin-240.png" style="width:100%">맛집</div>
</div>







<br><br><br><br>
<hr> -->


































<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<p id = "gallery_textarea" ><span>g a l l e r y</span></p>
  <div id="gallery_area">
	  <ul>
		  <li> <img src="<%=request.getContextPath() %>/images/austin.jpg" class="small" width="270" height="200"> <img src="<%=request.getContextPath() %>/images/austin.jpg" class="pic"> 
		  </li>
		   <li> <img src="<%=request.getContextPath() %>/images/dose.jpg" class="small" width="270" height="200"> <img src="<%=request.getContextPath() %>/images/dose.jpg" class="pic">
		  </li>
		   <li> <img src="<%=request.getContextPath() %>/images/estee.jpg" class="small" width="270" height="200"> <img src="<%=request.getContextPath() %>/images/estee.jpg" class="pic">
		  </li>
		  <li> <img src="<%=request.getContextPath() %>/images/josh.jpg" class="small" width="270" height="200"> <img src="<%=request.getContextPath() %>/images/josh.jpg" class="pic">
		  </li>
		   <li> <img src="<%=request.getContextPath() %>/images/melinda.jpg" class="small" width="270" height="200"> <img src="<%=request.getContextPath() %>/images/melinda.jpg" class="pic">
		  </li>
		   <li> <img src="<%=request.getContextPath() %>/images/stil.jpg" class="small" width="270" height="200"> <img src="<%=request.getContextPath() %>/images/stil.jpg" class="pic"> 
		  </li>
		  <li> <img src="<%=request.getContextPath() %>/images/priscilla.jpg" class="small" width="270" height="200"> <img src="<%=request.getContextPath() %>/images/priscilla.jpg" class="pic"> 
		  </li>
		  <li> <img src="<%=request.getContextPath() %>/images/tyle.jpg" class="small" width="270" height="200"> <img src="<%=request.getContextPath() %>/images/tyle.jpg" class="pic"> 
		  </li>
	  </ul>
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
	
	

	
	
	

   	// 사진 게시판으로 이동
	function goThumbnail(){
		location.href="<%=request.getContextPath()%>/list.th";
	}
   	
   	// 자료실로 이동
   	function goShare(){
   		location.href="<%=request.getContextPath()%>/list.sh";
   	}
   	
</script>



		
	<%-- <%@ include file = "bootsFooter.jsp" %>	 --%>
	
		
 <%@ include file = "footer.jsp" %> 
		
</body>

</html>