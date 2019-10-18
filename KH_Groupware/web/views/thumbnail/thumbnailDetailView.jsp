<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="thumbnail.model.vo.*,java.util.*"%>
    
<%
	Thumbnail b = (Thumbnail)request.getAttribute("thumbnail");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	
	/* 대표사진 - (fileLevel=0) */
	Attachment titleImg = fileList.get(0);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
      width:1000px;
      height:650px;
      boader : 1px solid black;
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
}
.detail{
     width:1000px;
     border:1px solid black;
} 
   
.detail_other{
   	border:1px solid black;
}
#titleImgArea {
      width:500px;
      height:300px;
      margin-left:auto;
      margin-right:auto;
      boader : 1px solid black;
}
#contentArea {
      height:60px;
      boader : 1px solid red;
}

.detailImgArea {
      width:235px;
      height:210px;
      margin-left:auto;
      margin-right:auto;
      boader : 1px solid black;
      display : inline-block;
      
}
#titleImg {
      width:500px;
      height:300px;
}
.detailImg {
      width:250px;
      height:180px;
      margin : 15px;
}
.down-btn{
		margin-left : 100px;
}
tr{
	border: 1px solid darkgray;
}
td{
	border: 1px solid darkgray;
}
</style>


</head>
<header>
	<%@ include file = "../common/header.jsp" %>
</header>
<body>


<div class = "outer">

			
		<div class = "detail">
						
			<%-- 			<div id ="t_title_label">제목 </div>
						<label><%=b.getbTitle() %></label><br><br>
						
						<div id ="t_writer_label">작성자 </div>
						<label><%=b.getbWriter() %></label><br><br>
						
						<div id ="t_count_label">조회수 </div>
						<label><%=b.getbCount() %></label><br><br>
						
						<div id ="t_date_label">작성일 </div>
						<label><%=b.getModifyDate() %></label><br><br>
						
						<div id ="t_mainthum_label">대표이미지 </div>	
							<div id="titleImgArea" align="center">
								<img id="titleImg" src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=titleImg.getChangeName() %>">
							</div><br><br>
					
					<button onclick ="location.href='<%=request.getContextPath() %>/download.th?fid=<%=titleImg.getfId() %>'">다운로드</button>
					<br><br>
					
				<div id ="t_conetent_label">사진메모 </div>	
					<p id = "contentArea"><%=b.getbContent() %></p>
		</div><br><br> --%>			
						
						
						
		<table class = "detail" align="center">
			<tr>
				<td width = "90px" height = "40px">제목</td>
				<td colspan = "5"><label><%=b.getbTitle() %></label></td>
			</tr>
			<tr>
				<td height = "40px"> 작성자 </td>
				<td colspan = "5"><label><%=b.getbWriter() %></label></td>
			</tr>
			<tr>
				<td height = "40px"> 조회수 </td>
				<td colspan = "5"><label><%=b.getbCount() %></label></td>
			</tr>	
			<tr>
				<td height = "40px"> 작성일 </td>
				<td colspan = "5"><label><%=b.getModifyDate() %></label></td>
			</tr>		
			<tr>
				<td> 대표사진 </td>
				<td colspan="4">
					<div id="titleImgArea" align="center">
						<img id="titleImg" src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=titleImg.getChangeName() %>">
					</div>
				</td>
				<td>
					<button onclick ="location.href='<%=request.getContextPath() %>/download.th?fid=<%=titleImg.getfId() %>'">다운로드</button>
				</td>
			</tr>
			<tr>
				<td> 사진메모 </td>
				<td colspan = "6">
					<p id = "contentArea"><%=b.getbContent() %></p>
				</td>
			</tr>
		</table>
	
		<div class = "detail_other" style="align:center">
			<P align = "center"> 추가 이미지 </P>
				<% for(int i=1; i<fileList.size(); i++){ %>
					<div class = "detailImgArea">
						<img id ="detailImg" class="detailImg" src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=fileList.get(i).getChangeName() %>">
						<div class ="down-btn" style="align:center">
						<button onclick="location.href='<%=request.getContextPath() %>/download.th?fid=<%=fileList.get(i).getfId() %>'" >
							다운로드
						</button>				
						</div>
					</div>
				<%} %>
				<br><br>
		</div>	
		<br><br><br>
		<!-- 이제 파일을 다운로드 할 수 있도록 ThumbnailDownloadServlet 만들러 !!  -->
		
		<div class = "btns" align ="center">
			<button id = "goMain" onclick ="goMain();">메인으로</button>
			<button id  = "updateBtn" onclick ="updateTthumbnail();">수정하기</button>
			<button id  = "deleteBtn" onclick = "deleteThumbnail();">삭제하기</button>
		</div>
	</div>
</div>
</body>
</html>