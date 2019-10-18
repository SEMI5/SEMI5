<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, thumbnail.model.vo.*, java.util.ArrayList"%>
<%
	ArrayList blist = (ArrayList)request.getAttribute("blist");
	ArrayList flist = (ArrayList)request.getAttribute("flist");
	
	ArrayList<Thumbnail> list = (ArrayList<Thumbnail>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 현재 보고있는 페이지정보의 값을 변수로 선언함
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer{
      width:100%;
      height:1000px;
     /*  background:black; */
      /* color:white; */
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
      
}
/* 사진게시판 전체 css */
.thumbnailArea {
	  width : 90%;
      height:800px;
      margin-left:auto;
      margin-right:auto;
      /* z-index : 10; */
       
}
/* 검색 창 css */
.searchArea {
	 /*  background : blue; */
      width:400px;
      /* margin-left: 1000px; */
      margin-left: 66%;
 /*      margin-left:auto;
      margin-right:auto; */
     /*  z-index : 15; */
     
}
#searchCondition{
	 margin-left: 50px;
}

/* 썸네일 리스트 css */
.thumb-list {
      width:300px;
      border: 1px solid grey;
      display:inline-block;
      margin:10px;
      align:center;
}
.thumb-list:hover {
      opacity:0.8;
      cursor:pointer;
}

/* 페이징 처리 버튼 css */
.pagingArea button {
	  border: none;
	  outline: none;
	  padding: 10px 16px;
	  background-color: #f1f1f1;
	  cursor: pointer;
	  font-size: 10px;
}

.pagingArea button:hover {
	  background-color: #666;
	  color: white;
}

/* 썸네일 리스트 정보 좋아요버튼  */
#like_btn{
	 	background : white;
	 	border : none;
}
#like_btn:hover{
	  opacity:1.5;
      cursor:pointer;
}

/* 썸네일 확대  */
.trans:hover{
    -webkit-transform : scale(1.2,1.2);
}

/* 사진아래 구분 공간 */
#thum1{
	background : black;
} 

/* 작성하기 버튼 */
#writeBtn{
	background : black;
	border: none;
	color: white;
	margin-right : 80px;
	float : right;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
	display : inline-block;
}  
#writeBtn:hover{
	background-color: gray;
}
         
</style>

	
</head>
<header>
	<%@ include file = "../common/header.jsp" %>
</header>
<body>
	<div>
	<img src="<%=request.getContextPath() %>/images/photos.jpg" style="width:100%; height:300px;">
		<div id = "thum1" style="width:100%; height:60px">
		</div>
	</div>
 	<div class = "outer">
		<h2 align = "center"> 사진 게시판 </h2>
		<hr>
		<br>
		<label>총 <%=listCount %>건</label>
				<!-- 여기도 마찬가지로 검색 창을 만들어 주자, 역시 구현은 pass  -->
		<div class="searchArea">
			<select id ="searchCondition" name = "searchCondition">
				<option> --------- </option>
				<option value="writer"> 작성자 </option>
				<option value="title"> 제목 </option>
				<option value="content"> 내용 </option>
			</select>
			<input type ="search" id = "serach-bar">
			<button type ="submit" id = "submit-btn">검색하기 </button>
		</div>
		<div class = "thumbnailArea">
			 
			 <% if(list.isEmpty())	{%>
				<p>조회된 결과가 없습니다.</p>

			<%} else  {%> 
			
			<% for(Thumbnail b : list){%>
					
			<div class = "thumb-list" align ="center">
				<div class = "thumb-img">
						<input type ="hidden" value ="<%=b.getbId() %>">
						<% for(int j=0; j < flist.size(); j++){
							Attachment a = (Attachment)flist.get(j); %>
						
							<% if(b.getbId() == a.getbId()) {%>	  <!-- 체인지된 이름이 thumbnail_uploadFiles 경로로 업로드 됨  -->
								<img src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=a.getChangeName() %>"
												width = "150px" height ="150px" class ="trans">
							<% } %>
						<% } %>
				</div>
				<div>
				<p>No. <%= b.getbId() %><br> 
				제목 : <%=b.getbTitle() %><br>
					조회수 : <%= b.getbCount() %><br>
					<button id = "like_btn">
						<img src="<%=request.getContextPath() %>/images/icon/like.png" width="50px">
					</button>
					
					<p id = "p2" style = "width:30px; height:30px; border:1px solid red;"></p>
				</p>
				</div>
			</div>
			<% } %>
		<% } %>
			<!-- 로그인 아닐시 안보임  -->
			<div class = "writeArea">
			<%if(loginUser != null) {%>
				<button id = "writeBtn" onclick ="location.href='views/thumbnail/thumbnailIsertForm.jsp'">작성하기</button>
			<%} %>
			<!-- thumbnailInsertForm.jsp 만들러가기 !! -->
			</div>
		</div>
		
		<!-- 페이징 처리 시작 -->
		<div class = "pagingArea" align = "center">
			<!-- 맨 처음으로 (<<)  -->				<!-- 쿼리스트링 (url주소 적고 form태그의 get방식으로 넘기면 currentPage에 1을 담아서 넘어간다 -->	
			<button onclick ="location.href='<%=request.getContextPath() %>/list.th?currentPage=1'"> << </button>
																	<!-- currentPage에 1을 담아 list.th페이지로 넘어간다. -->
		
			<!-- 이전 페이지로 (<)  -->
			<%if(currentPage <= 1) {%>
				<button disabled> < </button>	<!-- <버튼이 안눌리게 -->
			<%} else { %>
				<button onclick = "location.href='<%=request.getContextPath() %>/list.th?currentPage=<%=currentPage -1 %>'"> < </button>
				
			<%} %>
			
			<!-- 10개의 페이지 목록 -->
			<%for(int p = startPage; p <= endPage; p++) {%>
				<% if(p == currentPage){%>
					<button disabled><%=p %></button>
				<%} else { %>
					<button onclick = "location.href='<%=request.getContextPath() %>/list.th?currentPage=<%=p %>'"><%=p %></button>
				<%} %>
			
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(currentPage >= maxPage){ %>
				<button disabled> > </button>
			<%} else { %>
				<button onclick = "location.href='<%=request.getContextPath() %>/list.th?currentPage=<%=currentPage +1 %>'"> > </button>			
			<%} %>
				
				
			<!-- 맨 끝으로(>>) -->	
				<button onclick ="location.href='<%=request.getContextPath() %>/list.th?currentPage=<%=maxPage %>'"> >> </button>
				
		</div>	
		

	</div>

	  
	<script>
	
		$(function(){
			$(".thumb-img").click(function(){
				var bid=$(this).children().eq(0).val();	
								  <%-- <input type ="hidden" value ="<%=b.getbId() %>"> --%>
				location.href="<%=request.getContextPath()%>/detail.th?bid="+bid;
				// ThumbnailDetailServlet 만들러 가기 
			});
		});
	
		
		/* 좋아요 ajax */
		
		$("#like_btn").click(function(){
			var like = $("#like_btn").val();
			
			$.ajax({
				url : "/KH_Groupware/like.th",
				type : "get",
				data : {
						like : like
				},			// 서블릿으로 보낼 서블릿주소,방식,데이터변수 설정 
				success : function(data){	//서블릿에서 연산처리된 결과값 result가 data에 담겨옴
					$("#p2").text(data);
				}
				
			});
			
		});
		
		
	</script>

	


</body>
</html>