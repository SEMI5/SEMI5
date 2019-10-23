<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "board.model.vo.*, java.util.ArrayList"%>
    
<%
	Board b = (Board)request.getAttribute("board");
	Board bPrev	= (Board)request.getAttribute("prevBoard");
	Board bNext = (Board)request.getAttribute("nextBoard");
	
	ArrayList<Attachment> attachments= new ArrayList<Attachment>();
	if(b.getBtype().equals("2")){	
		attachments = (ArrayList<Attachment>)request.getAttribute("attachments");
	}			
	System.out.println("글쓴이 번호:"+ b.getUserNo());
	
	/* Ajax이후 */
 	ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist"); 
 	ArrayList<Good> glist = (ArrayList<Good>)request.getAttribute("glist"); 
 	
 	String color = "gray"; // 그린은 glist 값이 없다는 것 
 	
 	int i = 0; 
%>
<!DOCTYPE html>
<html>
<head>





<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #outer{
       	
       width: 100%;
       position: absolute;
       border:1px solid black;
       padding: 10px;
   }
#boardTbody tr td {
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
	width: 290px;	
	font-size: 45px;
	margin-left:auto;
	margin-right:auto;
}

textArea{
	resize:none;
	padding: 5px;
	borderspacing:0px;
	width:796px;
	border:none;
	outline:none;
}


#tableDiv{
	  border: none;
      position: relative;	
      width: 1300px;
      padding:10px;
      margin: auto;
}


#tableDiv table{
      border-top: 2px solid black; 
      border-bottom: 2px solid black; 
      border-spacing:0px;
   }
   th{
      height: 50px;
      font-size: 20px;
     
   }
   
#boardTbody tr td{
      height: 50px;
   }
   


#boardTbody tr td{
    border-bottom: 1px solid lightgray;
    padding-left: 25px;
     padding-right: 25px;
   }
   
#tableDiv td span{
	cursor:pointer;
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
    z-index:5;
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


.attachmentP{
   position: relative;
   margin: auto;
   padding: auto;
   padding-bottom:5px;
   word-wrap: break-word;
		
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

#listBtn{
   border:none;
   outline: none;
   background-color: black; 
   color: white;
   font-size: 16px;
   height: 40px;
   width: 70px;
   position: absolute; 
   right: 615px;
   bottom: 35px;
   z-index:1;
}
#addReplyBtn{
	 border:none;
   outline: none;
   background-color: black; 
   color: white;
   font-size: 16px;
   height: 40px;
   width: 70px;
   position: absolute;
   right:0px;
   font-weight: bold;
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
   right: 35px;
   bottom: 35px;
   z-index:1;
}

#deleteBtn{
    border:none;
   outline: none;
   background-color: black; 
   color: white;
   font-size: 16px;
   height: 40px;
   width: 70px;
   position: absolute;
   right: 120px;
   bottom: 35px;
   z-index:1;
}

#deleteBtn:hover{
   background-color: darkgray; 
   color: white;
   
}

#listBtn:hover{
   background-color: #f53f29; 
   color: white;
}

#reWriteBtn:hover{

   background-color: #f53f29; 
   color: white;
}

#addReplyBtn:hover{
	background-color: #f53f29; 
   color: white;
}

#preNextBoard:hover{
	cusrsor:pointer; 
	color: darkgray;
}

.attachmentCount{
	color:#f53f29; 
	font-size:15px
}

.replyArea{
	  border-top:  1px solid darkgray;
      position: relative;
      width: 1230px;
      padding:auto;
      margin: auto;
	  align:center;

}

#replySelectArea{
	  border: none;
      position: relative;
      width: 1230px;
      padding:auto;
      margin: auto;
	  align:left;
	  

}


#replySelectTable{
	  border-top: 1px solid gray;
      position: relative;
      width: 800px;
	  left: 1px;
}


#replySelectTable tr {
	height:30px;
}


#replySelectTable tr td{
	word-break:break-all; 
	wrap:hard;
	border: none;
	padding: 10px;
}

.replyWriterArea{
	border: none;
	position: relative;
	width: 1230px;
	padding: 1px;
	
}


