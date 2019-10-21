<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<%@ include file = "../common/header.jsp" %> 
<title>Insert title here</title>

<style>
#S-title{
	width : 100%;
}
#summernote{
	height : 600px;
	
}

#S_commit{
	float : left;
}

#S-list{
	float : right;
}

#S-table{
	width : 1100px;
	font-size: 12px;
	line-height: 24px;
	margin: 30px auto;
	text-align: left;
}


/* 사진아래 구분 공간 */
#thum1{
	background : black;
} 

th{
	background : #fafafa;
	text-align : center;
}

</style>

</head>

<body>

<br><br><br><br>
	<div>
	<img src="<%=request.getContextPath() %>/images/hdd.jpg" style="width:1550px; height:300px;">
		<div id = "thum1" style="width:100%; height:60px">
		</div>
	</div>
 <div class = "outer">
	<h2 align = "center">자료실 > 글쓰기 </h2>
<hr>																
		<form action = "<%=request.getContextPath()%>/insert.sh" method="post" encType="multipart/form-data">
		<table id = "S-table" border= "1">
			<tr>
				<th width = "200px" height = "80px">제목*</th>
				<td><input type ="text" name = "title" placeholder="제목을입력하세요" style="width:900px; height:35px;"></td>
			</tr>
			<tr>
				<th width = "200px"  height = "100px">작성자*</th>
				<td><input type ="text" style="height:35px;" value = "<%=loginUser.getUserName() %>" name = "writer" readonly>
				 <!-- 화면에는 출력안되지만 값을 servlet으로 담아 넘길때 필요함! hidden태그  -->
							<input type = "hidden" value ="<%=loginUser.getUserId() %>" name = "userId">
				 </td>
			</tr>
<!-- 			<tr>
				<th width = "200px"  height = "100px">작성일</th>
				<td><input type = "date" name = "date" required></td>
			</tr> -->
			<tr>
				<th> 내용</th>
				<td colspan="2">
			</tr>
			 	<td colspan ="2">
			 	<textarea name = "content" rows="9" cols ="180" style ="resize:none" required></textarea>
			 	<!-- <div id="summernote"></div> -->
			 	</td> 
			<tr>
				<th width = "200px"  height = "100px">파일선택</th>
				<td><input type="file" id ="thumbnailImg1" multiple="multiple" name="thumbnailImg1"></td>				
			</tr>
			<tr>
				<th width = "200px"  height = "100px">파일선택</th>
				<td><input type="file" id ="thumbnailImg2" multiple="multiple" name="thumbnailImg2"></td>
			</tr>
			<tr>
<!-- 				<td colspan = "2">
					<button id = "S-commit" onClick="S-commit();"> 등록 </button>
					<button id = "S-list"> 목록 </button>
				</td>
				 -->
			</tr>
			</table>
			
				
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
				
				</script>
				
			<div align ="center">
					<!-- 사용자가 입력을 잘못하면 입력했던 내용을 지워주는 reset타입 button만들자 -->
					<button type = "reset">취소하기 </button> 
					<button type = "submit">등록하기</button> <!-- submit버튼을 form안에 만들어 form을 넘겨준다 -->
			</div>
				<!-- InsertShareServlet 만들러가기 -->
				
				
	</form>
	
</div>

<br><br><br><br>


<script>

	$('#summernote').summernote({
	  height: 300,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true                  // set focus to editable area after initializing summernote
	});
	
	
</script>



</body>
</html>