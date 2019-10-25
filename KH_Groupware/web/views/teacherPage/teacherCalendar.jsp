<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<%
	ArrayList<Member> stdList = (ArrayList)session.getAttribute("stdList");

%>

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


<script type="text/javascript">
	var sDate;
	var eDate;

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
				var title = prompt("일정의 제목을 입력하세요.");
				$("#calendar").fullCalendar("refetchEvents");
				saveSchedule2(title, sDate, eDate);
 			},
			customButtons : {
				addScheduleBtn : {
					text : '일정추가',
					click : function(event) {
/* 						if(sDate == null){
							alert("날짜를 선택하세요.");
							return false;
						} */
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
					$.ajax({
						type:"post",
						url: "/KH_Groupware/showSchedule.te",
						data: {stdNum: ev.userNum},
						cache: false,
						async: false
					})
					.done(function(data){
						$("#stdList").css("display","inline-block");
						
						var info = "<tr>"+
										"<th>날짜</th>"+
										"<th>승인여부</th>"+
									"</tr>";
						
						for(key in data){
							if(ev.id == data[key].id){
								info += "<tr>"
								info += "<td style = 'background: grey; color: white'>"+data[key].start+"</td>";
								info += "<td style = 'background: grey; color: white'>"+data[key].title+"</td>";
								info += "<td id = 'scdId' style = 'display: none;'>"+data[key].id+"</td>";
								info += "</tr>";
							}
							else{
								if(data[key].type == "V_N"){
									info += "<tr>"
									info += "<td style = 'background: red; color: white'>"+data[key].start+"</td>";
									info += "<td style = 'background: red; color: white'>"+data[key].title+"</td>";
									info += "</tr>";
								}
								else{
									info += "<tr>"
									info += "<td style = 'background: blue; color: white'>"+data[key].start+"</td>";
									info += "<td style = 'background: blue; color: white'>"+data[key].title+"</td>";
									info += "</tr>";
								}
							}
						}
						
						$("#scdContents").html(
							""+info
						);
					}); 
					}
				
				
				if(ev.type == "SCD"){
					if(!confirm("일정을 삭제하시겠습니까?")){
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
							alert("일정이 삭제되었습니다.");
							$("#calendar").fullCalendar("refetchEvents");
						}
					}); 
				}
			}
		});
	});
	

	function addSchedule(){
		var scInfo = "";
		scInfo += "<div style='width:100%; height:30px;'><div style= 'width:30%; float:left; paddin-left:30px;'>일정내용</div><div style= 'width:60%; float:right;'><input id = 'scdName' type = 'text' value =''></div></div>" 
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
	
	function closeMsg(baId){
		
		$("#"+baId).bPopup().close();
	}
	
	function saveSchedule(){
		var scdName = $("#scdName").val();
		var strDate = $("#strDate").val();
		var endDate = $("#endDate").val();
		console.log(scdName);
		console.log(strDate);
		console.log(endDate);
		if(!scdName){
			alert("일정 내용을 입력하세요.");
			return false;
		}
		if(!strDate){
			alert("시작일을 입력하세요.");
			return false;
		}
		if(!endDate){
			alert("마감일을 입력하세요.");
			return false;
		}
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
					closeMsg("boxAlert");
					alert("정상으로 저장되었습니다.");
					$("#calendar").fullCalendar("addEventSource",data);
					$("#calendar").fullCalendar("refetchEvents");
				} 
			}
		});
	
	}
		
		function saveSchedule2(title, sDate, eDate){
			var scdName = title;
			var strDate = sDate;
			var endDate = eDate;
			console.log(scdName);
			console.log(strDate);
			console.log(endDate);
			if(!scdName){
				alert("일정 내용을 입력하세요.");
				return false;
			}
			if(!strDate){
				alert("시작일을 입력하세요.");
				return false;
			}
			if(!endDate){
				alert("마감일을 입력하세요.");
				return false;
			}
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
						closeMsg("boxAlert");
						alert("정상으로 저장되었습니다.");
						$("#calendar").fullCalendar("addEventSource",data);
						$("#calendar").fullCalendar("refetchEvents");
					} 
				}
			});
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
		display: none;
		margin: 2%;
		border: 5px solid black;
		width: 20%;
		height: 830px;
		padding: 2%;
	} 
	
	#stdListTable{
		display: inline-block;
		margin: auto;

	}
	
	#calendar {
		max-width: 50%;
		display: inline-block;
		margin: 2%;
		border: 5px solid black;
		padding: 2%;
		height: 830px;
	}
	
	#scdContents{
		margin: auto;
		text-align: center;
		border-collapse: collapse;
	}
	
	#scdContents td{
		border-bottom: 1px solid grey;
		width: 300px;
	}
	
	#scdContents th{
		border-bottom: 1px solid grey;
		width: 300px;
	}
	
	
	.buttons{
		margin-top: 50px;
	}
	
	.buttons button{
		width: 100px;
		height: 50px;
	}
	
	.buttons button:hover{
		cursor: pointer;
	}
	
/* 	.fc-past{ background:whitesmoke} */
	.fc-sun { color:red; }
	.fc-sat { color:blue;  }
	.fc-day:hover{background: whitesmoke; cursor: pointer;}

</style>



</head>

<header>	
</header>

<body>


<div id = "outer">
	
	<div id = "calendar"></div>
	<div id = "stdList">
		<div id = "stdListTable">
			<table id = "scdContents">

			</table>
			<div class = "buttons" align="center">
				<button style = "background: black; color: white; border: none;" onclick = "appVac();">휴가승인</button>
				<button style = "background: white; color: black; border: 1px soild black;" onclick = "recVac();">휴가불승인</button>
			</div>
		</div>
	</div>
</div>


<div class = "box" style = "width:500px; display:none; background:white;" id ="boxAlert">
	<div class = "boxHead" style = "background:white; paddin-left:15px">
		<h3 class ="boxTitle" id = "subject" style = "background:white"></h3>
	</div>
	<div class = "boxBody" id = "contents" style = "font-size:15px; background:white;">
	</div>
</div>



<script type="text/javascript">
	function appVac(){
		if(!confirm("휴가를 승인하시겠습니까?")){
			return false;
		}
		$.ajax({
			type:"post",
			url:"/KH_Groupware/approveVac.te",
			cache:false,
			async:false,
			data:{scdId:$("#scdId").text(),
				type:"approve"},
			success:function(data){	
 				if(data>0){
					alert("정상으로 저장되었습니다.");
					$("#stdList").css("display","none");
					$("#calendar").fullCalendar("addEventSource",data);
					$("#calendar").fullCalendar("refetchEvents");
				} 
			}
		});
		
	};


	function recVac(){
		if(!confirm("휴가를 거절하시겠습니까?")){
			return false;
		}
		$.ajax({
			type:"post",
			url:"/KH_Groupware/approveVac.te",
			cache:false,
			async:false,
			data:{scdId:$("#scdId").text(),
				type:"reject"},
			success:function(data){	
 				if(data>0){
					alert("정상으로 저장되었습니다.");
					$("#stdList").css("display","none");
					$("#calendar").fullCalendar("addEventSource",data);
					$("#calendar").fullCalendar("refetchEvents");
				} 
			}
		});
	};



</script>

</body>


<footer>
</footer>

</html>