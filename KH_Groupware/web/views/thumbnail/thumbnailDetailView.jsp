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
      background:black;
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   .detail td{
      text-align:center;
      width:1000px;
      border:1px solid white;
   }
   #titleImgArea {
      width:500px;
      height:300px;
      margin-left:auto;
      margin-right:auto;
   }
   #contentArea {
      height:30px;
   }
   .detailImgArea {
      width:250px;
      height:210px;
      margin-left:auto;
      margin-right:auto;
   }
   #titleImg {
      width:500px;
      height:300px;
   }
   .detailImg {
      width:250px;
      height:180px;
   }
   
.btns{
	
}

</style>


</head>
<header>
	<%@ include file = "../common/header.jsp" %>
</header>
<body>


<div class = "outer">
		<table class = "detail" align="center">
			<tr>
				<td width = "50px">제목</td>
				<td colspan = "5"><label><%=b.getbTitle() %></label></td>
			</tr>
			<tr>
				<td> 작성자 </td>
				<td><lable><%=b.getbWriter() %></lable></td>
				<td> 조회수 </td>
				<td><label><%=b.getbCount() %></label></td>
				<td> 작성일 </td>
				<td><label><%=b.getModifyDate() %></label></td>
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
	
		<table class = "detail">
			<tr>
				<% for(int i=1; i<fileList.size(); i++){ %>
				<td>
					<div class = "detailImgArea">
						<img id ="detailImg" class="detailImg" src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=fileList.get(i).getChangeName() %>">
						<button onclick="location.href='<%=request.getContextPath() %>/download.th?fid=<%=fileList.get(i).getfId() %>'">
							다운로드
						</button>				
					</div>
				</td>
				<%} %>
				
			</tr>
			
		</table>	
		<!-- 이제 파일을 다운로드 할 수 있도록 ThumbnailDownloadServlet 만들러 !!  -->
		
		<div class = "btns" align ="center">
			<button id = "goMain" onclick ="goMain();">메인으로</button>
			<button id  = "updateBtn" onclick ="updateMember();">수정하기</button>
			<button id  = "deleteBtn" onclick = "deleteMember();">탈퇴하기</button>
		</div>
</div>
</body>
</html>