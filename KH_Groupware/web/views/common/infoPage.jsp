<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9db7af1214b0f763e2d8fd3b9129b6d9"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}


.hero-image {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("photographer.jpg");
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}

.hero-text button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 10px 25px;
  color: black;
  background-color: #ddd;
  text-align: center;
  cursor: pointer;
}

.hero-text button:hover {
  background-color: #555;
  color: white;
}
/* img{
   left: -523px;
    top: -411px;
    width: `;
    height: 256px;
} */



/* 비디오 관련 */
/* * {
  box-sizing: border-box;
}
#myVideo {
  position: fixed;
  right: 0;
  bottom: 0;
  min-width: 100%; 
  min-height: 100%;
}
 */
.content {
  position: fixed;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  color: #f1f1f1;
  width: 100%;
  padding: 20px;
  height: 250px;
}


/* 프로필 관련 */

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 22%;
  display: inline-block;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.containerCard {
  padding: 2px 16px;
}




/* 스크롤바 안보여도 스크롤 가능. */
::-webkit-scrollbar {
	display:none;
}

#saveId {

    top: 170px;

}


</style>




</head>
	 <header>
	 	<%@ include file = "header.jsp" %>
	 </header>  
<body>
		
<div id="container" style="background: yellow; width: 100%; height: 100%; overflow: auto;"><!-- container -->
	<div id="mainContent" style="background: yellow; width: 100%; height: 100%; overflow: auto "><!-- mainContent -->
		
		<!-- 1. kh관련 소개 -->
		<div id="aboutKH" style="width: 100%; height: 1000px; background: #262A2D;">
 			<video autoplay muted loop id="myVideo" style="width: inherit; height: inherit;
}">
		    <source src="../../images/computer.mp4" type="video/mp4">
			</video>
			
			<div class="content">
			  <h3>KH정보교육원?</h3>
			  <pre>
				  KH정보교육원은 청년실업 문제를 해소하기 위해, 국제경쟁력을 갖춘 기술을 확보하여 고급기술자 양성 교육을
				   실현할 수 있는 평생교육시스템을 구축하며, 실업에 실질적 도움을 주기 위한 기관입니다.
		      </pre>
			  <h3>KH Groupware?</h3>
			  <pre>
				  KH Gropware는 KH정보교육원의 학생들의 편리를 위하여 만들어진 웹 페이지 입니다. 우리는 학생들을 위한 게시판, 공지사항, 편의 시설들을 제공합니다.
		      </pre>
			</div>
		</div>	
		<!-- 2. 개인소개 -->
		<div id="whoMade"style="width: 100%; height: 600px; background: #E7E3E3; text-align-last: center;">
			<div id="cardWrapper" style="padding: 78px;">
				<h2 style="height: 60px;">Our Team</h2>
				<div class="card">
				  <img src="../../images/people2.jpg" alt="Avatar" style="width:350px; height: 370;">
				  <div class="containerCard">
				    <h4><b>강현모</b></h4> 
				    <p>Architect & Engineer</p> 
				  </div>
				</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<div class="card">
				  <img src="../../images/people2.jpg" alt="Avatar" style="width:350px; height: 370;">
				  <div class="containerCard">
				    <h4><b>안상재</b></h4> 
				    <p>Architect & Engineer</p> 
				  </div>
				</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<div class="card">
				  <img src="../../images/people2.jpg" alt="Avatar" style="width:350px; height: 370;">
				  <div class="containerCard">
				    <h4><b>이준배</b></h4> 
				    <p>Architect & Engineer</p> 
				  </div>
				</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<div class="card">
				  <img src="../../images/people2.jpg" alt="Avatar" style="width:350px; height: 370;">
				  <div class="containerCard">
				    <h4><b>조호관</b></h4> 
				    <p>Architect & Engineer</p> 
				  </div>
				</div>
			</div> 
		</div>
		
		
		<!-- 3. 오는길 -->
		<div id="howToGO" style="width: 100%; height: 500px; background: cyan;">
		<div class="hero-image">
			  <div class="hero-text">
			    <h1 style="font-size:50px">How to come?</h1>
			    <p></p>
			    <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black">Map</button>
			  </div>
			</div>
		</div>
		
			
	</div>
</div>
		
		
		
		
		
		
		
		<!-- 버튼 클릭시 나올 div -->
			<div id="id01" class="w3-modal">
		    <div class="w3-modal-content">
		      <header class="w3-container w3-teal"> 
		        <span onclick="document.getElementById('id01').style.display='none'" 
		        class="w3-button w3-display-topright">&times;</span>
		        <h2>KH정보교육원 강남 1관</h2>
		      </header>
		      <div class="w3-container">
					<div id="map" style="width:100%;height:500px;">
						<img src="../../images/howtoGo.gif" style="width:100%;height:500px;">
					</div>
								<!-- <script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									    mapOption = {
									        center: new kakao.maps.LatLng(37.4990000,127.0328800), // 지도의 중심좌표
									        level: 4, // 지도의 확대 레벨
									        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
									    }; 
									// 지도를 생성한다 
									var map = new kakao.maps.Map(mapContainer, mapOption); 
							
								 	// 지도에 마커를 생성하고 표시한다
									var marker = new kakao.maps.Marker({
									    position: new kakao.maps.LatLng(37.4990000,127.0328800), // 마커의 좌표
									    draggable : true, // 마커를 드래그 가능하도록 설정한다
									    map: map // 마커를 표시할 지도 객체
									}); 
									/* $(function(){
										 var coords = new kakao.maps.LatLng(37.4990000,127.0328800);
											
									        // 결과값으로 받은 위치를 마커로 표시합니다
									        var marker = new kakao.maps.Marker({
									            map: map,
									            position: coords
									        });				
									        map.setCenter(coords);
									}); */
								</script> -->
		      </div>
		      <footer class="w3-container w3-teal">
		        <p>서울특별시 강남구 역삼동 강남구 테헤란로14길 6 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호 : (02) 1544-9970</p>
		      </footer>
		    </div>
		  </div>
		<!-- 버튼 클릭시 나올 div -->
		
		
		



</body>
 <%@ include file = "footer.jsp" %>
</html>