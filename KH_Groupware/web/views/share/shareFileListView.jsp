<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="share.model.vo.*, java.util.ArrayList" %>
    
      <%
      
  	ArrayList blist = (ArrayList)request.getAttribute("blist");
  	ArrayList flist = (ArrayList)request.getAttribute("flist");
  	
  	
   ArrayList<Share> list = (ArrayList<Share>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
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
<style> 
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

   thead{
      background: #EAEAEA;
      
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
    display: inline-block;
    position: absolute;
    background: white;
    width: 250px;
    margin: 0 auto 10px;
    border: 1px solid gray;
    right: 390px;
    font-size: 14px; 
    padding: 10px;
    text-align: left; 
    display:none;
}
 .balloon:after {
    content: '';
    position: absolute;
    border-top: 5px solid transparent;
    border-right: 5px solid transparent;
    border-left: 12px solid white;
    border-bottom: 5px solid transparent;
    top: 13px;
    left: 248px;
}

 .balloon:before {
    content: '';
    position: absolute;
    border-top: 5px solid transparent;
    border-right: 5px solid transparent;
    border-left: 13px solid gray;
    border-bottom: 5px solid transparent;
    top: 13px;
    left: 249px;
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
   margin: 0px;
   margin-bottom:1px;
   padding: 1px;



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
   padding-top: 3px;
   width: 40px;
   height: 35px;
   align: center;
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

select{
   font-size: 14px;
   position: absolute;
   right: 526px;
   border-right: none;
}

option{
   font-size: 14px;
}

input{
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
</style>

</head>
<body>
	<%@ include file = "../common/header.jsp" %>

<br><br>

<div id ="outer">
	<div class="titleDiv1"><div class= "titleDiv2"><b>자&nbsp;료&nbsp;실</b></div></div>
	<br><br>
	<div id = "tableDiv">
	<div id = listcountDiv><b>총 <span class=lisCountSpan><%=listCount%></span>건,(<span class=lisCountSpan><%=currentPage%></span>/<%=maxPage%>)</b></div>
   <div id =searchDiv>
   	  
   	  <form id = "searchForm" action = "<%=request.getContextPath() %>/list.sh" method ="post" >
      <select name= "type" style="height: 40px;margin:0px">
        <option value="all">전체</option>
        <option value="btitle">제목</option>
        <option value="bcontent">내용</option>
        <option value= "user_name">작성자</option>
       </select>
        <input name=searchWord type = "text" placeholder="검색어를 입력해주세요" style="background:white;padding-left:6px;vertical-align:0px">
        <button onclick = "searchList();" style="outline:none;border:none;padding:0px;margin:0px" class = "searchBtn"><i class="fa fa-search searchBtn" style="color:white;width:40px;height:40px;font-size:25px;padding-top:5px"> </i></button>
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
               <td colspan="6">조회된 리스트가 없습니다.</td>
            </tr>
            <%}else{ %>
               <% for(Share b : list){ %>
                  <tr>
                     <td align="center"><%=b.getbId() %></td>
                     <input type="hidden" value="<%=b.getbId() %>">
                     <td align="left" style="padding-left: 60px;"><%=b.getbTitle()%></td>
                     <td align="center"><%=b.getbWriter()%></td>
                      <% if(b.getBtype().equals("2")){ %>
                         
                         <td align="center" class = "attachment">
                             <div class="balloon">
                              <p class="attachmentP">테이블 정의서.hwp</p>
                              <p class="attachmentP">유스케이스 다이어그램.pdf</p>
                              <p class="attachmentP">semi_workspace.zip</p>
                              <p class="attachmentP">혼돈의 카오스.jpg</p>
                              <p class="attachmentP">얄리얄리얄라성.pdf</p>
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
<button id = writerBtn onclick = "goshareInsertForm();"><b>글쓰기</b></button>



   <!-- 페이징 처리 시작 -->
   <br>
      <div class="pagingArea" align="center">
         <!-- 맨 처음으로(<<) -->
         <button onclick="location.href='<%=request.getContextPath() %>/list.sh?currentPage=1'"> << </button>
         
         <!-- 이전 페이지로(<) -->
         <%if(currentPage <= 1) {%>
            <button disabled> < </button>
         <%} else{ %>
            <button onclick="location.href='<%=request.getContextPath() %>/list.sh?currentPage=<%=currentPage-1 %>'"> < </button>
         <%} %>
         
         <!-- 10개의 페이지 목록 -->
         <%for(int p = startPage; p<=endPage; p++){ %>
            <% if(p == currentPage){ %>
               <button disabled><%=p %></button>
            <%} else{%>
               <button onclick="location.href='<%=request.getContextPath() %>/list.sh?currentPage=<%=p %>'"><%=p %></button>
            <%} %>
         <%} %>
         
         <!-- 다음 페이지로(>) -->
         <%if(currentPage >= maxPage){ %>
            <button disabled> > </button>
         <%}else{ %>
            <button onclick="location.href='<%=request.getContextPath() %>/list.sh?currentPage=<%=currentPage+1 %>'"> > </button>
         <%} %>
         
         <!-- 맨 끝으로(>>) -->
         <button onclick="location.href='<%=request.getContextPath() %>/list.sh?currentPage=<%=maxPage %>'"> >> </button>
      </div>
</div>
</div>
<script> 
$(function(){
      $("td").mouseenter(function(){
         $(this).parent().css({"background":"#F2FFED"});
      }).mouseout(function(){
         $(this).parent().css({"background":"white"});
      })
   });
	
</script>
    
<script> 

// 게시글 제목클릭시 detailView를 위한 서블릿으로 이동  
$(function(){
    $("td").mouseenter(function(){
    $(this).parent().children().eq(2).css({"cursor":"pointer"}).click(function(){ 
           var bid = $(this).parent().children().eq(0).text(); // 게시글의  글번호 
           location.href="<%=request.getContextPath()%>/Sdetail.sh?bid=" + bid;
       }) 
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

 
 
function goshareInsertForm(){
    location.href="<%=request.getContextPath()%>/views/share/shareFileInsertView.jsp"
    
 };
 
 function searchList(){
	 $("#searchForm").submit();
 }
 
 
</script>




</body>
</html>