<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
				
 <%@ include file = "header.jsp" %> 
<style>
body {font-family: "Lato", sans-serif;}

.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 33%;
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

</style>

</head>
<body>
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->
   
   
			<br><br><br><br>
			<h1 align="center"> 강사 소개 </h1>
			<h2 align="center"> IT업계 최고의 강사진을 소개합니다. </h2>
			<button class="tablink" onclick="openCity('London', this, 'red')"> 담당 강사진 </button>
			<button class="tablink" onclick="openCity('Paris', this, 'green')"> 취엄담임 선생님 </button>
			<button class="tablink" onclick="openCity('Tokyo', this, 'blue')"> 진로상담 선생님 </button>
			
				<br><br><br><br>
			<div id="London" class="tabcontent">
			  	<div class = "block block-test2 area1"><img src="../../images/teacher1.png" style="width:80%"></div>
			</div>
			
			<div id="Paris" class="tabcontent">
			  	<div class = "block block-test2 area6"><img src="../../images/teacher2.png" style="width:80%"></div>
			</div>
			
			<div id="Tokyo" class="tabcontent">
			  	<div class = "block block-test2 area6"><img src="../../images/teacher3.png" style="width:80%"></div>
			</div>
			
			
			
		</div><!-- container -->
</div><!-- mainContent -->
<%@ include file = "/views/common/footer.jsp" %>

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
</script>
   
   
   
</body>
</html>