<%@page import="map.controller.AjaxListServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, map.model.vo.*"%>
	<%
		ArrayList<TR_list> list = (ArrayList)request.getAttribute("list");
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
		
		#storeName, #storeMemo{
			margin: 0px;
		}
		#onelist{
		    text-align-last: center;
		}
		#likeCountt{
			vertical-align: -webkit-baseline-middle;
		}
		li{
		list-style: none;
		}
	</style>
</head>
<header>
	<%@ include file = "/views/common/header2.jsp" %>
</header>
<body>
	<br><br>
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
    abcd = null;
	var AjaxData= $(function(){
					 $.ajax({
						 url:"/KH_Groupware/ajaxlist.tr",
						 type:"get",	
						 success: function (data) {
							 
								$.each(data, function(index, value) {
									abcd = data[index];
									var str = "<tr id=kan"+index+" style='border: 1px solid white'>"+
										  	 "<td id=onelist>"+	
											 "    <li id=storeName>"+ data[index].trName +".</li><br>"+
								             "    <li id=storeMemo> 후기 : "+ data[index].trMemo +"</li><br>"+
								             "    <input type=hidden id=hiddenAddress value=" + data[index].trLatLng + ">" +
								             "    <div id=likeTd"+index+">" +
								             "    	 <img src=../../images/like30px.png>"+				
								             "   	 <a id=likeCountt>like <span id=ctnSpan"+index+">0<span></a>  "+
								             "    </div>  "+
								             "</td>" +
								          "</tr>";
								        $("#AJlist").append(str);					
										console.log(data);
										
										/*  DB에 저장된 like 가져오기  */
										$.ajax({
											url:"/KH_Groupware/ajaxLikeList.tr",
											type:"get",
											data:{trlist:data[index].trNo},
											success: function (data) {
												console.log(data);
													$("#ctnSpan"+index).text(data);
											},// success종료
											error: function() {
											}
										}); // ajax종료 
										/* ----------------------------------------리스트 클릭하면 키워드칸에 가게명 뿌리기---------------------------------------------------- */
										$("#kan" + index).click(function () {
											str2 = data[index].trName;
										 	$("#keyword").val(str2); // 다시 검색창에
										 	
										 	/* -------------------------------------------주소값으로 좌표 찾고 해당 좌표자리에 마커 찍기------------------------------------------ */
										 		//console.log(data[index].trLatLng);
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
										 
										});
											
											/* like 클릭시 횟수 증가.----------------------------------------------------------------------------------------------------------- */
										/* 	var ctn = 0;
											var likes = $("#likeTd"+index).on('click', function () {
															//alert(ctn);
															//ctn++;
															var likePlus = $("#ctnSpan"+index).text();
															$("#ctnSpan"+index).text(parseInt(likePlus) + 1);
															
															// 클릭시 ajax발동 후 테이블 좋아요 횟수 수정
																alert("ajax발동");	
																alert("해당 TRNO" + data[index].trNo);	
																$.ajax({
																	 url:"/KH_Groupware/ajaxLikeInsert.tr",
																	 type:"get",
																	 data:{likeCnt:$("#ctnSpan"+index).text(), SameTrNo:data[index].trNo},
																	 success: function(data) {
																		alert("성공했습니다. 중복 검사를 시작합니다.");
																	 },
																	 error: function() {
																		alert("like 추가 실패했습니다.");
																 	 }
																});
														}); */
														
														var ctn = 0;
														var likes = $("#likeTd"+index).on('click', function () {
																		//alert(ctn);
																		//ctn++;
																		var likePlus = $("#ctnSpan"+index).text();
																		//$("#ctnSpan"+index).text(parseInt(likePlus) + 1); // 카운트 늘려주는 라인
																		
															
																		/* 중복검사 */
																		alert("중복검사할 trNo = " + data[index].trNo);
																		abcd = data[index].trNo;
																		
																		$.ajax({
																			 url:"/KH_Groupware/limitLike.tr",
																			 type:"get",
																			 data:{SameTrNo:data[index].trNo},
																			 success: function(data) {
																				 
																				 if(data == "possible"){
																					alert("possible");
																					
																					// 클릭시 ajax발동 후 테이블 좋아요 횟수 수정
																					//alert("ajax발동");	
																					alert("해당 TRNO" + abcd);
																					console.log("abcd" + abcd);
																					$.ajax({
																						 url:"/KH_Groupware/ajaxLikeInsert.tr",
																						 type:"get",
																						 data:{likeCnt:$("#ctnSpan"+index).text(), SameTrNo:abcd},
																						 success: function(data) {
																							alert("성공했습니다. 중복 검사를 시작합니다.");
																							$("#ctnSpan"+index).text(parseInt(likePlus) + 1); // 카운트 늘려주는 라인
																						 },
																						 error: function() {
																							alert("like 추가 실패했습니다.");
																					 	 }
																					});
																				 }else{
																					 alert("중복이 존재 합니다.");
																				 }
																			 
																			 },
																			 error: function() {
																				alert("중복검사 실패");	
																		 	 }
																		});
																	
																	});
								}); // each(for)문 종료
						},  // success 종료
						error: function(data) {
							alert("실패");
						}
					}); // ajax 종료					
				}); // function 종료
				
	</script>
	
 	</div>
</body>
	<%@ include file = "/views/common/bootsFooter.jsp" %> 
</html>