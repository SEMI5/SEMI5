 <%@page import="member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   ArrayList<Member> List = (ArrayList)session.getAttribute("stdList");

   ArrayList<Member> stdList = new ArrayList();
   
   for(int i = 0 ; i < List.size() ; i++){
      if(List.get(i).getApprove().equals("Y")){
         stdList.add(List.get(i));
      }
   }

   
   
   int count = 1;
   int countSize = stdList.size();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>

::-webkit-scrollbar {

display:none;

}
-ms-overflow-style: none; 
#outer {
	width: 100%;
	height: 100%;
	padding-left: 30px;
}

#content {
	display: inline-block;
	margin: 10%;
	margin-top: 0%;
}

#seatTableArea {
	margin: 1%;
	width: 66%;
	display: inline-block;
	color: black;
	height: 100px;

}

#stdListArea div{
	padding: 7px;
}


#seatTableArea table .seat {
	text-align: center; border : 0.5px solid black;
	height: 90px;
	background: lightgrey;
	border: 0.5px solid white;
}

#seatTableArea table #hallway {
	height: 120px;
	background: lightgrey;
}

.seat {
	width: 15%;
	height: 120px;
}

#hallway {
	width: 300px;
	height: 100%;
	text-align: center;
	background: lightgrey;
}

#front {
	width: 1000px;
	text-align: center;
	background: lightgrey;
}

#front td {
	height: 120px;
}

#stdListArea {
	width: 30%;
	display: inline-block;
}

#std {
	width: 30%;
	height: 40px;
	border: 1px solid red;
	position: relative;
	cursor: pointer;
}

.list {
	background: white;
	border: 1px solid grey;
	width: 1000px;
	height: 50px;
}

.list table[id^=stdInfo] td {
	color: black;
	background: white;
	border: 0.3px solid black;
	width: 1000px;
	font-size: 5px;
}

[id^=sNo]{
	padding-left: 10px;
	padding-right: 10px;
}

.seat table[id^=stdInfo] td {
	color: black;
	background: white;
	border: 0.3px solid black;
	width: 1000px;
	font-size: 5px;
}

.btn {
	width: 150px;
	height: 50px;
	float: right;
	margin-right: 2%;
	margin-top: 5px;	
}

#saveSeat {
	border: 1px solid white;
	color: white;
	background: black;
}

#resetSeat {
	border: 1px solid black;
	color: black;
	background: white;
}

.seat:hover {
	background: whitesmoke;
}

.list:hover {
	background: whitesmoke;
}

#stdList, #seatTable, table[id^=stdInfo] {
	border-spacing: 0px;
	margin
}

#seatTable {
	border: 1px solid white;
	height: 500px;
}
#banner{
	width: 100%;
	height: 350px;
	margin-top: 40px;
	margin-bottom: 50px;
}

#banner img{
	width: 100%;
	height: 250px;
	
}

#mainTitle{
	margin: auto;
	font-size: 45px;
	width: 50%;
	margin-left: 25%;
	margin-right: 25%;
	border-bottom: 1px solid grey;
	height: 50px;
	text-align: center;
	margin-top: 50px;
	padding-bottom: 30px;
	}

</style>
</head>

<header>
	<%@ include file = "/views/common/header.jsp" %>
</header>

<body>
<div id="container" style="overflow: auto;"><!-- container -->
   <div id="mainContent" style="overflow: auto;"><!-- mainContent -->	


	<div id = "banner">	
		<img src="https://i.ibb.co/QK4j3ZT/image.jpg" alt="image" border="0">
		<div  id = "mainTitle"><b style="margin-bottom: 3000px;">자리 배치</b></div>
	</div>

   <div id="outer">
      <div id="content">
         <div id="seatTableArea">
         　
            <table id="seatTable" >
               <tr id="front">
                  <td colspan="7"></td>
               </tr>
               <%for (int i = 0 ; i < 5 ; i++){ 
               int j;%>
               <tr>
                  <%for (j = 0; j < 3 ; j++){ %>
                  <td id="sNo<%=i*6+j+1%>" class="seat" ondrop = "drop(event)" ondragover = "allowDrop(event)" ondragleave="dragLeave(event)"><%=i*6+j+1%></td>
                  <%} %>
                  <%if(i==0 && j==3){ %>
                  <td rowspan="5" id="hallway"></td>
                  <%} %>
                  <%for (j = 4; j < 7 ; j++){ %>
                  <td id="sNo<%=i*6+j%>" class="seat" ondrop = "drop(event)" ondragover = "allowDrop(event)" ondragleave="dragLeave(event)"><%=i*6+j%></td>
                  <%} %>
               </tr>
               <%} %>
            </table>
         </div>
         <div id="stdListArea">
         　
         	&nbsp;
            <table id="stdList">
               <%for (int i = 0 ; i < 10 ; i++){ %>
               <tr>
                  <%for (int j = 0 ; j < 3 ; j++){ %>
                        <td id = "list<%=(i*3+j+1)%>" class="list" ondrop = "drop(event);" ondragover = "allowDrop(event)" ondragleave="dragLeave(event)">
                        </td>
                  <%} %>
               </tr>
               <%} %>
            </table>
         </div>
         <div>
            <button id = "saveSeat" class = "btn">저장하기</button>
            <button id = "resetSeat" class = "btn" onclick = "resetSeat();">초기화</button>
         </div>
      </div>
   </div>
		</div><!-- container -->