.replyWriterArea div{
	border: none;
	position: relative;
	width: 1230px;	
	

}


.replyWriterArea table{
	text-align: center;
	font-size:16px;
	font-weight: bold;
}

#boardImg1{
	position: relative;	
	width:100%;
	height:300px;
	margin-left:auto;
	margin-right:auto;
	align: center;
	text-align: center;
	background: black;
}

.answer{
   border: 1px solid lightgray;
   background: white;
   color: lightblack;
   padding: 5px;
}

.answer:hover{
	cursor:pointer;
	color: lightgray;
}

.good{
	position: relative;
	left: 570px;
}


.good:hover{
	cursor:pointer;	
}


.fix{
	position: relative;
	float: right;
	top: -5px;
	padding: 5px;
	font-weight: bold;
}


.fix:hover{
	cursor:pointer;	
}


.best{

	padding: 3px;
	background: #f53f29; 
	color: white;
	font-weight: bold;
	border-radius: 5px;
	margin-left: 3px;
	

}

.refresh:hover{

	color:  gray;	
	cursor:pointer;
}

</style>
</head>
<header>
<%@ include file = "../common/header.jsp" %>
</header>
<body>
<div id= boardImg1>
		<img id= boardImg src="<%=request.getContextPath() %>/images/boardBack3.jpg">
		<div style="width:100%; height:60px;background:black;"></div>
