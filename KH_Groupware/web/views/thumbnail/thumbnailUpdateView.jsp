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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
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
     width:1000px;
} 
   
.detail_other{
	width : 100%;
   	border:1px solid black;
   	margin-left : 9px;
   	height: 270px;
}
#titleImgArea {
      width:500px;
      height:300px;
      margin-left:auto;
      margin-right:auto;
      position: relative; 
}

#titleImg{
      position: absolute; 
      left: 0px;
}


#contentArea {
      height:60px;
      border : 1px solid red;
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
      position: absolute;
      z-index: 1;
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


.btnArea {
  width:400px;
   margin-left:auto;
   margin-right:auto;
      
}
#goList-btn, #update-btn, #delete-btn{
	background-color: #f1f1f1;
	border: none;
	margin-right : 20px;
	float : right;
	padding: 10px 16px;
	font-size: 15px;
	cursor: pointer;
	display : inline-block;
}  
#goList-btn:hover, #update-btn:hover, #delete-btn:hover{
	background-color: #666;
	color: white;
} 


.hoverBlack0{   /* 타이틀 호버블랙 상세 설정 */
	width: 100%; 
	height: 300px;
	position: relative; 
	left: 0px;
	background: black;
	opacity: 0.8;
	z-index: 2;
	color: white;
	display:none; 
}

.deleteBtn0{	/* 타이틀 델리트버튼 상세 설정 */
	width: 70px;
	height: 40px;
	position: relative;
	background: darkgray;
	color: white; 
	outline: none;
	border: none;
	z-index: 10;
	font-weight: bold;
	top: -180px;
	right: 60px;
	display:none; 
}


.addBtn0{	/* 타이틀 에드버튼 상세 설정 */
	top: -220px;
	left: 40px;
	width: 100px;
	height: 40px; 
	background: darkgray;
	position: relative;
	color: white; 
	outline: none;
	border: none;
	z-index: 10;
	font-weight: bold;
	display:none; 

}



.hoverBlack9{  /* 아래 디테일이미지 호버블랙 상세 설정 */
	position:relative;
	left: 15px;
	top: -70px;
	width: 250px;
	height: 190px;
	 display:none;  
	
}


.deleteBtn9{	 /* 아래 디테일이미지 델리트버튼 상세 설정 */
	left: 45px;
	top: 90px;
	 display:none;  
}

.addBtn9{			/* 아래 디테일이미지 에드 버튼 상세 설정 */
 	left: 125px;
	top: 50px;
	 display:none;  
	
}


.hoverBlack1{
	 display:none;  
}


.deleteBtn1{	
	display:none; 
}


.addBtn1{		
	display:none; 
}






.hoverBlack{	/* 호버블랙 공통 설정 */
	background: black;
	opacity: 0.8;
	z-index: 2;
	color: white;
	
}

.deleteBtn{
	width: 70px;
	height: 40px;
	position: relative;
	background: darkgray;
	color: white; 
	outline: none;
	border: none;
	z-index: 10;
	font-weight: bold;
 
} 

.addBtn{
	width: 100px;
	height: 40px; 
	background: darkgray;
	position: relative;
	color: white; 
	outline: none;
	border: none;
	z-index: 10;
	font-weight: bold;
 	
} 


.deleteBtn:hover{
	background: white;
	color: black;
	font-weight: bold;
	cursor:pointer;
}


.addBtn:hover{
	cursor:pointer;
	background: white;
	color: black;
	font-weight: bold;

}


.resetBtn{
	background-color: #f1f1f1;
	border: none;
	margin-right : 20px;
	float : right;
	padding: 10px 16px;
	font-size: 15px;
	cursor: pointer;
	display : inline-block;

}

.resetBtn:hover{
background-color: #666;
	color: white;
}
</style>

<header>
	<%@ include file = "../common/header.jsp" %>
