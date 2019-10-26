<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, share.model.vo.*, java.util.ArrayList"%>
    

<%

	ArrayList<Attachment> flist = (ArrayList<Attachment>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	//System.out.print("view pi ::::::::::" + pi);
	
	
	// 현재 보고있는 페이지정보의 값을 변수로 선언함
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

	int i=-1;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>

/* 다운로드 버튼 */

.down-btn1{
 /*  background-color: DodgerBlue; */
  background-color: #f53f29; 
  border: none;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 15px;
  margin-left : 17%;
  border-radius: 16px;
   box-shadow: 0 3px #999;
}


/* Darker background on mouse-over */
.down-btn1:hover {
  	background-color: #c43220;
/*   background-color: RoyalBlue; */
	border-radius: 16px;
	  box-shadow: 0 2px #999;
}


.down-btn2{
	margin-left : 60px;
}
#write{
	width : 600px;
	border : 1px solid black;

}

table{
      border-top: 2px solid black; 
      border-bottom: 2px solid black; 
      border-spacing:0px;
   }
th{
      height: 50px;
      font-size: 20px;
     
}
   
tr{
      font-size: 18px;
      height: 50px;
      
}
  

td{
    border-bottom: 1px solid lightgray;
}

/* place holder 감추기*/
   input:focus::-webkit-input-placeholder, textarea:focus::-webkit-input-placeholder { /* WebKit browsers */ color:transparent; } 
   input:focus:-moz-placeholder, textarea:focus:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ color:transparent; } 
   input:focus::-moz-placeholder, textarea:focus::-moz-placeholder { /* Mozilla Firefox 19+ */ color:transparent; } 
   input:focus:-ms-input-placeholder, textarea:focus:-ms-input-placeholder { /* Internet Explorer 10+ */ color:transparent; }

input{
      
      width: 450px; 
      height: 40px;
 }

#outer{
       width: 100%;
       position: absolute;
       border:none;
       padding: 10px;
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
/* 파일업로드 영역 */
#file-upload-area{
	width : 40%;
	margin-left : 30%;
	border : 1px solid black;
}

/* 파일업로드 버튼 */
#upload-btn{
	cursor : pointer;
	background-color: black; 
	color: white;
	font-size: 16px;
	border-radius: 10px;
   box-shadow: 0 3px #999;
}
/* 파일업로드 버튼 */
#upload-btn:hover{
	cursor : pointer;
	background-color: #f53f29; 
	color: white;
	font-size: 16px;
	border-radius: 10px;
   box-shadow: 0 1px #999;
}



.btnDiv{
		border-top: 1px solid darkgray;
		height: 80px;
		text-align: center;
		padding-top: 30px;
}

#listBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 70px;
	   cursor : pointer;
	   border-radius: 10px;
   	   box-shadow: 0 3px #999;
}
	
#listBtn:hover{
	   background-color: darkgray;
	   color: white;
	   border-radius: 10px;
   	   box-shadow: 0 1px #999;
}
	
#insertBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 70px;
	   cursor : pointer;
	   border-radius: 10px;
   	   box-shadow: 0 3px #999;
}
	
#insertBtn:hover{
	   background-color: #f53f29; 
	   color: white;
	   border-radius: 10px;
   	   box-shadow: 0 1px #999;
}
	
#down-table th{
	background : #eaeaea;
}	
	
</style>

<header>
	<%@ include file = "../common/header.jsp" %>
