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
</head>
<header>
	<%@ include file = "../common/header.jsp" %>
</header>
<body>


<div class = "outer">

		<h2 align="center">공지사항 수정하기</h2>
		<div class="tableArea">
		<form id ="updateForm" method ="post">	<!-- table부터 아래버튼까지 포함하는 form태그  -->	
			<table class = "detail" align="center">
			<tr>
				<th width = "90px" height = "40px">제목</th>
				<td colspan = "5"> <%-- <label><%=b.getbTitle() %></label></td> --%>
				<input type="text" size="50" name="title" value="<%= b.getbTitle() %>"></td>
				
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
					<textarea name="content" cols="60" rows="15" style="resize:none"><%= b.getbContent() %></textarea>
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
						<%-- <button  class="down-btn2" onclick="location.href='<%=request.getContextPath() %>/download.th?fid=<%=fileList.get(i).getfId() %>'" >
							<i class="fa fa-download"></i> Download
						</button> --%>				
						</div>
					</div>
				<%} %>
				<br><br>
		</div>	
		<br><br><br>
		
		
			<div align="center">
					<button onclick="update();">수정하기</button>	<!-- 여기는 일종의 submit버튼이 수정하기임 -->
					<!-- 버튼의 타입 default가 submit이라 따로 안적어줘도 버튼을 눌러도 submit이 됨 -->
					
					<button onclick="nDelete();">삭제하기</button>				
				</div>
				<!-- NoticeUpdateViewServlet 만들러 ㄱㄱ씽! -->
		</form>
				
				<script>
					//공지사항 수정하기 작업 먼저하기
					function update(){
						$("#updateForm").attr("action","<%=request.getContextPath()%>/update.th");
						// NoticeUpdateServlet 만들러 ㄱㄱ!
					}
					
					//공지사항 삭제하기
					function nDelete(){
						$("#updateForm").attr("action","<%=request.getContextPath()%>/nDelete.no");
						// NoticeDeleteServlet 만들러 ㄱㄱ!
						
					}
				
				</script>
				
		
		
		<br><br><br>
	</div>
</div>

</body>
</html>