</div>


	<div id="outer">
	
	<br><br>
		<div class="titleDiv1"><div class= "titleDiv2"><b>자&nbsp;유&nbsp;게&nbsp;시&nbsp;판</b></div></div>
	
		<div id="tableDiv" >
			<table align="center" width="1230px">
				<thead>
					<tr><td style="text-align:center;font-size: 20px;padding:none;height:50px;"><b><%=b.getbTitle()%></b></td></tr>
				</thead>
				<tbody id= "boardTbody">
				<tr>
					<td style="font-size: 16px">
					
					<b>작성자:</b>&nbsp;&nbsp;<%=b.getbWriter()%>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<b>등록일:</b>&nbsp;&nbsp;<%=b.getModifyDate()%>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<b>조회수:</b>&nbsp; <%=b.getbCount()%></td>
				</tr>
				<tr>
				<td>
				 <% if(b.getBtype().equals("2")){ %>
                   	 
                   		<div class= "clipDiv">
                  			<span id= "clip" ><img class= clip src = "<%=request.getContextPath() %>/images/clip.png" width=20px height=24px style="padding-bottom:3px">
                  			&nbsp;<b style="font-size:14px">첨부파일(<font class= attachmentCount><%=attachments.size()%></font>)</b></span>
               			</div>
						<div class="balloon">
							<%for( i = 0;  i<attachments.size(); i++){ %>
                           			<%Attachment f = attachments.get(i);%>
                            		<%if(f.getbId() == b.getbId()){%> 
			                        	<p class="attachmentP" onclick='downloadAttach(<%=f.getfId()%>);'><%=f.getOriginName()%></p> 
                             	 	<%}%>                     
                            <%}%> 
                         <br>
                         <div class= "balloonClose">닫기</div>
                        </div>
               			<br>
					 <%} %>
					<%=b.getbContent() %></td>
				</tr>
				<tr style="font-size:16px">
					<%if(bPrev != null){%>
						<td><b style="margin-right:30px;">이전글</b><span id = "preNextBoard" onclick = "goBoardDetail('<%=bPrev.getbId()%>');"><%=bPrev.getbTitle()%></span></td>
					<%}else{%>
						<td><b style="margin-right:30px">이전글</b>이전글이 없습니다.</td>
					<%}%>
					
				</tr>
				<tr style="font-size:16px">
					<%if(bNext != null){%>
						<td><b style="margin-right:30px">다음글</b><span id = "preNextBoard" onclick = "goBoardDetail('<%=bNext.getbId()%>');"><%=bNext.getbTitle()%></span></td>
					<%}else{%>
						<td><b style="margin-right:30px">다음글</b>다음글이 없습니다.
					<%}%>
				</tr>
				</tbody>
			</table>
			<br><br><br><br>
				<%if(loginUser != null && (loginUser.getUserNo() > 10000 || (loginUser.getUserNo() == b.getUserNo()))){ %>
				<button id = deleteBtn onclick = "delBoard();"><b>삭제</b></button>
				<button id = reWriteBtn onclick ="location.href='<%=request.getContextPath()%>/FupdateView.bo?bid=<%=b.getbId()%>'" style="display:inline-block"><b>수정</b></button>
				<%}%>
				<button id = listBtn onclick="location.href='<%=request.getContextPath() %>/Flist.bo'" style="display:inline-block"><b>목록</b></button>
			<br>
			</div>	<!--tableDiv 끝 -->
			<div class="replyArea">
				<br>
				<div class="replyWriterArea">
					<div style="border:none;margin-bottom:8px;"><span style="font-weight:bold;font-size:18px;">댓글작성</span>&nbsp;&nbsp;&nbsp;<span onclick = "refreshClick();" class = "refresh"><i class="fa fa-refresh" aria-hidden="true" style="font-size:20px; "></i></span></div>
					<div style="width:802px;border:1px solid darkgray;">
					<textArea rows="3" cols="119" id="replyContent" placeholder="댓글을 입력해주세요" style="font-weight:normal;border:none"></textArea>
					<br><span style="margin-left:680px;color:darkgray;">글자 수 &nbsp;<span id="counter">0</span>&nbsp;/&nbsp;200&nbsp; </span>
					<div style="height: 40px;width:800px;border:none; border-top:1px solid lightgray"><button id="addReplyBtn" type="button">등록</button></div>
					</div>
				</div>	
			</div> <!-- replyArea 끝 -->
				 <%if(rlist !=null){ %>	 
			<div id="replySelectArea">
				<br>
				<table id="replySelectTable" >
					<%if(rlist.isEmpty()) {%>
						<tr><td colspan="3">댓글이 없습니다.</td></tr>
					<%}else{ %>
						<%for(i=0;i<rlist.size();i++){ %>
							<%for (int j=0; j<glist.size(); j++){
									if((rlist.get(i).getrId() == glist.get(j).getrId()) && (loginUser.getUserNo() == glist.get(j).getUserNo())){
										 color = "#f53f29";
										 break;
									}else{
										color = "gray"; 
									}
							}%> <!-- 안쪽 for문 -->	
						
						
								<%-- <%if(rlist.get(i).getUserNo() == loginUser && b.getUserNo() == loginUser) %> 삭제 조건문, 로그인한 사람이 리플쓴 사람이거나 게시글 쓴 사람일때 --%> 
											
							<tr style="border:none; border-top: 1px solid darkgray;">
								<td style="width:100px;">&nbsp;
									<b><%=rlist.get(i).getrWriter() %><span style="margin-left:10px;"><%=rlist.get(i).getCreateDate()%></span></b>
									<span class="fix" style="color:gray;"onclick= "fixClick(this);" ><span style="font-size: 12px;"><%=b.getbWriter()%>님이 고정함&nbsp;&nbsp;</span><i class="fa fa-thumb-tack" aria-hidden="true" style="font-size:14px;"></i></span>
								</td>
							</tr>
							<tr style="border:none">
								<td width="400px"><span class= "best">BEST</span>&nbsp;<%=rlist.get(i).getrContent() %></td>
							</tr>
							<tr style="border:none; border-bottom: 1px solid darkgray;">
								<td width="200px" style="border:none">&nbsp;
									<span class= "answer" type="button">답글</span>&nbsp;
									<span class= "answer" type="button">수정</span>&nbsp;
									<span class= "answer" type="button" onclick="deleteReply(this);" value = "">삭제 <!-- 리플 아이디 (삭제할때 쓸것임) -->
										<input id = "rid<%=i%>" type = hidden value = <%=rlist.get(i).getrId() %>> <!-- 리플 아이디 (삭제할때 쓸것임) -->	
									</span>
									<span class= "good" onclick="goodClick(this, rid<%=i%>);" style="hegiht: 20px; margin-left:10px;padding:5px;border:1px solid <%=color %>; color:<%=color %> " ><i class="fa fa-thumbs-up" style="font-size:15px; "></i>&nbsp;<span id="gCount"><%=rlist.get(i).getCount()%></span></span> 
								</td>
							</tr>
						
							
							
						<%} %> <!--  바깥쪽 for문 -->
					<%} %>
				</table>
				<br><br><br><br>
				<div>나중에 앵커를 여기다가 박자 맨 끝으로 올라가고싶다</div>
			</div>		
			<%} %>
		
		
			
		</div><!--outer끝 -->
	 
	
	
	<!-- 여기는 Ajax 관련 코드 -->
		 <!-- 불러온 댓글 리스트 보여주기 -->
		 
	

	<!-- Ajax로 댓글 입력부분을 완성해보자 -->
	 <script>
		$(function(){
			// addReply 버튼을 클릭 시 댓글 달기 기능을 실행했을 때 비동기적으로 새로 갱신된 리스트들을 테이블에 적용 시키자
			$("#addReplyBtn").click(function(){
				
				var count = $("textArea").val().length;
				if( count <2){
					alert("2자 이상 입력해주세요 ")	;	
					return false;
				}else if(count > 200){
					alert("200자 미만으로 입력해주세요 ");
					return false ;
				}
				
				var writer = <%=loginUser.getUserNo()%>;
				var bid = <%=b.getbId()%>
				var content = $("#replyContent").val();
				
				$.ajax({
					url:"/KH_Groupware/insertReply.bo",
					type:"post",
					data:{writer:writer, content:content, bid:bid}, //InsertReplyServlet 만들러 ㄱㄱ씽
					success:function(data){
						$replyTable = $("#replySelectTable");
						$replyTable.html("");	// 기존 테이블 초기화(기존에는 댓글이 없습니다가 적힌 태그가 있었는데 지워지게)
						
						// 새로 받아온 갱신된 댓글리스트들을 for문을 통해 다시 table에 추가
						for(var  [key] in data){
							<% i = i +1; %>
							var rWriter = data[key].rWriter;
							var createDate= data[key].createDate;
							var rContent =data[key].rContent;
							var rId = data[key].rId;
							var bWriter = "<%=b.getbWriter()%>"; 
							var count = data[key].count; 
							
							// 칼라 설정을 여기서 다시해줘야하함.....
							var color = "<%=color%>";
							
							var html = ""; 
                            
							html += "<tr style='border:none; border-top: 1px solid darkgray;'>"; 
							html += "<td style='width:100px;'>&nbsp;<b>" + rWriter + "sdafasf" + "<span style='margin-left:10px;'>" + createDate +"</span></b>";
							html += "<span class='fix' style='color:gray' onclick= 'fixClick(this);'><span style='font-size: 12px;'>"+ rWriter+"님이 고정함&nbsp;&nbsp;</span><i class='fa fa-thumb-tack' aria-hidden='true' style='font-size:14px;'></i></span>";
							html += "</td>";
							html += "</tr>";
							
							html += "<tr style='border:none'>";
							html += "<td width='400px'><span class= 'best'>BEST</span>&nbsp;" + rContent + "</td>";
							html += "</tr>";
							
							html += "<tr style='border:none; border-bottom: 1px solid darkgray;'>";
							html += "<td width='200px' style='border:none'>&nbsp;";
							html +=  "<span class= 'answer' type='button'>답글</span>&nbsp;";
							html +=  "<span class= 'answer' type='button'>수정</span>&nbsp;";
							html +=  "<span class= 'answer' type='button' onclick='deleteReply(this);'>삭제 <input id ='rid"+<%=i%>+ "' type= 'hidden' value =" +rId+ "></span>";
							html += "<span class= 'good' onclick='goodClick(this,rid"+<%=i%>+")' style='hegiht:20px;margin-left:25px;padding:5px;color: " +color+"; border:1px solid "+ color +"'><i class='fa fa-thumbs-up' style='font-size:15px;'></i>&nbsp;<span>" +count +"</span></span>";
							html += "</td>";
							html += "</tr>";
							////////////////////////
							////////////////////////
							////////////////////////
							////////////////////////
							////////////////////////
							////////////////////////

							$("#replySelectTable").append(html); 
							
							
						<%-- 	<tr style="border:none; border-top: 1px solid darkgray;">
							<td style="width:100px;">&nbsp;
								<b><%=rlist.get(i).getrWriter() %><span style="margin-left:10px;"><%=rlist.get(i).getCreateDate()%></span></b>
								<span class="fix" style="color:gray;"onclick= "fixClick(this);" ><span style="font-size: 12px;"><%=b.getbWriter()%>님이 고정함&nbsp;&nbsp;</span><i class="fa fa-thumb-tack" aria-hidden="true" style="font-size:14px;"></i></span>
							</td>
						</tr>
						<tr style="border:none">
							<td width="400px"><span class= "best">BEST</span>&nbsp;<%=rlist.get(i).getrContent() %></td>
						</tr>
						<tr style="border:none; border-bottom: 1px solid darkgray;">
							<td width="200px" style="border:none">&nbsp;
								<span class= "answer" type="button">답글</span>&nbsp;
								<span class= "answer" type="button">수정</span>&nbsp;
								<span class= "answer" type="button" onclick="deleteReply(this);" value = "">삭제 <!-- 리플 아이디 (삭제할때 쓸것임) -->
									<input id = "rid<%=i%>" type = hidden value = <%=rlist.get(i).getrId() %>> <!-- 리플 아이디 (삭제할때 쓸것임) -->	
								</span>
								<span class= "good" onclick="goodClick(this, rid<%=i%>);" style="hegiht: 20px; margin-left:10px;padding:5px;border:1px solid <%=color %>; color:<%=color %> " ><i class="fa fa-thumbs-up" style="font-size:15px; "></i>&nbsp;<span id="gCount"><%=rlist.get(i).getCount()%></span></span> 
							</td>
						</tr>
							
							 --%>
						}
						
						// 댓글 작성 부분 리셋
						$("#replyContent").val("");
					}
				});
			});
		});
	</script> 
	
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

    
    

    $("textarea").keydown(function(){
		//alert($(this).text()); // textarea는 input태그처럼 입력 값을 val()로 뽑아와야한다.\
		//alert($(this).val()); // textarea의 입력값을 뽑아올 수는 있지만, 맨 마지막 한글자가 빠짐 
		
		var inputLength = $(this).val().length +1;  // textarea는 한턴이 느리므로 +1
		console.log(inputLength);

		$("#counter").text(inputLength);
		
		var remain = 200- inputLength; 
		
		if(remain >= 0){
			$("#counter").css("color", "darkgray");
		}else{
			$("#counter").css("color","#f53f29");
		}
	});		
    


    $(".balloonClose").click(function(){
        $(this).parent().css("display","none");
    }); 
    
