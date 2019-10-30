<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, thumbnail.model.vo.*, java.util.ArrayList"%>
<%
	ArrayList blist = (ArrayList)request.getAttribute("blist");
	ArrayList flist = (ArrayList)request.getAttribute("flist");
	
	//System.out.print("view blist : " + blist);
	//System.out.print("view flist : " + flist);
	
	
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	  width : 95%;
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
      width:330px;
      height : 370px;
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


/* 썸네일 확대  */
.trans:hover{
    -webkit-transform : scale(1.1,1.1);
}

/* 사진아래 구분 공간 */
#thum1{
	background : black;
} 

/* 작성하기 버튼 */
#writeBtn {
  padding: 15px 25px;
  font-size: 13px;
  text-align: center;
  cursor: pointer;
  outline: none;
  /* background-color: #f1f1f1; */
  background-color: black; 
  border: none;
  border-radius: 15px;
  box-shadow: 0 5px #999;
  margin-right : 80px;
  float : right;
  border-radius: 16px;
  color : white;
}

#writeBtn:hover {
	color : white;
	/* background-color: #666; */
	background-color: #f53f29; 
	border-radius: 16px;
}

#writeBtn:active {
	color : white;
/*   background-color: #666; */
  	background-color: #f53f29; 
  box-shadow: 0 3px #666;
  transform: translateY(4px);
   border-radius: 16px;
}


/* #writeBtn{
	background-color: #f1f1f1;
	border: none;
	margin-right : 80px;
	float : right;
	padding: 10px 16px;
	font-size: 15px;
	cursor: pointer;
	display : inline-block;
}  
#writeBtn:hover{
	background-color: #666;
	  color: white;
} */

#listcountDiv{
		border:none;
		width: 200px;
		height: 50px;
		position: relative;
		font-size: 16px;
	  	display: inline-block;
	  	padding-left: 30px;
	  	padding-top:6px;
	} 
	
.lisCountSpan{
	color: #f53f29;
}      

::-webkit-scrollbar {

display:none;

}
-ms-overflow-style: none; 
	
</style>

	
</head>
<header>
	<%@ include file = "../common/header.jsp" %>
</header>
<body>
 <div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->
	<div>
	<img src="<%=request.getContextPath() %>/images/photos.jpg" style="width:100%; height:300px;">
	</div>
 	<div class = "outer">
		<h2 align = "center"> 사진 게시판 </h2>
		<hr>
		<br>
		<div id = listcountDiv><b>총 <span class=lisCountSpan><%=listCount%></span>건,(<span class=lisCountSpan><%=currentPage%></span>/<%=maxPage%>)</b></div>

 
		<div class = "thumbnailArea">
		<%if(loginUser != null) {%>	 
			 <% if(blist.isEmpty())	{%>
				<p>조회된 결과가 없습니다.</p>
				
			<%} else  {%> 
				
			<% for(Thumbnail b : list){%>
					
			<div class = "thumb-list" align ="center">
				<div class = "thumb-img">
						<input type ="hidden" value ="<%=b.getbId() %>">
						<% for(int j=0; j < flist.size(); j++){		// flist.size()
							Attachment a = (Attachment)flist.get(j); %>
						
							<% if(b.getbId() == a.getbId()) {%>	  <!-- 체인지된 이름이 thumbnail_uploadFiles 경로로 업로드 됨  -->
								<img src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=a.getChangeName() %>"
												width = "330px" height ="370" class ="trans">
							<% } %>
						<% } %>
					<div id ="thuminfo-list">
					 <p style = "font-size : 1.5em;"><%=b.getbTitle() %></p>
					<p>No. <%= b.getbId() %><br> 
						조회수: <%= b.getbCount() %><br>
					</p>
					</div>
				</div>
					<%-- <button id = "like_btn">
						<img src="<%=request.getContextPath() %>/images/icon/like30.png" width="30px">
					</button> --%>
			</div>
			<% } %>
		<% } %>
	<%} %>
	<br><br><br><br><br><br><br><br><br><br>
			<!-- 로그인 아닐시 안보임  -->
			<div class = "writeArea">
			<%if(loginUser != null) {%>
				<button id = "writeBtn" onclick ="location.href='views/thumbnail/thumbnailIsertForm.jsp'">작성하기</button>
			<%} %>
			<!-- thumbnailInsertForm.jsp 만들러가기 !! -->
			</div>
		</div>
		
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
		
		
	</script>

</div><!-- container -->
</div><!-- mainContent -->	
 <%@ include file = "../common/footer.jsp" %> 
</body>
</html>