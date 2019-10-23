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
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
}
.detail{
    	width:950px;
} 
 .btnArea {
  width:300px;
   background : red;
   margin-left:auto;
   margin-right:auto;
      
}
   
.detail_other{
	width : 100%;
   	border:1px solid black;
   	margin-left : 9px;
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


table.detail {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  margin : 20px 10px;
}
table.detail th {
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
table.detail td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}


/* tr{
	border: 1px solid darkgray;
}
td{
	border: 1px solid darkgray;
} */


/* 다운로드 버튼 */

.down-btn1, .down-btn2 {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 15px;
}


/* Darker background on mouse-over */
.down-btn:hover {
  background-color: RoyalBlue;
}


.down-btn2{
	margin-left : 60px;
}



#goList-btn{
	background-color: #f1f1f1;
	border: none;
	margin-right : 20px;
	float : right;
	padding: 10px 16px;
	font-size: 15px;
	cursor: pointer;
	display : inline-block;
}  
#goList-btn:hover{
	background-color: #666;
	color: white;
} 
#update-btn{
	background-color: #f1f1f1;
	border: none;
	margin-right : 10px;
	float : right;
	padding: 10px 16px;
	font-size: 15px;
	cursor: pointer;
	display : inline-block;
}  
#update-btn:hover{
	background-color: #666;
	  color: white;
} 
</style>


</head>

	<%@ include file = "../common/header.jsp" %>

<body>


<div class = "outer">
<br>
		<h2 align = "center"> 사진 게시판 디테일 보기 </h2>
			
		<div class = "detail">
						
		<table class = "detail" align="center">
			<tr>
				<th width = "90px" height = "40px">제목</th>
				<td colspan = "5"> <%-- <label><%=b.getbTitle() %></label></td> --%>
				<input type="text" size="50" name="title" value="<%= b.getbTitle() %>" readonly></td>
				
			</tr>
			<tr>
				<th height = "40px"> 작성자 </th>
				<td colspan = "5">	<%-- <label><%=b.getbWriter() %></label></td> --%>
				<input type="text" name="writer" value="<%= b.getbWriter() %>" readonly></td>
			</tr>
			<tr>
				<th height = "40px"> 조회수 </th>
				<td colspan = "5"><label><%=b.getbCount() %></label></td>
			</tr>	
			<tr>
				<th height = "40px"> 작성일 </th>
				<td colspan = "5"><label><%=b.getModifyDate() %></label></td>
			</tr>		
			<tr>
				<th> 대표사진 </th>
				<td colspan="4">
					<div id="titleImgArea" align="center">
						<img id="titleImg" src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=titleImg.getChangeName() %>">
					</div>
				</td>
				<td>
					<button class="down-btn1" onclick ="location.href='<%=request.getContextPath() %>/download.th?fid=<%=titleImg.getfId() %>'">
						<i class="fa fa-download"></i> Download
					</button>
				</td>
			</tr>
			<tr>
				<th> 사진메모 </th>
				<td colspan = "6">
					<textarea name="content" cols="60" rows="15" style="resize:none" readonly><%= b.getbContent() %></textarea>
				</td>
			</tr>
		</table>
	
		<div class = "detail_other" style="align:center">
			<P align = "center"> 추가 이미지 </P>
			<hr>
				<% for(int i=1; i<fileList.size(); i++){ %>
					<div class = "detailImgArea">
						<img id ="detailImg" class="detailImg" src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=fileList.get(i).getChangeName() %>">
						<div class ="down-area" style="align:center">
						<button  class="down-btn2" onclick="location.href='<%=request.getContextPath() %>/download.th?fid=<%=fileList.get(i).getfId() %>'" >
							<i class="fa fa-download"></i> Download
						</button>				
						</div>
					</div>
				<%} %>
				<br><br>
		</div>	
		<br><br><br>
		<!-- 이제 파일을 다운로드 할 수 있도록 ThumbnailDownloadServlet 만들러 !!  -->
		
		<div class = "btnArea" align ="center">
			<button id = "goList-btn" onclick="location.href='<%=request.getContextPath()%>/list.th'">목록으로</button>	
			<%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
					<button id = "update-btn" type="submit" onclick="location.href='<%=request.getContextPath()%>/updateView.th?bid=<%=b.getbId()%>'">수정하기</button>				
			<%} %>	
					
		<!-- 	<button id  = "updateBtn" onclick ="updateTthumbnail();">수정하기</button> -->
			<!-- <button id  = "deleteBtn" onclick = "deleteThumbnail();">삭제하기</button> -->
		</div>
		<br><br><br>
	</div>
</div>
</body>
</html>