/*     
    $(document).ready(function(){
    	  $(".good").click(function(){
    	    $(this).hide();
    	  });
    });
	 */
});


	function goBoardDetail(bid){
		location.href="<%=request.getContextPath()%>/Fdetail.bo?bid=" + bid;
	} 
	
	 function downloadAttach(thing){
		 location.href="<%=request.getContextPath() %>/Fdownload.at?fid="+thing;
		 
	 }
	
	 


 function delBoard(){
	 
	   if(confirm("게시글을 정말로 삭제하시겠습니까?")) {
           $(this).parent().click();
      	 location.href="<%=request.getContextPath() %>/Fdelete.bo?bid=<%=b.getbId()%>";
       } else {
           return false;
       }
 }
 


 function goodClick(thing, rid){

	 var rId = rid.value 
	 alert(rId);
	 	
	  if( thing.style.color == "gray"){ 
				thing.style.color = "#f53f29";
			 	thing.style.border = "1px solid #f53f29"
			 	;
			 	 var count =  thing.lastChild.innerHTML
			 	 countAdd = parseInt(count) +1 ;
			  	
			 	thing.lastChild.innerHTML= countAdd
			 	 
	  }else{
			thing.style.color = "gray";
			thing.style.border = "1px solid gray";
			 var count =  thing.lastChild.innerHTML
		 	 countSub = parseInt(count) -1 ;
		 	 thing.lastChild.innerHTML= countSub; 
		};   	 	 
			    
		
		 $.ajax({
    		url:"/KH_Groupware/insert.go",
    		type:"post",
    		data:{userNo: <%=loginUser.getUserNo()%>,
	 	          rid1: rid},
    		success:function(data){
    		  	
    		 },
    		 error : function(request,status,error) {
 				// 3-2. 에러 발생 시 처리할 절차
 				alert("code:"+request.status+"\n"+
 				"message:"+request.responseText+"\n"+"error:"+error);
 				}
		  });  
 
 }
 


  
  function fixClick(thing){	
		 if( thing.style.color == "gray"){ 
			thing.style.color = "#2478FF";
		}else{
			thing.style.color = "gray";
		}; 
	} 


  function refreshClick(){
	  location.reload();
  }
  
