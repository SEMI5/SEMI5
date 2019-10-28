<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*" %>
    
    <%
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   ArrayList<Attachment> flist = (ArrayList<Attachment>)request.getAttribute("flist");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
/* 	 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd.");
	 String today = formatter.format(new java.util.Date());
   
		Date day1 = formatter.parse((list.get(0).getModifyDate());  */
	 
		
		Calendar today  = Calendar.getInstance();
		long todaySec = today.getTimeInMillis(); 
	
		
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
<link rel="shortcut icon" type="image⁄x-icon" href="../../images/KH_favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Text|Do+Hyeon|Sunflower:300&display=swap" rel="stylesheet">
<title>KH_Groupware</title>
<style> 
   table{
      border-top: 2px solid black; 
      border-bottom: 2px solid black; 
      border-spacing:0px;
   }
   th{
      height: 50px;
      font-size: 20px;
      border-right: 2px solid white;
     
   }
   
   tr{
      font-size: 18px;
      height: 50px;
      
   }
   

   td{
    border-bottom: 1px solid lightgray;
   }

   thead{
      background: #EAEAEA;
      
   }
   
   /* place holder 감추기*/
   input:focus::-webkit-input-placeholder, textarea:focus::-webkit-input-placeholder { /* WebKit browsers */ color:transparent; } 
   input:focus:-moz-placeholder, textarea:focus:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ color:transparent; } 
   input:focus::-moz-placeholder, textarea:focus::-moz-placeholder { /* Mozilla Firefox 19+ */ color:transparent; } 
   input:focus:-ms-input-placeholder, textarea:focus:-ms-input-placeholder { /* Internet Explorer 10+ */ color:transparent; }

   #searchDiv input{
      
      width: 450px; 
      height: 40px;
   }

    #outer{
       width: 100%;
       position: absolute;
       border:none;
       padding: 10px;
    }


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
    #searchDiv{
       width: 600px;
       height: 50px;
       border:none;
       display: inline-block;
       float: right; 
     }

	

   #tableDiv{
      border: none;
      position: relative;
      width: 1300px;
      padding:10px;
      margin: auto;
   }
   
.searchBtn{

   outline:none;

}

.balloon {
    display: none;
    position: absolute;
    background: white;
    width: 250px;
    margin: auto;
    border: 1px solid gray;
    right: 400px;
    font-size: 14px; 
    padding: 10px;
    text-align: left; 

}
 .balloon:after {
    content: '';
    position: absolute;
    border-top: 5px solid transparent;
    border-right: 5px solid transparent;
    border-left: 12px solid white;
    border-bottom: 5px solid transparent;
    top: 18px;
    left: 270px;
}

 .balloon:before {
    content: '';
    position: absolute;
    border-top: 5px solid transparent;
    border-right: 5px solid transparent;
    border-left: 13px solid gray;
    border-bottom: 5px solid transparent;
    top: 18px;
    left: 271px;
} 

.balloonClose{

   margin: 0px; 
   pdding: 1px;
   position: absolute;
   bottom: 10px; 
   right: 10px;
   cursor:pointer;
}

.attachmentP{
   position: relative;
   margin: auto;
   padding: auto;
   padding-bottom:5px;
   word-wrap: break-word;
		
}

    
.balloonClose:hover{
   cursor:pointer;
}
  
 .attachment:hover{
   cursor:pointer;
} 

.clip:hover{
cursor:pointer;
}

.attachmentP:hover{
cursor:pointer;
text-decoration: underline;
}

.clipDiv{
   padding-top: 18px;
   width: 40px;
   height: 35px;
   align: center;
   text-align:center;
}   

#writerBtn{
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

#writerBtn:hover{
   background-color: #f53f29; 
   color: white;
   cursor: pointer;
}

.searchBtn{
background-color: black;
position: absolute;
right: 18px;
}

.searchBtn:hover{
background-color: #f53f29;
cursor: pointer;

}

#saveId{
	position: absolute;
	left:174px;
	top:161px;
	margin: 0px;
	padding: 0px;
}


select{
   font-size: 14px;
   position: absolute;
   right: 536px;
   border: 1px solid lightgray;
}

option{
   font-size: 14px;
}

#searchDiv input{
   font-size: 14px;
   position: absolute;
   right: 76px
}