</header>
<body>
	<div>
	<img src="<%=request.getContextPath() %>/images/hdd.jpg" style="width:100%; height:300px;">
		<div id = "thum1" style="width:100%; height:60px">
		</div>
	</div>
 	<div class = "outer">
		<h2 align = "center"> 자료실 </h2>
		<hr>
		<br>
		<%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
		<form id= insertForm action = "<%=request.getContextPath()%>/insert.sh" method="post" encType="multipart/form-data">
		<div id = "file-upload-area" >
		<h2 align = "center"> 자료 업로드하기 </h2>
			<table>
				<tr>
					<td width = "157px" style="padding: 16px;">제목</td>
					<!-- <td><input type="text" id = "upload-title" size ="50" name ="title" readonly></td> -->
						<td><input id = "attachInput1" type="text" placeholder="첨부파일을 등록하세요" readonly></td>
				</tr>
				
				<tr>
					<td style="padding: 16px">파일선택</td>
					<td> 
						<div id="upload-div">
							<!-- <input type ="button" id = "upload-btn" value="찾아보기" style="width: 150px;"> -->
							<button type="button" id= "upload-btn" class="attachBtn" onclick="fileInputClick();" style="width: 200px; height:40px"><b>찾아보기</b></button>
						</div>
					</td>
				</tr>
			</table>
				<div id ="fileArea" style="display:none">
						<input type="file" id="fileInput1" name = "file1" onchange="loadAttachName(this,1);" style="font-size : 1em; margin-top:15px;">
				</div>
		</div>
			<div class= btnDiv>
				<button type="reset" id="listBtn"><b>취소</b></button>&nbsp;&nbsp;
				<button id="insertBtn" type="button" onclick="insertSubmit();"><b>등록</b></button>
			</div>
		<%} %>	
	</form>
	
			
	<br><br><br><br><br>
		<div class = "thumbnailArea">
		<% if(flist.isEmpty()){ %>
              <h3>조회된 리스트가 없습니다</h3>
            <%}else{ %>
			<table id="down-table" border ="1" align="center">
				<tr>
					<th width = "200px" height ="150px">순번</th>
					<th width = "200px" height ="150px">제목</th>		
					<th width = "200px" height ="150px">다운로드</th>
					<th width = "200px" height ="150px">다운로드 횟수</th>
					
				</tr>
				<tr>
               <% for(Attachment a : flist){ %>
               		<%i = i+1 ;%>
						<td align="center"><%=a.getRnum()%></td>
						<td align="center"><%=a.getOriginName()%></td>
												 
						   <td>
						   <%if(flist.isEmpty()){ %>
						   		<p> 다운받을 자료가없습니다.</p>	 
							<%}else {%>
							<button class="down-btn1" onclick = "downloadBtn(count<%=i%>,<%=a.getfId()%>);">
								<i class="fa fa-download"></i> Download
								<input type = "hidden" value =<%=a.getfId()%> > 
							</button>
							<%} %>
						</td> 
					
						<td align="center"><span id= "count<%=i%>"><%=a.getDownloadCount()%></span></td>
					</tr>
                 <%}%>
               <%} %>
			</table>		
		</div>
		<br><br>
	</div>
			
		<!-- 페이징 처리 시작 -->
		<div class = "pagingArea" align = "center">
			<!-- 맨 처음으로 (<<)  -->				<!-- 쿼리스트링 (url주소 적고 form태그의 get방식으로 넘기면 currentPage에 1을 담아서 넘어간다 -->	
			<button onclick ="location.href='<%=request.getContextPath() %>/list.sh?currentPage=1'"> << </button>
																	<!-- currentPage에 1을 담아 list.th페이지로 넘어간다. -->
		
			<!-- 이전 페이지로 (<)  -->
			<%if(currentPage <= 1) {%>
				<button disabled> < </button>	<!-- <버튼이 안눌리게 -->
			<%} else { %>
				<button onclick = "location.href='<%=request.getContextPath() %>/list.sh?currentPage=<%=currentPage -1 %>'"> < </button>
				
			<%} %>
			
			<!-- 10개의 페이지 목록 -->
			<%for(int p = startPage; p <= endPage; p++) {%>
				<% if(p == currentPage){%>
					<button disabled><%=p %></button>
				<%} else { %>
					<button onclick = "location.href='<%=request.getContextPath() %>/list.sh?currentPage=<%=p %>'"><%=p %></button>
				<%} %>
			
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(currentPage >= maxPage){ %>
				<button disabled> > </button>
			<%} else { %>
				<button onclick = "location.href='<%=request.getContextPath() %>/list.sh?currentPage=<%=currentPage +1 %>'"> > </button>			
			<%} %>
				
				
			<!-- 맨 끝으로(>>) -->	
				<button onclick ="location.href='<%=request.getContextPath() %>/list.sh?currentPage=<%=maxPage %>'"> >> </button>
				
		</div>	
		
		
		<script>
				
		 function insertSubmit(){
				$("#insertForm").submit();	
			} 
		 
		 
			function fileInputClick(){
			 	$("#fileInput1").click(); 
			}
			
			
			function loadAttachName(attach,num){
				
				if(attach.files[0]!=undefined){ 
					var fileValue = $("#fileInput"+num).val().split("\\");
						var fileName = fileValue[fileValue.length-1]; // 파일명
						$("#attachInput"+num).val(fileName); 
				}
			}

		 </script>
		 

	<!-- ㅇ여기는 Ajax 관련 코드  -->
	<!-- Ajax로 댓글 입력 부분을 완성해보자  -->

 	<script>
		
 	function downloadBtn(count, fid){
 		
 		location.href="<%=request.getContextPath() %>/download.sh?fid=" +fid; 
 	
   // 위 주소로 가서 메소드가 완료되야 카운트가 1증가한다. 
   // 맨처음은 완료되지않아서 에이작스도 현재값이나온다. 
   // 두번쨰부턴, 첫번째 실행했떤 메소드의 카운트증가가 체크되서 그다음부턴 1씩증가. 
 	
	 	$.ajax({	
			url : "/KH_Groupware/ajaxDown.sh",
			type : "post",
			data: { fid1: fid
				
			},
			success : function(data){
				
			 	$(count).text(data.downloadCount+1); 
			},
			error : function(data){
				console.log("실패");
			}
	 		
 		});
	}
	
	</script>
	
	
			
			
			
			
			
			
			
			
			
			

</body>
</html>