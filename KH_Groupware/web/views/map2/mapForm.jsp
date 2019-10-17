<%@page import="map.controller.AjaxListServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, map.model.vo.*"%>
	<%
		ArrayList<TR_list> list = (ArrayList)request.getAttribute("list");
		String AD = (String)request.getParameter("AjaxData");
		//out.print(list);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>맛집</title>	
	<style>
		.mapArea{
			width: 1900px;
			height: 830px;
			background: begie;
		}
		
		#map{
			
			width: 1400px;
			height: 830px;
			background: begie;
			display: inline-block;
			position: sticky;  /* 헤더가 안씹게 */
		}
		
		#list{
			width: 494px;
			height: 830px;
/* 			background: white; */
			 background: rgb(225,225,225);   
			display: inline-block;
			border: 2px solid none;
			-ms-overflow-style: none; /* ms에서 스크롤바 안보이게 */
		}
		
		.listTable{
			overflow: auto;
			align-items: center;
			width: 494px;
			height: 800px; 
		}
		
		td{
			color: black;
			width: 500px;
			height: 120px;
		}
		::-webkit-scrollbar {  /* 스크롤은 되지만, 스크롤바 안보이게.(크롬용) */
		display:none;
		} 
		
		td:hover{
			color: white;
		}
		
		#kan:hover{
			background: grey;
		}
	</style>
</head>
<header>
	<%@ include file = "/views/common/header.jsp" %>
</header>
<body>
 	<div class="mapArea">
		<div id="map">
		 	<%@include file="../map2/map2.jsp"%> 	 
		</div>
		
		<div id="list" style="overflow: auto">  <!-- css로먹이면안되고, 여기에 직접먹임. 스크롤바기능 -->
			<!-- <table class="s" id="AJlist" border="1px solid"> -->
			<table class="s" id="AJlist" border="1px solid">
			
			</table>
		</div>
		
	<!-- 자동실행 -->
	<script type="text/javascript">

	var toss = null;
	
	var AjaxData= $(function(){
					 $.ajax({
						 url:"/KH_Groupware/ajaxlist.tr",
						 type:"get",	
						 success: function(data) {
								$.each(data, function(index, value) {  // 데이터 만큼의 포문을 돌리는것.
								var str = "<tr id=kan"+index+" style='border: 1px solid white'>"+
										  	 "<td>"+
											 "    가게 명 : "+ data[index].trName +"<br>"+
								             "    후기 : "+ data[index].trMemo +"<br>"+
								             "    별점 : "+ data[index].trName + 
								             "    <input type=hidden id=hiddenAddress value=" + data[index].trLatLng + ">" +
								             "    <button id=likeBtn value= >dd<button>"+
								             "</td>" +
								          "</tr>"; 
								        $("#AJlist").append(str);					
										console.log(data);
										
										$("#kan" + index).click(function () {
											str2 = data[index].trName;
										 	$("#keyword").val(str2); // 다시 검색창에
										 	/* -------------------------------------------주소값으로 좌표 찾고 해당 좌표자리에 마커 찍기------------------------------------------ */
										 	// 주소로 좌표를 검색합니다
										 		console.log(data[index].trLatLng);
												geocoder.addressSearch(data[index].trLatLng, function(result, status) {
												
												    // 정상적으로 검색이 완료됐으면 
												     if (status === kakao.maps.services.Status.OK) {
												
												        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
												
												        // 결과값으로 받은 위치를 마커로 표시합니다
												        var marker = new kakao.maps.Marker({
												            map: map,
												            position: coords
												        });												
												        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												        map.setCenter(coords);
												    } 
												});    
										 	/* ------------------------------------------------------------------------------------------------------------------- */
										});
								}); // each문 종료
						},  // success 종료
						error: function(data) {
							alert("실패");
						}// error 종료
					}); // ajax 종료
				}); // function 종료
	</script>
	
 	</div>
</body>
	<%@ include file = "/views/common/footer.jsp" %> 
</html>