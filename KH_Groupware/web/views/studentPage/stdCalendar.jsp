<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='lib/moment.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script src='js/gcal.min.js'></script>

<!-- bPopup -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>

<!-- locale = ko ==> 한글로 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/locale/ko.js'></script>

<!-- CSS 파일 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" type='text/css' rel='stylesheet'/>
<title>Insert title here</title>
<script type="text/javascript">
	var sDate;
	var eDate;
	var title;
	
	$(function(){
		$('#calendar').fullCalendar({
			navLinkDayClick: function(){
				return false;
			},
			selectable: true,
			select: function(startDate ,endDate){
				console.log(startDate.format(), endDate.format());
				sDate = startDate.format();
				eDate = endDate.format();
				title = "휴가 신청";
				if(!confirm("휴가를 신청하시겠습니까?")){
					return false;
				}
				approveVac(title, sDate, eDate);
				
 			},
/* 			customButtons : {
				addScheduleBtn : {
					text : '휴가신청',
					click : function(event) {
						alert("휴가를 신청할 날짜를 선택해주세요.");
					selectable: true,
						addSchedule();
					}
				}
			}, */
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'today,addScheduleBtn' 
			},
			defaultDate : '2019-10-10',
			navLinks : true, // can click day/week names to navigate views
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			events : {
				url: "/KH_Groupware/showCalendar.te",
				
				error:function(){
					alert("불러오기 실패");
				},
				success:function(data){
				}
			},
			eventDrop : function(event, delta, revertFunc){
				if(!confirm("일정을 변경하시겠습니까?")){
					 $("#calendar").fullCalendar("refetchEvents");
					 return false;
				}
				$.ajax({
					type:"post",
					url: "/KH_Groupware/updateSchedule.te",
					data: {scdNo:event.id, strDate:event.start.format(), endDate:event.end.format(), type:"modify"},
					cache: false,
					async: false
				})
				.done(function(data){
					if(data > 0){
						alert("일정이 변경되었습니다.");
						$("#calendar").fullCalendar("refetchEvents");
					}
				});
			},
			eventClick : function(ev, jsEvent, view){	
				if(ev.type == "V_W"){
					if(!confirm("휴가신청을 취소하시겠습니까?")){
						 return false;
					}
					$.ajax({
						type:"post",
						url: "/KH_Groupware/updateSchedule.te",
						data: {scdNo:ev.id, type:"delete"},
						cache: false,
						async: false
					})
					.done(function(data){
						if(data > 0){
							alert("휴가신청이 취소되었습니다.");
							$("#calendar").fullCalendar("refetchEvents");
						}
					}); 
				}
			}
		});
	});
	
	function approveVac(title, sDate, eDate){
		var scdName = title;
		var strDate = sDate;
		var endDate = eDate;
		console.log(scdName);
		console.log(strDate);
		console.log(endDate);
		$.ajax({
			type:"post",
			url:"/KH_Groupware/insertSchedule.te",
			cache:false,
			async:false,
			data:{scdName:scdName,
				  strDate:strDate,
				  endDate:endDate	
			},
			success:function(data){	
 				if(data>0){
					alert("정상으로 저장되었습니다.");
					$("#calendar").fullCalendar("addEventSource",data);
					$("#calendar").fullCalendar("refetchEvents");
				} 
			}
		});
	}
</script>
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
		width: 10%;
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
	
	.fc-sun { color:red; }
	.fc-sat { color:blue;  }
	.fc-day:hover{background: whitesmoke; cursor: pointer;}
</style>

</head>
<body>
<div id = "outer">
	<div id = "calendar"></div>
	<div id = "stdList">&nbsp;</div>
</div>








</body>
</html>