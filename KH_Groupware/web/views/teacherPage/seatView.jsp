<%@page import="member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Member> stdList = (ArrayList)session.getAttribute("stdList");
	session.setAttribute("changeSeatList", stdList);

	ArrayList<Member> csList = (ArrayList)session.getAttribute("changeSeatList");
	
	int count = 1;
	int countSize = stdList.size();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#outer {
	width: 100%;
	height: 100%;
	border: 3px solid red;
	padding-left: 30px;
}



#content {
	display: inline-block;
	border: 5px solid black;
	margin: 10%;
	margin-top: 0%;
}

#seatTableArea {
	border: 5px solid black;
	margin: 1%;
	width: 66%;
	display: inline-block;
}


#seatTableArea table .seat {
	border: 2px solid blue;
	height: 120px;
}



#seatTableArea table #hallway {
	border: 2px solid blue;
	height: 120px;
}


.seat {
	width: 15%;
	height: 120px;
}

#hallway {
	width: 300px;
	height: 100%;
	text-align: center;
}

#front {
	width: 1000px;
	text-align: center;
}

#front td {
	border: 2px solid blue;
	height: 120px;
}

#stdListArea {
	width: 30%;
	border: 5px solid black;
	display: inline-block;
}

#std {
	width: 20%;
	height: 30px;
	border: 1px solid red;
	position: relative;
	cursor: pointer;
}

.list {
	border: 1px solid green;
	width: 1000px;
	height: 71.5px;
}

.list table[id^=stdInfo] td {
	border: 1px solid yellow;
	width: 1000px;
	font-size: 5px;
}

.seat table[id^=stdInfo] td {
	border: 1px solid red;
	width: 1000px;
	font-size: 5px;
}

.btn{
	width: 150px;
	height: 80px;
	float: right;
	margin-right: 2%;
}


#saveSeat{
	border: 1px solid white;
	color: white;
	background: black;
}

#resetSeat{
	border: 1px solid black;
	color: black;
	background: white;
}

</style>
</head>
<body>

	<div id="outer">
		<h3 style="text-align: left; font-size: 50px;">
			<em>자리배치</em>
		</h3>
		<div id="content">
			<div id="seatTableArea">
				자리
				<table id="seatTable">
					<tr id="front">
						<td colspan="7">앞</td>
					</tr>
					<%for (int i = 0 ; i < 5 ; i++){ 
					int j;%>
					<tr>
						<%for (j = 0; j < 3 ; j++){ %>
						<td id="sNo<%=i*6+j+1%>" class="seat"><%=i*6+j+1%></td>
						<%} %>
						<%if(i==0 && j==3){ %>
						<td rowspan="5" id="hallway">복도</td>
						<%} %>
						<%for (j = 4; j < 7 ; j++){ %>
						<td id="sNo<%=i*6+j%>" class="seat"><%=i*6+j%></td>
						<%} %>
					</tr>
					<%} %>
				</table>
			</div>
			<div id="stdListArea">
				학생 <
				<table id="stdList">
					<%for (int i = 0 ; i < 10 ; i++){ %>
					<tr>
						<%for (int j = 0 ; j < 3 ; j++){ %>
								<td id = "list<%=(i*3+j+1)%>" class="list">
								</td>
						<%} %>
					</tr>
					<%} %>
				</table>
			</div>
			<div>
				<button id = "saveSeat" class = "btn">저장하기</button>
				<button id = "resetSeat" class = "btn">초기화</button>
			</div>
		</div>
	</div>

	<script>
	
	
	
	
function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("std", ev.target.id);
}

function drop(ev) {
 	
  ev.preventDefault();
  var std = ev.dataTransfer.getData("std");
  var stdNo = std.substring(3,5);
  var seatNo = (ev.target.id).substring(3,5);

  if(seatNo.startsWith("t")){
	  seatNo = null;
  }
  
  console.log(stdNo+"번 학생이 "+seatNo+"번 자리에 배정 받습니다.");
  
  ev.target.appendChild(document.getElementById(std));

  $.ajax({
		url:"/KH_Groupware/updateSeat.te",
		data:{stdNo:stdNo,
			  seatNo:seatNo,
			  type:"move"	
		},
		success:function(data){	
 			
			
			alert("옮기기 성공입니다."); 
			}
		}
	); 

}


$("#saveSeat").click(function(){
	  $.ajax({
			url:"/KH_Groupware/updateSeat.te",
			data:{ type:"save"	
			},
			success:function(data){	
				
				alert("저장 성공입니다.");
				}
			}
		); 
});


$("#resetSeate").click(function(){
	  $.ajax({
			url:"/KH_Groupware/updateSeat.te",
			data:{ type:"reset"	
			},
			success:function(data){	
				
				alert("성공입니다.");
				}
			}
		); 
});



$(function(){
	$(".seat").attr({"ondrop":"drop(event)", "ondragover":"allowDrop(event)"});
	$(".list").attr({"ondrop":"drop(event)", "ondragover":"allowDrop(event)"});
});




$(function(){

	<%for (int i = 0 ; i < 10 ; i++){ %>
		<%for (int j = 0 ; j < 3 ; j++){ %>
			<%if(countSize > 0 && stdList.get(i*3+j) != null){ %>
				<% countSize--;%>
				<%if(stdList.get(i*3+j).getSeat() == null){%>
					$("#list<%=count%>").html("<div id = 'std<%=(i*3+j+1)%>' class='std' draggable='true' ondragstart='drag(event)'>"
						 						+"<table id='stdInfo<%=(i*3+j+1)%>'>"
													+"<tr>"
														+"<td><%=stdList.get(i*3+j).getUserName()%></td>"
														+"<td><%=stdList.get(i*3+j).getRRN()%></td>"
													+"</tr>"
													+"<tr>"
														+"<td><%=stdList.get(i*3+j).getStdLv()%></td>"
														+"<td><%=stdList.get(i*3+j).getExp()%></td>"
													+"</tr>"
													+"<tr>"
														+"<td><%=stdList.get(i*3+j).getMajor()%></td>"
														+"<td><%=stdList.get(i*3+j).getSmoking()%></td>"
													+"</tr>"
												+"</table>"
											+"</div");
					<%count++; %>
				<%} else{%>
					$("#sNo<%=stdList.get(i*3+j).getSeat()%>").html("<%=stdList.get(i*3+j).getSeat()%> <div id = 'std<%=(i*3+j+1)%>' class='std' draggable='true' ondragstart='drag(event)'>"
						 						+"<table id='stdInfo<%=(i*3+j+1)%>'>"
													+"<tr>"
														+"<td><%=stdList.get(i*3+j).getUserName()%></td>"
														+"<td><%=stdList.get(i*3+j).getRRN()%></td>"
													+"</tr>"
													+"<tr>"
														+"<td><%=stdList.get(i*3+j).getStdLv()%></td>"
														+"<td><%=stdList.get(i*3+j).getExp()%></td>"
													+"</tr>"
													+"<tr>"
														+"<td><%=stdList.get(i*3+j).getMajor()%></td>"
														+"<td><%=stdList.get(i*3+j).getSmoking()%></td>"
													+"</tr>"
												+"</table>"
											+"</div");
				
				<%} %>
			<%} %>
		<%} %>
	<%} %>

});

</script>
</body>
</html>