function deleteReply(thing){

	var rid = thing.children[0].value;
 	   if(confirm("댓글을 정말로 삭제하시겠습니까?")) {
           $(this).parent().click();
           
	       	$.ajax({
	    		url:"/KH_Groupware/Fdelete.re",
	    		type:"post",
	    		data:{rid: rid,
	    			  bid: <%=b.getbId()%>}, 
	    		success:function(data){
	    			$replyTable = $("#replySelectTable");
					$replyTable.html("");	// 기존 테이블 초기화(기존에는 댓글이 없습니다가 적힌 태그가 있었는데 지워지게)
					
					// 새로 받아온 갱신된 댓글리스트들을 for문을 통해 다시 table에 추가
			/* 		for(var key in data["rlist"]){ */
					
							console.log(data["rlist"]);
						
					/* 	$replyTable = $("#replySelectTable");
						$replyTable.html("");	// 기존 테이블 초기화(기존에는 댓글이 없습니다가 적힌 태그가 있었는데 지워지게)
						
						// 새로 받아온 갱신된 댓글리스트들을 for문을 통해 다시 table에 추가
						console.log( data["rlist"]); */
						
						
						
						
							
							<%-- 	var rWriter = data[key].rWriter;
								var createDate= data[key].createDate;
								var rContent =data[key].rContent;
								var rId = data[key].rId;
								var bWriter = "<%=b.getbWriter()%>"; 
								var count = data[key].count; 
								var color = "<%=color%>";
								var html = ""; 
	
								html += "<tr style='border:none; border-top: 1px solid darkgray;'>"; 
								html += "<td style='width:100px;'>&nbsp;<b>" + rWriter + "<span style='margin-left:10px;'>" + createDate +"</span></b>";
								html += "<span class='fix' style='color:gray' onclick= 'fixClick(this);'><span style='font-size: 12px;'>"+ rWriter+"님이 고정함&nbsp;&nbsp;</span><i class='fa fa-thumb-tack' aria-hidden='true' style='font-size:14px;'></i></span>";
								html += "</td>";
								html += "</tr>";
								
								html += "<tr style='border:none'>";
								html += "<td width='400px'><span class= 'best'>BEST</span>&nbsp;" + rContent + "</td>";
								html += "</tr>";
								
								html += "<tr style='border:none; border-bottom: 1px solid darkgray;'>";
								html += "<td width='200px' style='border:none'>&nbsp;";
								html +=  "<span class= 'answer' type='button'>답글</span>&nbsp;";
								html +=  "<span class= 'answer' type='button'>수정</span>&nbsp;";
								html +=  "<span class= 'answer' type='button' onclick='deleteReply(this);'>삭제 <input type= 'hidden' value =" +rId+ "></span>";
								html += "<span class= 'good' onclick='goodClick(this)' style='hegiht:20px;margin-left:25px;padding:5px;color: " +color+"; border:1px solid "+ color +"'><i class='fa fa-thumbs-up' style='font-size:15px;'></i>&nbsp;<span>" +count +"</span></span>";
								html += "</td>";
								html += "</tr>";
								
								
								$("#replySelectTable").append(html);--%>
							/* } */
						
						// 댓글 작성 부분 리셋
						$("#replyContent").val(""); 
	    			}
      	 		/* } */
	       	});
       } else {
           return false;
       }  
 
 


 		
 
 }
  
</script>

</html>