.lisCountSpan{
	color: #f53f29;
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

.pagingArea{
	position: relative;
	top:10px;

}
.superTr:hover{
	font-weight: bold;
}

#new {
	font-size: 13px;
	font-weight: bold;
	background: #ffca0b;
	border-radius: 4px;
	padding: 2px;
	margin-left:7px;
}

.pagingArea button {
	  border: none;
	  outline: none;
	  padding: 10px 16px;
	  background-color: #f1f1f1;
	  cursor: pointer;
	  font-weight: bold;
	  font-size: 15px;
}

.pagingArea button:hover {
	  background-color: #666;
	  color: white;
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




</style>

</head>
<header>
<%@ include file = "../common/header.jsp" %>
</header>
<body>
<div style="height:46px;width:100%;background:#262A2D;"></div>
	<div id= boardImg1>
		<img id= boardImg src="<%=request.getContextPath() %>/images/board_back4.jpg" style="height: 234px;">
		<div style="width:100%; height:60px;"></div>
	</div>

<div id ="outer">
	<br><br>
	<div class="titleDiv1"><div class= "titleDiv2"><b>공&nbsp;지&nbsp;사&nbsp;항</b></div></div>
	<br><br>
	<div id = "tableDiv">
	<div id = listcountDiv><b>총 <span class=lisCountSpan><%=listCount%></span>건,(<span class=lisCountSpan><%=currentPage%></span>/<%=maxPage%>)</b></div>
   <div id =searchDiv>
   	  
   	  <form id = "searchForm" action = "<%=request.getContextPath() %>/NSlist.bo" method ="post" >
      <select name= "type" style="height: 46px;margin:0px">
        <option value="all">전체</option>
        <option value="btitle">제목</option>
        <option value="bcontent">내용</option>
        <option value= "user_name">작성자</option>
       </select>
        <input name=searchWord type = "text" placeholder="검색어를 입력해주세요" style="background:white;padding-left:6px;vertical-align:0px">
       <button onclick = "searchList();" style="outline:none;border:none;padding:0px;margin:0px" class = "searchBtn"><i class="fa fa-search searchBtn" style="color:white;width:40px;height:39px;font-size:25px;padding-top:7px"> </i></button>
        </form>
   </div>
   
<br><br>



<table align="center" id="listArea">
   <thead>
      <tr>
         <th width="100px">번 호</th>
         <th width="600px">제 목</th>
         <th width="150px">작성자</th>
         <th width= "100px">첨부</th>
         <th width="100px">조회수</th>
         <th width="180px">작성일</th>
      </tr>

   <tbody>
    
      <% if(list.isEmpty()){ %>
            <tr>
               <td colspan="6" align="center" style="cursor:default">조회된 리스트가 없습니다.</td>
            </tr>
            <%}else{ %>
               <% for(Board b : list){ %>
               		<% if(b.getBlevl() == 4){%>
                  	<tr class= superTr style="background: #F2FFED">
                 	<%}else{%>
                    <tr class= normalTr>
                    <%}%>
                     <td align="center"><%=b.getbId() %></td>
                     <input type="hidden" value="<%=b.getbId() %>">
                     
             	      <%if(  ((todaySec - b.getCreateDate().getTime()) /1000)/(60*60*24) <= 2){%>   
                     <td align="left" style="padding-left: 60px;"><%=b.getbTitle()%><span id=new style="font-weight: bold">NEW</span></td>
                      <%}else{%> 
                     <td align="left" style="padding-left: 60px;"><%=b.getbTitle()%></td>
                     <%} %> 
                     <td align="center"><%=b.getbWriter()%></td>
                      <% if(b.getBtype().equals("2")){ %>
                         	
                         	<td align="center" class = "attachment">
                           	<div class="balloon" style="font-weight:normal">
                           		<%for(int i = flist.size()-1; i>-1 ; i--){ %>
                           			<%Attachment f = flist.get(i);%>
                            		<%if(f.getbId() == b.getbId()){%> 
			                        	<p class="attachmentP" onclick='downloadAttach(<%=f.getfId()%>);'><%=f.getOriginName()%></p> 
                             	 	<%}%>                     
                            <%}%> 
   	 						<br>
                            <div class= "balloonClose">닫기</div>
                            </div>
                            <div class= "clip clipDiv"><img class= clip src = "<%=request.getContextPath() %>/images/clip.png" width=20px height=18px></div>
                         	</td>
                      <%}else{%>
                         <td align="center"></td>
                      <%}%>
                     <td align="center"><%=b.getbCount()%></td>
                     <td align="center"><%=b.getModifyDate()%></td>
                  </tr>
               <%} %>
            <%} %>
      
   </tbody>
</table>

<br>
<br>

<%if(loginUser !=null && loginUser.getUserNo() > 10000) {%>
<button id = writerBtn onclick = "goBoardInsertForm();"><b>글쓰기</b></button>
<%}%>

   <!-- 페이징 처리 시작 -->
   <br>
      <div class="pagingArea" align="center">
         <!-- 맨 처음으로(<<) -->
         <button onclick="location.href='<%=request.getContextPath() %>/Nlist.bo?currentPage=1'"> << </button>
         
         <!-- 이전 페이지로(<) -->
         <%if(currentPage <= 1) {%>
            <button disabled> < </button>
         <%} else{ %>
            <button onclick="location.href='<%=request.getContextPath() %>/Nlist.bo?currentPage=<%=currentPage-1 %>'"> < </button>
         <%} %>
         
         <!-- 10개의 페이지 목록 -->
         <%for(int p = startPage; p<=endPage; p++){ %>
            <% if(p == currentPage){ %>
               <button disabled><%=p %></button>
            <%} else{%>
               <button onclick="location.href='<%=request.getContextPath() %>/Nlist.bo?currentPage=<%=p %>'"><%=p %></button>
            <%} %>
         <%} %>
         
         <%if(currentPage >= maxPage){ %>
            <button disabled> > </button>
         <%}else{ %>
            <button onclick="location.href='<%=request.getContextPath() %>/Nlist.bo?currentPage=<%=currentPage+1 %>'"> > </button>
         <%} %>
         
         <!-- 맨 끝으로(>>) -->
         <button onclick="location.href='<%=request.getContextPath() %>/Nlist.bo?currentPage=<%=maxPage %>'"> >> </button>
      </div>
      
      <form id= "formTag" action="<%=request.getContextPath()%>/Ndetail.bo" method="post">
      	
      	<input id= "bid" type= hidden value="" name = bid >
      	<input id= "nextBid" type=hidden value="" name="nextBid">
      	<input id= "prevBid" type=hidden value="" name="prevBid"> 	
      </form>
</div>
<br><br><br>
</div>
<script> 
  $(function(){
      $(".normalTr td").mouseenter(function(){
         $(this).parent().css({"background":"#F2FFED"});
      }).mouseout(function(){
         $(this).parent().css({"background":"white"});
      })
   }); 



</script>
    
<script> 

 
$(function(){
	
    $(".superTr td").mouseenter(function(){
   		   $(this).parent().children().eq(2).css({"cursor":"pointer"}).click(function(){ 
           var bid = $(this).parent().children().eq(0).text(); // 게시글의  글번호 
           $("#bid").val(bid);            
           $("#formTag").submit(); 
       });
    }).mouseout(function(){
    	$(this).parent().css({"background":"#F2FFED"});
    });
 });
 
$(function(){
	
    $(".normalTr td").mouseenter(function(){
   		   $(this).parent().children().eq(2).css({"cursor":"pointer"}).click(function(){ 
           var bid = $(this).parent().children().eq(0).text(); // 게시글의  글번호 
           $("#bid").val(bid);            
           $("#formTag").submit(); 
       });
    }).mouseout(function(){
    	$(this).parent().css({"background":"white"});
    });
 });
 
  
// 첨부파일 아이콘 클릭시 
$(function(){
    $(".clip").click(function(){
       
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

 
 
 function goBoardInsertForm(){
    location.href="<%=request.getContextPath()%>/views/board/nBoardInsertForm.jsp"
    
 };
 
 function searchList(){
	 $("#searchForm").submit();
 }
 
 
 function downloadAttach(thing){
	 location.href="<%=request.getContextPath() %>/Ndownload.at?fid="+thing;
	 
 }
 
 
 
</script>

<br><br><br>
</body>


</html>