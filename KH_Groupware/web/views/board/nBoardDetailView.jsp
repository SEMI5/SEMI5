<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "board.model.vo.*, java.util.ArrayList"%>
    
<%
	Board b = (Board)request.getAttribute("board");
	Board bPrev	= (Board)request.getAttribute("boardPrev");
	Board bNext = (Board)request.getAttribute("boardNext");
	

	/* Ajax이후 */
/* 	ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist"); */
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #outer{
       width: 100%;
       position: absolute;
       border:1px solid black;
       padding: 10px;
   }
   td {
      border:1px solid white;
   
   }

   #content {
   	  margin-top: 5px;
      height:230px;
   }
   
   .titleDiv1{
	border:none;
	border-bottom: 1px solid darkgray;
	position: relative;	
	width:1230px;
	height:100px;
	margin-left:auto;
	margin-right:auto;
	align: center;
}

.titleDiv2{
	position: relative;
	width: 240px;	
	font-size: 45px;
	margin-left:auto;
	margin-right:auto;
}

#tableDiv{
	  
      position: relative;
      width: 1300px;
      padding:10px;
      margin: auto;
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
      height: 50px;
      
   }
   

   td{
    border-bottom: 1px solid lightgray;
    padding-left: 25px;
     padding-right: 25px;
   }

   thead{
      background: #EAEAEA;
      
   }
   
   .balloon {
    position: absolute;
    background: white;
    width: 250px;
    margin: 0 auto 10px;
    border: 1px solid gray;
    right: 105px;
    top: 160px;
    font-size: 14px; 
    padding: 10px;
    text-align: left; 
    display:none;
}
 .balloon:after {
    content: '';
    position: absolute;
    border-top: 5px solid transparent;
    border-right: 7px solid transparent;
    border-left: 7px solid transparent;
    border-bottom: 12px solid white ;
    top: -17px;
    left: 170px;
}

 .balloon:before {
    content: '';
    position: absolute;
    border-top: 8px solid transparent;
    border-right: 9px solid transparent;
    border-left: 10px solid transparent;
    border-bottom: 14px solid gray;
    top: -22px;
    left: 167px;
}  

.balloonClose{

   margin: 0px; 
   pdding: 1px;
   position: absolute;
   bottom: 10px; 
   right: 10px;
   cursor:pointer;
}

.clipDiv:hover{
	cursror:pointer;

}

.attachmentP:hover{
cursor:pointer;
text-decoration: underline;
}

.clipDiv{
	position: absolute;
	width: 130px;
	height: 30px;
	right: 60px;
	top: 120px;
}

.clipDiv:hover{
	cursor:pointer;
}

#writeBtn{
   border:none;
   outline: none;
   background-color: black; 
   color: white;
   font-size: 16px;
   height: 40px;
   width: 70px;
   position: absolute;
   right: 35px;
   bottom: 37px;
}

#reWriteBtn{
   border:none;
   outline: none;
   background-color: black; 
   color: white;
   font-size: 16px;
   height: 40px;
   width: 70px;
   position: absolute;
   right: 130px;
   bottom: 37px;
}


#writeBtn:hover{
   background-color: #f53f29; 
   color: white;
}