</header>
<body>
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->
				<div class = "outer">
				
						<%-- <form id ="updateForm" method ="post" encType="multipart/form-data" action="<%=request.getContextPath()%>/update.th"> --%>	<!-- table부터 아래버튼까지 포함하는 form태그  -->	
							<form id ="updateForm" method ="post" action="<%=request.getContextPath()%>/update.th">
								<input type = "hidden" name = "bid" value = "<%= b.getbId() %>">
							<h2 align="center">자료실 수정하기</h2>
						<div class="tableArea">
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
								<th height = "40px"> 작성일 </th>
								<td colspan = "5"><label><%=b.getModifyDate() %></label></td>
							</tr>		
							<tr>
								<th> 대표사진 </th>
								<td id = "titleTd" colspan="4">
									<div id="titleImgArea" align="center">
										<img id="titleImg" src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=titleImg.getChangeName() %>">
										<div class = " hoverBlack hoverBlack0"></div>
										<button  class= "deleteBtn deleteBtn0" type= "button" onclick= "delTitleImg();">삭제 </button>
										<button class= "addBtn addBtn0" onclick = "addTitleImg();" type= "button" >다른사진추가</button>
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
							<P align = "center">추가 이미지 </P>  
							<hr>
								<% for(int i=1; i<fileList.size(); i++){ %>
									<div class = "detailImgArea<%=i%> detailImgArea">
										<img id="contentImg<%=i+1%>" class="detailImg" src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=fileList.get(i).getChangeName() %>">
										<button class="deleteBtn deleteBtn9" type= "button" onclick= "delContentImg(<%=i+1%>, <%=fileList.get(i).getfId()%>);">삭제</button>
										<button class ="addBtn addBtn9"  type= "button" onclick = "addContentImg(<%=i+1%>, <%=fileList.get(i).getfId()%>);">다른 사진추가</button>
										<div class="hoverBlack hoverBlack9"></div>
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
						
								<div class="btnArea"  align ="center">
									
									<button id = "goList-btn" onclick="location.href='<%=request.getContextPath()%>/detail.th'">뒤로가기</button>
									<button id="update-btn" type= "button" onclick="update();">수정</button>	
									 <button id="delete-btn" onclick="nDelete();">삭제</button>
									<button class= "resetBtn" type = "button" onClick="window.location.href=window.location.href"> 리셋 </button>
								</div>
							</div>
					</form>		
					
					
								<script>
				 					//공지사항 수정하기 작업 먼저하기
									function update(){
										<%-- $("#updateForm").attr("action","'<%=request.getContextPath()%>/update.th'"); --%>
										$("#updateForm").submit();
										// ThumbnailUpdateServlet 만들러 ㄱㄱ!
									}
									
									//공지사항 삭제하기
									function nDelete(){
										$("#updateForm").attr("action","<%=request.getContextPath()%>/tDelete.th");
										// ThumbnailDeleteServlet 만들러 ㄱㄱ!
										
									} 
								
								</script>
					
						
						
						<br><br><br>
						
						   <!--  현재 이 게시글에 있는  맨 처음 사진들 fid-->
				
							<input  id= "presentTitlefid" type = "text"  value=   <%=titleImg.getfId() %> readonly ><br>
							
							<% for(int i=1; i<fileList.size(); i++){ %>
								<input id= "presentContentfid<%=i+1%>" type = "text"  value=   <%=fileList.get(i).getfId()%> readonly ><br>
							<%} %>
							
							
						   <!--  삭제해야할 fid 목록  -->
							<br> 
								<input id="delImg1" type = "text" readonly> 
								<input id="delImg2" type = "text" readonly> 
								<input id="delImg3" type = "text" readonly> 
								<input id="delImg4" v type = "text" readonly> 
								<input id="delImg5" type = "text" readonly> 
							<br>
				
					       <!--  새롭게 업로드 시켜야하는 fid 목록  -->		
						
				 			<!-- 파일 업로드 하는 부분(file 타입형 input태그들) -->
				
								<br>
								<div id ="fileArea">							
									<input type="file" id ="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)"><br>
									<input type="file" id ="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)"><br>
									<input type="file" id ="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)"><br>
									<input type="file" id ="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)"><br>
									<input type="file" id ="thumbnailImg5" multiple="multiple" name="thumbnailImg5" onchange="LoadImg(this,5)"><br>
								</div>
						
						
						<br><br>
						
					</div>
</div><!-- container -->
</div><!-- mainContent -->
<%@ include file = "/views/common/footer.jsp" %>					
</body>

	<script> 
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
								$("#contentImg2").attr("src",e.target.result);
								break;
							case 3:
								$("#contentImg3").attr("src",e.target.result);
								break;
							case 4:
								$("#contentImg4").attr("src",e.target.result);
								break;
							case 5:
								$("#contentImg5").attr("src",e.target.result);
								break;
							}
						}
						reader.readAsDataURL(value.files[0]);	// 파일의 url까지 스트림에 넘겨준다
					}
				} 
			
		
			  	$(function(){
				      $("#titleImgArea").mouseover(function(){
				         $(".hoverBlack0").css({"display":"block"});
				         $(".addBtn0").css({"display":"block"});
				         $(".deleteBtn0").css({"display":"block"});
				         
				         console.log("1");
				      })
				      
			        $("#titleImgArea").mouseout(function(){
				    	  $(".hoverBlack0").css({"display":"none"});
				    	  $(".addBtn0").css({"display":"none"});
				    	  $(".deleteBtn0").css({"display":"none"});
				    	  console.log("2");
				      })
				   }); 
			  	

			  	$(function(){
				      $(".detailImgArea").mouseover(function(){
				         $(".hoverBlack9").css({"display":"block"});
				         $(".addBtn9").css({"display":"block"})
				         $(".deleteBtn9").css({"display":"block"});
		     			  
				         console.log("1"); 
				      })
				      
			        $(".detailImgArea").mouseout(function(){
				    	  $(".hoverBlack9").css({"display":"none"});
				    	  $(".addBtn9").css({"display":"none"});
				    	  $(".deleteBtn9").css({"display":"none"}); 
				    	  console.log("2");
				      })
				   });  
			  	
			  	
			  	
			function delTitleImg(){
			
				$("#titleImg").attr("src"," ");
				$("#delImg1").val($("#presentTitlefid").val())
			}
				
			
			function addTitleImg(){
				$("#titleImg").attr("src"," ");
				$("#thumbnailImg1").click();
				
				$("#delImg1").val($("#presentTitlefid").val())
			}
			
			
			
			function delContentImg(index, fid ){
				$("#contentImg"+index).attr("src"," ");
				$("#delImg"+ index).val(fid) 
			}
			
			function addContentImg(index, fid){
				$("#contentImg"+index).attr("src"," ");
				$("#thumbnailImg"+index).click();
				$("#delImg"+ index).val(fid) 
			}
			
		
	</script>	



</html>