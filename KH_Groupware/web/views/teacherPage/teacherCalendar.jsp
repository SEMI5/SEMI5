<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/footer.jsp"%>

<%
ArrayList<Member> stdList = (ArrayList)session.getAttribute("stdList");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='lib/moment.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script src='js/gcal.min.js'></script>

<!-- bPopup -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>

<!-- locale = ko ==> 한글로 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/locale/ko.js'></script>

<!-- CSS 파일 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" type='text/css' rel='stylesheet'/>


<script type="text/javascript">
	$(function(){
		$('#calendar').fullCalendar({
			customButtons : {
				addScheduleBtn : {
					text : '일정추가',
					click : function(event) {
						addSchedule();
					}
				}
			},
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'today,addScheduleBtn' 
			},
			defaultDate : '2019-10-10',
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : []
		});
	});
	

	function addSchedule(){
		var scInfo = "";
		scInfo += "<div style='width:100%; height:30px;'><div style= 'width:30%; float:left; paddin-left:30px;'>일정내용</div><div style= 'width:60%; float:right;'><input id = 'scName' type = 'text' value =''></div></div>" 
		scInfo += "<div style='width:100%; height:30px;'><div style= 'width:30%; float:left; paddin-left:30px;'>시작일</div><div style= 'width:60%; float:right;'><input id = 'strDate' type = 'date' style= 'width:150px;'  value =''></div></div>"
		scInfo += "<div style='width:100%; height:30px;'><div style= 'width:30%; float:left; paddin-left:30px;''>마감일</div><div style= 'width:60%; float:right;'><input id = 'endDate' type = 'date' style= 'width:150px;'  value =''></div></div>"
		scInfo += "<div style='width:100%; text-align:center; height:10px; margin-bottom:15px; margin-top:10px'><button onclick = 'saveSchedule();'>저장하기</</button></div> "
		openPop("일정 등록", scInfo, 500);
	}
	
	function openPop(subject, contents, widths){
		$("#subject").html(subject);
		$("#contents").html(contents);
		openMsg("boxAlert",widths);
	}
	
	function openMsg(baId, widths){
		$("#"+baId).css("width",widths+"px");
		$("#"+baId).bPopup();
	}
	
	function closeMsg(baId, widths){
		
		$("#"+baId).bPopup().close();
	}
	
</script>

<title>강사일정관리</title>

<style type="text/css">
	#outer{
		margin: 5%;
		margin-top: 3%;
		border: 5px solid black;
	}
	
 	#stdList{
		display: inline-block;
		margin: 2%;
		border: 5px solid black;
		width: 40%;
		height: 830px;
		padding: 2%;
	} 
	
	#calendar {
		max-width: 50%;
		display: inline-block;
		margin: 2%;
		border: 5px solid black;
		padding: 2%;
		height: 830px;
	}
</style>



</head>

<header>	
</header>

<body>


<div id = "outer">
	<div id = "calendar"></div>
	<div id = "stdList">sdfsdfsd</div>
</div>


<div class = "box" style = "width:500px; display:none; background:white;" id ="boxAlert">
	<div class = "boxHead" style = "background:white; paddin-left:15px">
		<h3 class ="boxTitle" id = "subject" style = "background:white"></h3>
	</div>
	<div class = "boxBody" id = "contents" style = "font-size:15px; background:white;">
	</div>
</div>





<script type="text/javascript">

</script>

</body>


<footer>
</footer>

</html>