#reWriteBtn:hover{
   background-color: darkgray; 
   color: white;
}
</style>
</head>
<header>
<%@ include file = "../common/header.jsp" %>
</header>
<body>
<br><br>
	<div id="outer">
		<div class="titleDiv1"><div class= "titleDiv2"><b>공&nbsp;지&nbsp;사&nbsp;항</b></div></div>
	
		<div id="tableDiv" align>
			<table align="center" width="1230px">
				<thead>
					<tr><td style="text-align:center;font-size: 20px;padding:none"><b><%=b.getbTitle()%></b></td></tr>
				</thead>
				<tbody>
				<tr>
					<td style="font-size: 16px"><b>등록일:</b>&nbsp;<%=b.getModifyDate()%>&nbsp;&nbsp;|&nbsp;&nbsp;<b>조회수:</b> <%=b.getbCount()%></td>
				</tr>
				<tr>
                    
                         
                      <td style="border:none" id="clipTd">
                      
                      	<div class= "clipDiv">
                    	<span id= "clip" ><img class= clip src = "<%=request.getContextPath() %>/images/clip.png" width=20px height=24px style="padding-bottom:3px">&nbsp;첨부파일(5)</span>
                   		</div>
						<div class="balloon">
                         <p class="attachmentP">테이블 정의서.hwp</p>
                         <p class="attachmentP">유스케이스 다이어그램.pdf</p>
                         <p class="attachmentP">semi_workspace.zip</p>
                         <p class="attachmentP">혼돈의 카오스.jpg</p>
                         <p class="attachmentP">얄리얄리얄라성.pdf</p>
                         <br>
                         <div class= "balloonClose">닫기</div>
                        </div>
               		</td>
				</tr>
				<tr>
					<td style=padding-top:0px;margin-top:0px;"><p id="content"><%=b.getbContent() %></p></td>
				</tr>
				<tr style="font-size:16px">
					<%if(bPrev != null){%>
						<td><b style="margin-right:30px;">이전글</b><span onclick = "goBoardDetail('<%=bPrev.getbId()%>');" style="cursor:pointer"><%=bPrev.getbTitle()%></span></td>
					<%}else{%>
						<td><b style="margin-right:30px">이전글</b>이전글이 없습니다.</td>
					<%}%>
				</tr>
				<tr style="font-size:16px">
					<%if(bNext != null){%>
						<td><b style="margin-right:30px">다음글</b><span onclick = "goBoardDetail('<%=bNext.getbId()%>');" style="cursor:pointer"><%=bNext.getbTitle()%></span></td>
					<%}else{%>
						<td><b style="margin-right:30px">다음글</b>다음글이 없습니다.
					<%}%>
				</tr>
				</tbody>
			</table>
			<br><br><br><br>
				<button id = reWriteBtn onclick = "" style="display:inline-block"><b>수정</b></button>
				<button id = writeBtn onclick="location.href='<%=request.getContextPath() %>/Nlist.bo'" style="display:inline-block"><b>목록</b></button>
					
		</div>
		
		

	</div>
	<%-- <div align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/Nlist.bo'">메뉴로 돌아가기</button>
			<button>수정하기</button>
			<!-- 수정하기는 공지사항 때 해봤으니까 알아서 센스껏 완성 하시고 -->
			<!-- 이제 사진게시판 하러 가자! menubar.jsp로 ㄱㄱ씽 -->
			
		</div> --%>
	
	
	<!-- 여기는 Ajax 관련 코드 -->
	<!-- <div class="replyArea">
		댓글 작성하는 부분
		<div class="replyWriterArea">
			<table align="center">
				<tr>
					<td>댓글작성</td>
					<td><textArea rows="3" cols="80" id="replyContent"></textArea></td>
					<td>
						<button id="addReply">댓글등록</button>
					</td>
				</tr>
			</table>
		</div> -->
		
<%-- 		<!-- 불러온 댓글 리스트 보여주기 -->
		<div id="replySelectArea">
			<table id="replySelectTable" border="1" align="center">
				<%if(rlist.isEmpty()) {%>
					<tr><td colspan="3">댓글이 없습니다.</td></tr>
				<%}else{ %>
					<%for(int i=0;i<rlist.size();i++){ %>
						<tr>
							<td width="100px"><%=rlist.get(i).getrWriter() %></td>
							<td width="400px"><%=rlist.get(i).getrContent() %></td>
							<td width="200px"><%=rlist.get(i).getCreateDate() %></td>
						</tr>
					<%} %>
				<%} %>
			</table>
		</div>		
	</div> --%>
	<!-- Ajax로 댓글 입력부분을 완성해보자 -->
	<%-- <script>
		$(function(){
			// addReply 버튼을 클릭 시 댓글 달기 기능을 실행했을 때 비동기적으로 새로 갱신된 리스트들을 테이블에 적용 시키자
			$("#addReply").click(function(){
				var writer = <%=loginUser.getUserNo()%>;
				var bid = <%=b.getbId()%>
				var content = $("#replyContent").val();
				
				$.ajax({
					url:"/jspProject/insertReply.bo",
					type:"post",
					data:{writer:writer, content:content, bid:bid}, //InsertReplyServlet 만들러 ㄱㄱ씽
					success:function(data){
						$replyTable = $("#replySelectTable");
						$replyTable.html("");	// 기존 테이블 초기화(기존에는 댓글이 없습니다가 적힌 태그가 있었는데 지워지게)
						
						// 새로 받아온 갱신된 댓글리스트들을 for문을 통해 다시 table에 추가
						for(var key in data){
							var $tr = $("<tr>");
							var $writerTd = $("<td>").text(data[key].rWriter).css("width","100px");
							var $contentTd = $("<td>").text(data[key].rContent).css("width","400px");
							var $dateTd = $("<td>").text(data[key].createDate).css("width","200px");
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$replyTable.append($tr);
							
						}
						
						// 댓글 작성 부분 리셋
						$("#replyContent").val("");
					}
				});
			});
		});
	</script> --%>
	
</body>
<script>
$(function(){
    $(".clipDiv").click(function(){
       
          var balloon = $(this).parent().find(".balloon");   
         if(balloon.css("display")== "none"){
            balloon.css({"display":"block"})   
         }else{
            balloon.css({"display":"none"})
         }
    });
 });
 
 
 $(".balloonClose").click(function(){
    $(this).parent().css("display","none");
}); 

 function goBoardDetail(bid){
	location.href="<%=request.getContextPath()%>/Ndetail.bo?bid=" + bid;
} 


</script>

</html>