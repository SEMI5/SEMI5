<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="share.model.vo.*,java.util.ArrayList"%>
    <%
	Share b = (Share)request.getAttribute("share");
    Share bPrev	= (Share)request.getAttribute("sharePrev");
    Share bNext = (Share)request.getAttribute("shareNext");
	
   /*  Share s = (Share)request.getAttribute("share"); */
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	
	/* Ajax이후 */
/* 	ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist"); */
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

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
		<div class="titleDiv1"><div class= "titleDiv2"><b>자&nbsp;료&nbsp;실</b></div></div>
	
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
						<td><b style="margin-right:30px;">이전글</b><span onclick = "goShareDetail('<%=bPrev.getbId()%>');" style="cursor:pointer"><%=bPrev.getbTitle()%></span></td>
					<%}else{%>
						<td><b style="margin-right:30px">이전글</b>이전글이 없습니다.</td>
					<%}%>
				</tr>
				<tr style="font-size:16px">
					<%if(bNext != null){%>
						<td><b style="margin-right:30px">다음글</b><span onclick = "goShareDetail('<%=bNext.getbId()%>');" style="cursor:pointer"><%=bNext.getbTitle()%></span></td>
					<%}else{%>
						<td><b style="margin-right:30px">다음글</b>다음글이 없습니다.
					<%}%>
				</tr>
				</tbody>
			</table>
			<br><br><br><br>
				<button id = reWriteBtn onclick = "" style="display:inline-block"><b>수정</b></button>
				<button id = writeBtn onclick="location.href='<%=request.getContextPath() %>/list.sh'" style="display:inline-block"><b>목록</b></button>
					
		</div>
		
		

	</div>

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
	
	 function goShareDetail(bid){
		location.href="<%=request.getContextPath()%>/Sdetail.sh?bid=" + bid;
	} 
	
	
	</script>




</body>
</html>