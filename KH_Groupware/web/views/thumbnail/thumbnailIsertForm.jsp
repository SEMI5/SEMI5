<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
    width:100%;
    height:100%;
  /*     background: red; */
    coclor:black;
    margin-left:auto;
    margin-right:auto;
    margin-top:50px;
  
}
/* table{
      text-align :center;
} */

/* table td {
	border: 1px solid lightgray;
} */


.insertArea {
	/* background : red; */
	width:950px;
	height:100%;
	margin-left:auto;
	margin-right:auto;
}

.btnArea {
   width:150px;
   margin-left:auto;
   margin-right:auto;
      
}
   
#titleImgArea {
  	display: inline-block;
  	/* width:350px;
  	height:200px; */
	
    text-align:center;
     display:table-cell;
    vertical-align:middle;    
}

#titleImgArea:hover, #contentImgArea1:hover, 
#contentImgArea2:hover, #contentImgArea3:hover , #contentImgArea4:hover {
      cursor:pointer;
}
   
#contentImgArea1, #contentImgArea2, #contentImgArea3, #contentImgArea4 {
    display: inline-block;
    text-align:center;
    display:table-cell;
    vertical-align:middle;
}

table.type02 {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  margin : 20px 10px;
}
table.type02 th {
    width: 500px;
    padding: px;
    font-weight: bold;
    text-align : center;
    vertical-align: center;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    background: #eee;
}
table.type02 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

</style>
</head>
<header>
	<%@ include file = "../common/header.jsp" %>
</header>
<body>

<!-- 사진 게시판 작성은 두개의 테이블에 저장되게 한다 (게시판의 타입 2번, Attachment테이블  -->
	<div class = "outer">
		<br>
		<h2 align = "center"> 사진 게시판 작성 </h2>
		<form action = "<%=request.getContextPath()%>/insert.th" method="post" encType="multipart/form-data">		<!-- ***form태그를 가지고 encType=인코딩 타입 /multipart/form-data(파일업로드) 보냄-->
			<div class = "insertArea" style="align:center">
					
				 <table class="type02" align="center">	
					<tr>
						<th>제목</th>
						<td><input type="text" size ="114" name ="title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><label><%=loginUser.getUserName() %></label></td>
					</tr>
					<tr>
						<th> 대표이미지 </th>
						<td>
							<div id = "titleImgArea">
								<img id ="titleImg" width ="755" height ="500">
							</div>
						</td>					
					</tr>
					<tr>
						<th>사진 메모 </th>
						<td><textarea name="content" rows="10" cols ="102" size ="resize:none"></textarea></td>
					</tr>
					<tr>
						<th> 내용사진 </th>
						<td>
							<div id="contentImgArea1">
								<img id ="contentImg1" width ="185" height ="180">
							</div>						
							<div id="contentImgArea2">
								<img id ="contentImg2" width ="185" height ="180">
							</div>		
							<div id="contentImgArea3">
								<img id ="contentImg3" width ="185" height ="180">
							</div>		
							<div id="contentImgArea4">
								<img id ="contentImg4" width ="185" height ="180">
							</div>		
						</td>
					</tr>
					
				</table>

			<!-- 파일 업로드 하는 부분(file 타입형 input태그들) -->
				<div id ="fileArea">							   <!-- input태그가 눌리면 this(객체)와1을 매개변수로 LoadImg함수발동 -->	
					<input type="file" id ="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id ="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id ="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id ="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
					<input type="file" id ="thumbnailImg5" multiple="multiple" name="thumbnailImg5" onchange="LoadImg(this,5)">
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
					$("#contentImgArea4").click(function(){
						$("#thumbnailImg5").click();
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
							case 5:
								$("#contentImg4").attr("src",e.target.result);
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
	
	<br><br><br><br><br>
	


</body>
</html>