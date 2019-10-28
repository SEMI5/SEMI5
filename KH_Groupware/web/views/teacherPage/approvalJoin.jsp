<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member"%>
<%
	ArrayList<Member> stdList = (ArrayList) session.getAttribute("stdList");

	int i;
	int count = 0;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>
<title>Insert title here</title>
<style type="text/css">

::-webkit-scrollbar {

display:none;

}
-ms-overflow-style: none; 
#outer {
	width: 98%;
	height: 100%;

	padding: 20px;
}

#content {
	margin: 25%;
	margin-top: 3%;
}

#stdList {
	text-align: center;
}

#stdList>table {
	width: 100%;
	border-top: 0.5px solid darkgray;
	border-collapse: collapse;
}

#stdList td {
	text-align: center;
	border-bottom: 0.5px solid darkgray;
	padding: 1.5px;
	height: 50px;
	font-size: 15px;
}

[id*=popUp] {
	width: 700px;
	height: 200px;
	display: none;
	background: grey;
}

[id*=popUp]>div {
	width: 347px;
	height: 200px;
	display: inline-block;
	margin: auto;
	vertical-align: center;
}

[id*=popUp]>div>div, [id*=msg] {
	margin: auto;
	text-align: center;
	font-size: 60px;
}

#banner{
	width: 100%;
	height: 350px;
	margin-top: 40px;
	margin-bottom: 50px;
}

#banner img{
	width: 100%;
	height: 250px;
	
}

#mainTitle{
	margin: auto;
	font-size: 45px;
	width: 50%;
	margin-left: 25%;
	margin-right: 25%;
	border-bottom: 1px solid grey;
	height: 50px;
	text-align: center;
	margin-top: 50px;
	padding-bottom: 30px;
	}

</style>

</head>
<header>
	<%@ include file = "/views/common/header.jsp" %>
</header>
<body>
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->


	<div id = "banner">	
		<img src="https://images2.imgbox.com/16/2a/21JdCHzj_o.jpg" alt="image host"/>
		<div  id = "mainTitle"><b style="margin-bottom: 3000px;">가입 승인</b></div>
	</div>
	
	<div id="outer">
		<div id="content">
			<div id="stdList">
				<table align="center">
					<tr>
						<th width="100px">학생이름</th>
						<th width="200px">생년월일</th>
						<th width="250px">전화번호</th>
						<th width="300px">가입일</th>
						<th width="400px"></th>
					</tr>
					<%
						for (i = 0; i < stdList.size(); i++) {
					%>
					<%
						if (stdList.get(i).getApprove().equals("N")) {
					%>
					<tr id="std<%=i%>" class="std">
						<td><%=stdList.get(i).getUserName()%></td>
						<td><%=stdList.get(i).getRRN()%></td>
						<td><%=stdList.get(i).getPhone()%></td>
						<td><%=stdList.get(i).getEnrollDate()%></td>
						<td id="appInfo<%=i%>"></td>
					</tr>
					<% count++;%>


					<script>
						
							$("#std<%=i%>").css({"background":"white"});
							$("#appInfo<%=i%>").text("'승인 대기 중입니다.'").css({"font-style":"italic","font-weight":"10"});
							$(".std").hover(function() {
								  $(this).css({"background":"whitesmoke", "cursor" : "pointer"});
								}, function(){
								  $(this).css("background", "white");
								});
							
							$(function() {
								$('#std<%=i%>').on('click', function(e) {
									e.preventDefault();
									$('#popUp<%=i%>').bPopup({
										modalClose : false
									});	
								});
								
								$("#hol<%=i%>").click(function(){
									$('#popUp<%=i%>').bPopup().close();
								});
							});
						<%}%>
						</script>


					<div id="popUp<%=i%>">
						<div id="app<%=i%>" onclick = "appJoin(<%=stdList.get(i).getUserNo()%>, '<%=stdList.get(i).getUserId()%>', <%=i%>);" style = "background: whitesmoke; color: grey">
							<div>
								<p>가입승인
								<p>
							</div>
						</div>
						
						<div id="hol<%=i%>" style="background: grey; color: white">
							<div>
								<p>보류
								<p>
							</div>
						</div>
						<div id="msg"
							style="background-color: none; color: white; font-size: 35px; display: block; width: 700px; height: 100px;">
							<em> 승인된 학생은 <br>승인을 취소할 수 없습니다.</em>
						</div>
					</div>
					<%
					}
					if(count == 0){
					%>
				</table>
					<h2>승인 대기 중인 학생이 없습니다.</h2>
					<%} %>
			</div>
		</div>
	</div>
	</div><!-- container -->
</div><!-- mainContent -->
	<script>
		$("[id*=app], [id*=hol]").hover(function() {
			$(this).css({
				"opacity" : "0.5",
				"cursor" : "pointer"
			});
		}, function() {
			$(this).css({
				"opacity" : "1.5"
			});
		});
		
		$("[id*=appInfo]").unbind('mouseenter mouseleave');
		
		function appJoin(userNo, userId, i) {
			console.log("ddd");
			$.ajax({
				url : "/KH_Groupware/approve.te",
				type : "get",
				data : {
					userNo : userNo,
					userId : userId,
					i : i
				},
				success : function(data) {
					alert("정상적으로 가입이 승인되었습니다.");
					/* $("#std"+i).css({"background":"rgb(180,180,180)","color":"white"}).unbind('mouseenter mouseleave'); */
					/* $("#appInfo"+i).text("승인되었습니다."); */
					
					 $("#std"+i).css({"display":"none"});
					$("#popUp"+i).bPopup().close();
				}
			});
		}
		
		

	
</script>
</body>
<%@ include file = "/views/common/footer.jsp" %>

</html>