</div><!-- mainContent -->

   <script>
   
HashMap = function(){
   this.map = new Array();
};
 
HashMap.prototype= {
      put : function(key, value){
         this.map[key] = value;
      },
      get : function(key){
         return this.map[key];
      },
      getAll : function(){
         return this.map;
      },
      clear : function(){
         this.map = new Array();
      },
      getKeys : function(){
         var keys = new Array();
         for(i in this.map){
            key.push(i);
         }
         return keys;
      },
       remove : function(key){    
            delete this.map[key];
       },
       isEmpty : function(){    
            return (this.map.size() == 0);
       },
       toString : function(){
           var temp = '';
           for(i in this.map){  
               temp = temp + ',' + i + ':' +  this.map[i];
           }
           temp = temp.replace(',','');
             return temp;
       },
};

var seatMap = new HashMap();
<%for (int i = 0 ; i < stdList.size() ; i++){%>
   seatMap.put("<%=stdList.get(i).getUserNo()%>","<%=stdList.get(i).getSeat()%>");
<%}%>
   
   
   
function allowDrop(ev) {
  ev.preventDefault();
  if ( ev.target.className == "seat" ) {
  	ev.target.style.background = "whitesmoke"
  }
}

function dragLeave(ev) {
  if ( ev.target.className == "seat" ) {
  	ev.target.style.background = "lightgrey";
  }
  
}

function drag(ev) {
  ev.dataTransfer.setData("std", ev.target.id);
}

function drop(ev) {
  if ( ev.target.className == "seat" ) {
	  	ev.target.style.background = "lightgrey";
  }
  ev.preventDefault();
  var std = ev.dataTransfer.getData("std");
  var stdNo = $("#"+std+" .userNo").text()
  var seatNo = (ev.target.id).substring(3,5);

  if(seatNo.startsWith("t")){
     seatNo = "N";
  }

  seatMap.put(stdNo,seatNo);
  console.log(seatMap); 

  
  console.log(stdNo+"번 학생이 "+seatNo+"번 자리에 배정 받습니다.");
  
  ev.target.appendChild(document.getElementById(std));



}


$("#saveSeat").click(function(){
      $.ajax({
         url:"/KH_Groupware/updateSeat.te",
         data:{seatMap : seatMap.toString()   
         },
         success:function(data){   
        	if(!confirm("저장하시겠습니까?")){
        		return false;
        	} 
            alert("저장이 완료되었습니다."); 
            }
         }
      );  
});





/* $(function(){

      $(".seat").attr({"ondrop":"drop(event)", "ondragover":"allowDrop(event)"});
      $(".list").attr({"ondrop":"drop(event)", "ondragover":"allowDrop(event)"});
      ondrop = "drop(event);" ondragover = "allowDrop(evnet)"

});
 */

