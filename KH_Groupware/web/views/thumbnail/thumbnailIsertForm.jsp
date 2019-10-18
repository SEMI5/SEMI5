<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer {
      width:1500px;
      height:950px;
      
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   table {
      width:800px;
       border:1px solid black;
   }
   .insertArea {
   	  /* background:beige; */
      width:900px;
      height:750px;
      margin-left:auto;
      margin-right:auto;
   }
   .btnArea {
      width:150px;
      margin-left:auto;
      margin-right:auto;
   }
   #titleImgArea {
      width:350px;
      height:200px;
      border:1px solid black;
      text-align:center;
      display:table-cell;
      vertical-align:middle;
   }
   #titleImgArea:hover, #contentImgArea1:hover, 
   #contentImgArea2:hover, #contentImgArea3:hover {
      cursor:pointer;
   }
   #contentImgArea1, #contentImgArea2, #contentImgArea3 {
      width:150px;
      height:100px;
      border:1px solid black;
      text-align:center;
      display:table-cell;
      vertical-align:middle;
   }
</style>

</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	<!-- 사진 게시판 작성은 두개의 테이블에 저장되게 한다 (게시판의 타입 2번, Attachment테이블  -->
	<div class = "outer">
		<br>
		<h2 align = "center"> 사진 게시판 작성 </h2>
			
		<form action = "<%=request.getContextPath()%>/insert.th" method="post"
			encType="multipart/form-data">		<!-- ***form태그를 가지고 encType=인코딩 타입 /multipart/form-data(파일업로드) 보냄-->
			<div class = "insertArea">
				<table align="center">
					<tr>
						<td width = "120px">제목</td>
						<td colspan="3"><input type="text" size ="99" name ="title"></td>
					</tr>
					<tr>
						<td> 대표이미지 </td>
						<td colspan ="3">
							<div id = "titleImgArea">
								<img id ="titleImg" width ="658" height ="400">
							</div>
						</td>					
					</tr>
					<tr>
						<td> 내용사진 </td>
						<td>
							<div id="contentImgArea1">
								<img id ="contentImg1" width ="200" height ="150">
							</div>						
						</td>
						<td>
							<div id="contentImgArea2">
								<img id ="contentImg2" width ="200" height ="150">
							</div>						
						</td>
						<td>
							<div id="contentImgArea3">
								<img id ="contentImg3" width ="200" height ="150">
							</div>						
						</td>
					</tr>
					<tr>
						<td width="100px">사진 메모 </td>
						<td colspan ="3"><textarea name="content" rows="8" cols ="91" size ="resize:none"></textarea></td>
					</tr>
				</table>

			<!-- 파일 업로드 하는 부분(file 타입형 input태그들) -->
				<div id ="fileArea">							   <!-- input태그가 눌리면 this(객체)와1을 매개변수로 LoadImg함수발동 -->	
					<input type="file" id ="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id ="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id ="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id ="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
				</div>
			
			<script>
				// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 부분
				$(function(){
					$("#fileArea").hide();	//파일업로드 하는 fileArea div숨기기
					
					// 사진이 들어간 div를 클릭시 thumbnailImg(n)클릭하는 효과가 나도록
					$("#titleImgArea").click(function(){
						$("#thumbnailImg1").click();
					});
					$("#contentImgArea1").click(function(){
						$("#thumbnailImg2").click();
					});
					$("#contentImgArea2").click(function(){
						$("#thumbnailImg3").click();
					});
					$("#contentImgArea3").click(function(){
						$("#thumbnailImg4").click();
					});
					
				});
				
				// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 부분(함수 - onchange="LoadImg(this,1)")
				function LoadImg(value, num){
					if(value.files[0] != undefined){	// 함수를 발동시킨 객체가 파일을 선택했다면 
						// value는 함수를 발동시킨 객체(file타입 input태그)이고
						// value.files[0]은 input태그로 파일을 선택 했으면 undefined가 아니고 선택 안했으면 undefined(null)다.		
						var reader = new FileReader();
						
						reader.onload = function(e){	// 파일 로딩이 다된다면
							switch(num){
							case 1:
								$("#titleImg").attr("src",e.target.result);	//이미지 변환작업
								break;
							case 2:
								$("#contentImg1").attr("src",e.target.result);
								break;
							case 3:
								$("#contentImg2").attr("src",e.target.result);
								break;
							case 4:
								$("#contentImg3").attr("src",e.target.result);
								break;
							}
						}
						reader.readAsDataURL(value.files[0]);	// 파일의 url까지 스트림에 넘겨준다
					}
				} 
			
			</script>
			
			</div>
			<br>
			<div class="btnArea">
				<button type ="reset">취소하기 </button>
				<button type ="submit">작성완료 </button>
			</div>
			<!-- InsertThumbnailServlet 만들러 ㄱㄱ!!!! -->
		</form>
	
	</div>




</body>
</html>