var setSeat = $(function(){

   <%for (int i = 0 ; i < 10 ; i++){ %>
      <%for (int j = 0 ; j < 3 ; j++){ %>
         <%if(countSize > 0 && stdList.get(i*3+j) != null){ %>
            <% countSize--;%>
            <%if(stdList.get(i*3+j).getSeat().equals("N")){%>
            $("#list<%=count%>").off("ondrop");
               $("#list<%=count%>").html("<div id = 'std<%=(i*3+j+1)%>' class='std' draggable='true' ondragstart='drag(event)'>"
                                     +"<table id='stdInfo<%=(i*3+j+1)%>'>"
                                       +"<tr>"
                                          +"<td style =''><%=stdList.get(i*3+j).getUserName()%></td>"
                                          +"<td><%=stdList.get(i*3+j).getRRN().substring(2,8)%></td>"
                                       +"</tr>"
                                       +"<tr>"
                                          +"<td>수준 : <%=stdList.get(i*3+j).getStdLv()%></td>"
                                          +"<td>경험 : <%=stdList.get(i*3+j).getExp()%></td>"
                                       +"</tr>"
                                       +"<tr>"
                                          +"<td>전공 : <%=stdList.get(i*3+j).getMajor()%></td>"
                                          +"<td>흡연 : <%=stdList.get(i*3+j).getSmoking()%></td>"
                                          +"<td style = 'display:none' class = 'userNo'><%=stdList.get(i*3+j).getUserNo()%></td>"
                                       +"</tr>"
                                    +"</table>"
                                 +"</div");
               <%count++; %>

            <%} else{%>
            $("#sNo<%=stdList.get(i*3+j).getSeat()%>").off("ondrop");
               $("#sNo<%=stdList.get(i*3+j).getSeat()%>").html(" <%=stdList.get(i*3+j).getSeat()%><div id = 'std<%=(i*3+j+1)%>' class='std' draggable='true' ondragstart='drag(event)'>"
                                     +"<table id='stdInfo<%=(i*3+j+1)%>'>"
                                       +"<tr>"
                                          +"<td><%=stdList.get(i*3+j).getUserName()%></td>"
                                          +"<td><%=stdList.get(i*3+j).getRRN().substring(2,8)%></td>"
                                       +"</tr>"
                                       +"<tr>"
                                          +"<td>수준 : <%=stdList.get(i*3+j).getStdLv()%></td>"
                                          +"<td>경험 : <%=stdList.get(i*3+j).getExp()%></td>"
                                       +"</tr>"
                                       +"<tr>"
                                          +"<td>전공 : <%=stdList.get(i*3+j).getMajor()%></td>"
                                          +"<td>흡연 : <%=stdList.get(i*3+j).getSmoking()%></td>"
                                          +"<td style = 'display:none' class = 'userNo'><%=stdList.get(i*3+j).getUserNo()%></td>"
                                       +"</tr>"
                                    +"</table>"
                                 +"</div");
            <%} %>
         <%}%>
      <%} %>
   <%} %>
});

 

function resetSeat(){
	if(!confirm("초기화 하시겠습니까 ?")){
		return false;
	}
	<%for (int i = 0 ; i < stdList.size() ; i++){%>
	   seatMap.put("<%=stdList.get(i).getUserNo()%>","N");
	<%}%>

	
	<% 
		int ccountSize = stdList.size();
		int ccount = 1;
	%>
	
	
	 <%for (int i = 0 ; i < 10 ; i++){ %>
	    <%for (int j = 0 ; j < 3 ; j++){ %>
	       <%if(ccountSize > 0 && stdList.get(i*3+j) != null){ %>
	          <% ccountSize--;%>
	         	
	             $("#list<%=ccount%>").html("<div id = 'std<%=(i*3+j+1)%>' class='std' draggable='true' ondragstart='drag(event)'>"
	                                   +"<table id='stdInfo<%=(i*3+j+1)%>'>"
	                                     +"<tr>"
	                                        +"<td class = 'test'><%=stdList.get(i*3+j).getUserName()%></td>"
	                                        +"<td><%=stdList.get(i*3+j).getRRN().substring(2,8)%></td>"
	                                     +"</tr>"
	                                     +"<tr>"
	                                        +"<td>수준 : <%=stdList.get(i*3+j).getStdLv()%></td>"
	                                        +"<td>경험 : <%=stdList.get(i*3+j).getExp()%></td>"
	                                     +"</tr>"
	                                     +"<tr>"
	                                        +"<td>전공 : <%=stdList.get(i*3+j).getMajor()%></td>"
	                                        +"<td>흡연 : <%=stdList.get(i*3+j).getSmoking()%></td>"
	                                        +"<td style = 'display:none' class = 'userNo'><%=stdList.get(i*3+j).getUserNo()%></td>"
	                                     +"</tr>"
	                                  +"</table>"
	                               +"</div");
	
	          
	       <%}else{ %>
	       		$("#list<%=ccount%>").html("");
	       <%}%>
	       $("#sNo<%=ccount%>").html("<%=ccount%>");
	       <%ccount++; %>
	    <%} %>
	 <%} %>
	
}





</script>
<%@ include file = "/views/common/footer.jsp" %>
 
 
 

</body>
</html>