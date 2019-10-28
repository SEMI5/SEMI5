<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Member loginuser =  (Member)session.getAttribute("loginUser");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<style>

#outer{
	width: 100%;
}

#mySlide div[choose="study"]{
  width: 37%;
  height: 150px;
	margin-left:31.5%;
  margin-right:31.5%;

  transform-style: preserve-3d;
  transform-origin: center right;
  transition: transform 1s;
  display: inline-block;
}


#allSlide div[choose="study"]{
  width: 70%;
  height: 150px;
  margin-left:15%;
  margin-right:15%;

  transform-style: preserve-3d;
  transform-origin: center right;
  transition: transform 1s;
  display: inline-block;
}


.front {
  position: absolute;
  width: 100%;
  height: 100%;
  color: #262A2D;
  text-align: center;
  backface-visibility: hidden;
  background: #F6F6F6;
  padding: 5px;
}


.back {
  position: absolute;
  width: 100%;
  height: 100%;
  color: #262A2D;
  text-align: center;
  backface-visibility: hidden;
  background: #F6F6F6;
  transform: rotateX(180deg);
  padding: 5px;
}


.main-carousel{
	width: 80%;
	margin: auto;
}

#mySlide .carousel-cell{
	width: 100%;
	padding: 10px;
}

#allSlide .carousel-cell{
	width: 33%;
	padding: 10px;
}

.is-selected div[choose="study"]{
	color: black;
	border: 5px solid  #E7E3E3;
	
	
}

#studyInfo{
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	border: 2px solid 262A2D;
}

#attendance{
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	border: 2px solid 262A2D;
}

#outer th{
	color:#262A2D;
	background: #E7E3E3;
	text-align: center;
	padding-left: 10px;
	font-size: 12px;
}

#outer td{
	color:#262A2D;
	border-bottom: 2px solid lightgrey;
	text-align: left;
	padding-left: 10px;
	font-size: 12px;
}


#openForm{
	background:  #F6F6F6;
	width: 400px;
	height: 230px;
}

input{
	margin-left: 15px;
}

#openForm td{
	height: 30px;

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
	
.btn{
 	background: #262A2D;
 	color: #F6F6F6;
 	font-size: 12px;
}
.btn:hover{
	cursor:pointer;
	background: #E7E3E3;
	color: #262A2D;
	font-size: 12px;
	}
</style>
</head>

<header>
	<%@ include file = "/views/common/header.jsp" %>
</header>

<body>
	<div id = "banner">	
			<img src="https://images2.imgbox.com/16/2a/21JdCHzj_o.jpg" alt="image host"/>
			<div  id = "mainTitle"><b style="margin-bottom: 3000px;">스터디 개설 및 신청</b></div>
	</div>
	<div id="outer">
		<div id="mySlide">
			<h2 style = "text-align: center; margin-bottom: 0px; color:#262A2D; ">내 스터디</h2>
			<div style = "height: 30px; width: 6.85%; margin-left: 66%; margin-bottom: 5px;">
				<button class = "btn" id = "openStBtn" onclick = "openStudy();" style = "width: 100%; height: 100%;">스터디 개설</button>
			</div>
			<div id = "myStudy" class="main-carousel" style="width: 50%;">
				
			</div>
		</div>



	<div id="allSlide" style = "margin-top: 100px;">
		<h2 style = "text-align: center; margin-bottom: 35px; color:#262A2D;">모든 스터디</h2>
		<div id = "allStudy" class="main-carousel">
			
		</div>
	</div>
	</div>


	<div id = "openForm" style="display: none; ">
		<table id = "openFormTable" style = "margin: auto; margin-top: 2%;">
			<h2 style = "text-align: center; margin-bottom: 20px; color:#262A2D; ">스터디 개설</h2>
			<tr>
				<td>제목</td>
				<td><input type = "text" id = "title" maxlength="15" required="required" placeholder="스터디 주제"></td>
			</tr>
			<tr>
				<td>장소</td>
				<td><input type = "text" id = "location" maxlength="15" required="required" placeholder="ex)학원앞 까페"></td>
			</tr>
			<tr>
				<td>시간</td>
				<td><input type = "text" id = "time" maxlength="15" required="required" placeholder="ex)매주 수요일 13시"></td>
			</tr>
			<tr>
				<td colspan="2"><button class = "btn" id = "openBtn" style = "width: 33%; margin-left: 33%; margin-right: 33%; margin-top: 20px;  ">개설하기</button></td>
			</tr>
		</table>
	</div>

	<div id = "modifyForm" style="display: none; background:  #F6F6F6; width: 400px; height: 230px; ">
			<table id = "openFormTable" style = "margin: auto; margin-top: 2%;">
				<h2 style = "text-align: center; margin-bottom: 20px; color:#262A2D; ">스터디 개설</h2>
				<tr>
					<td>제목</td>
					<td><input type = "text" id = "mtitle" maxlength="15" required="required" placeholder="스터디 주제"></td>
				</tr>
				<tr>
					<td>장소</td>
					<td><input type = "text" id = "mlocation" maxlength="15" required="required" placeholder="ex)학원앞 까페"></td>
				</tr>
				<tr>
					<td>시간</td>
					<td><input type = "text" id = "mtime" maxlength="15" required="required" placeholder="ex)매주 수요일 13시"></td>
				</tr>
				<tr>
					<td></td>
					<td><button class = "btn" id = "mBtn" style = "width: 50%; margin-left: 20%; margin-right: 30%; margin-top: 5px;  ">수정하기</button>
					<button  class = "btn" id = "dBtn" style = "width: 50%; margin-left: 20%; margin-right: 30%; margin-top: 5px;  ">삭제하기</button></td>
				</tr>
			</table>
		</div>



	<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
	<script type="text/javascript">
		
		function toggleTrsf(id) {
			var card = $("#study" + id);
			if (card.hasClass("change") == true) {
				card.css("transform", "rotateX(-180deg)");
				card.removeClass("change");
			} else {
				card.css("transform", "");
				card.addClass("change");
			}
		}
		
		
		var $myStudy = $('#myStudy').flickity({
			  // options
			  cellAlign: 'center',
			  contain: false
			});
		
		var $allStudy = $('#allStudy').flickity({
			  // options
			  cellAlign: 'center',
			  contain: false
			});
		
		function openStudy(){
			$("#openForm").bPopup();
		}
		
		var stcount = 1;
		var studyList;
		var asl;
		var myApp;
		
		
		// 스터디 불러오기
		$.ajax({
			 url:"/KH_Groupware/showStudy.st",
			 async:false,
	         data:{cid : <%=loginuser.getcId()%>
	         }, 
	         success:function(data){   
	        	 $.ajax({
	    			 url:"/KH_Groupware/showAppStudy.st",
	    			 async:false,
	    	         data:{cid : <%=loginuser.getcId()%>
	    	         }, 
	    	         success:function(data){   
	    	        	 asl = data;
	    	        	 
	    	        	 myApp = new Array();
	    	        	 for(var i in asl){
	    	        		 if(<%=loginuser.getUserNo()%> == asl[i].userNo){
	    	        			 myApp.push(asl[i].stNo);
	    	        		 }
	    	        	 }
	    	            }
	    	         });

	        	 
	        	 var app = myApp;
	        	 studyList = data;
	        	
		        

	        	 for(var i in studyList){
		        		var stNo = studyList[i].stNo;
		        		var userNo = studyList[i].userNo;
			        	var title = studyList[i].stName;
			        	var location = studyList[i].location;
			        	var time = studyList[i].time;
			        	var openDate = studyList[i].openDate;
			        	var userName = studyList[i].userName;
			        	
			        	

			        	if(<%=loginuser.getUserNo()%>==userNo || app.includes(stNo)){
			        		if(<%=loginuser.getUserNo()%>==userNo){
			        			var $study = $(makeMyStudy(stNo, title, location, time, openDate, userNo, userName, "mine"));
		        	  			$myStudy.flickity('append', $study);
			        		}else{
			        			var $study = $(makeMyStudy(stNo, title, location, time, openDate, userNo, userName, "app"));
			        			$myStudy.flickity('append', $study);
			        		}
			        	}else{
			        		if(studyList[i].status == "ING")
			        		var $study = $(makeMyStudy(stNo, title, location, time, openDate, userNo, userName, "ing"));
		        	  		$allStudy.flickity('append', $study);	
			        	}
			        	
			        }
	        	 
	        	 	console.log($('#allStudy').flickity("cells.length"));
	        	 var appStudyList = asl;
	        	
	        	 
	        	 for(var i in appStudyList){
	        		 if($("#study"+appStudyList[i].stNo).parent().parent().parent().parent().parent("div").attr("id")=="myStudy"){
	        			 $("#study"+appStudyList[i].stNo+" #attendance tbody:first").append("<tr><td>"+appStudyList[i].userName+"</td><td>"+appStudyList[i].phone+"</td></tr>");
	        		 }else{
	        			 $("#study"+appStudyList[i].stNo+" #attendance tbody:first").append("<tr><td>"+appStudyList[i].userName+"</td><td>"+appStudyList[i].appDate+"</td></tr>");
	        		 }
	        		}
	 				
	        	 for(var i in studyList){
	        		 
	        		 $("#"+studyList[i].stNo+"count").text($("#study"+studyList[i].stNo+" #attendance tbody tr").length-1+"/5");
	        		 if($("#study"+studyList[i].stNo+" #attendance tbody tr").length-1 == 5){
	        			 $("#study"+studyList[i].stNo+" th").css({"background":"#FE7773","color":"#F6F6F6"});
	        		 }
	        	 }

	            }
	         
	         	
	         });  

		// 스터디 개설
		$("#openBtn").click(function(){
			if(!confirm("정말로 스터디를 개설하시겠습니까?")){
				$("#title").val("");
				$("#location").val("");
				$("#time").val("");
				$("#openForm").bPopup().close();
				return false;
			}
			if($("#title").val() == "" || $("#location").val() == "" || $("#time").val() == ""){
				alert("모든 정보를 입력해주세요.");
				return false;
			}
			$.ajax({
		         url:"/KH_Groupware/openStduy.st",
		         data:{userNo : <%=loginuser.getUserNo()%>,
		        	 title : $("#title").val(),
		        	 location : $("#location").val(),
		        	 time : $("#time").val(),
		        	 date : date_to_str(new Date())
		         }, 
		         success:function(data){   
		        	var title = data.stName;
		        	var location = data.location;
		        	var time = data.time;
		        	var openDate = data.openDate;
		        	 
		        	 
		        	window.location.reload();
		            alert("저장이 완료되었습니다."); 
		            }
		         });  
			$("#title").val("");
			$("#location").val("");
			$("#time").val("");
			$("#openForm").bPopup().close();
		});
		
		function date_to_str(format)

		{

		    var year = format.getFullYear();

		    var month = format.getMonth() + 1;

		    if(month<10) month = '0' + month;

		    var date = format.getDate();

		    if(date<10) date = '0' + date;


		    return year + "-" + month + "-" + date;

		}

		function makeMyStudy(stNo, title, location, time, openDate, userNo, userName, type){
			
			
			var button;
			var bG;
			
			if(type == "mine"){
				button = "<button class = 'btn' id = 'appBtn' onclick = 'openMfApp("+stNo+",event);' style = 'width:40%; height:80%; margin-left:50%;'>수정하기</button>"
				bG = "background:#262A2D; color:#F6F6F6";
			}
			if(type == "app"){
				button = "<button class = 'btn' id = 'appBtn' onclick = 'cancelApp("+stNo+",event);' style = 'width:40%; height:80%; margin-left:50%;' >신청취소</button>";
				bG = "background:#1D6A96; color:#F6F6F6";
			}
			if(type == "ing"){
				button = "<button class = 'btn' id = 'appBtn' onclick = 'appStudy("+stNo+",event);' style = 'width:40%; height:80%; margin-left:50%;' >신청하기</button>";
			}
			
			return "<div class='carousel-cell'>"+	
			"<div>"+
				"<div id='study"+stNo+"' class='change' choose='study'"+
					"onclick='toggleTrsf("+stNo+");'>"+
					"<div class='front' style = 'margin: auto;'>"+
						"<table id = 'studyInfo'>"+
							"<tr>"+
								"<th class = 'frontTh' colspan='2' style ='"+bG+"'>"+title+"</th>"+
							"</tr>"+
							"<tr>"+
								"<td style = 'width: 30%;'>스터디장</td>"+
								"<td>"+userName+"</td>"+
								"<td class = 'userNo' style = 'display:none;'>userNo</td>"+
							"</tr>"+
							"<tr>"+
								"<td>장소</td>"+
								"<td>"+location+"</td>"+
							"</tr>"+
							"<tr>"+
								"<td>시간</td>"+
								"<td>"+time+"</td>"+
							"</tr>"+
							"<tr>"+
								"<td>"+openDate+"</td>"+
								"<td id ='"+userNo+"Btn' class = 'btnTd'>"+button+"</td>"+
							"</tr>"+
						"</table>"+
					"</div>"+
					"<div class='back' style = 'margin: auto;'>"+
						"<table id = 'attendance'>"+
							"<tr>"+
								"<th class = 'backTh' style = 'width: 30%; text-align: left; padding-left: 10px;"+bG+"'>참여인원</th>"+
								"<th id = '"+stNo+"count' style = 'text-align: right; padding-right: 20px;"+bG+"'></th>"+
							"</tr>"+
							"<tr>"+
								"<td>"+userName+"</td>"+
								"<td>(스터디장)</td>"+
						"</tr>"+
						"</table>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>";
		}
		
		
		
		
		// 스터디 신청
		function appStudy(stNo, event){
			event.stopPropagation();
			if(!confirm("스터디에 참여하시겠습니까?")){
				 return false;
			}
			if($("#study"+stNo+" #attendance tbody tr").length == 6){
				alert("참여인원이 초과되었습니다");
				return false;
			}else{
			
				$.ajax({
			         url:"/KH_Groupware/appStudy.st",
			         data:{userNo : <%=loginuser.getUserNo()%>,
			        	 stNo : stNo,
			        	 appDate : date_to_str(new Date())
			         }, 
			         success:function(data){   
			        	 window.location.reload();
			            alert("저장이 완료되었습니다."); 
			            }
			         });  
			}
			
		}


		function cancelApp(stNo,event){
			event.stopPropagation();
			if(!confirm("신청을 취소하시겠습니까?")){
				return false;
			}
			$.ajax({
		         url:"/KH_Groupware/delAppStudy.st",
		         data:{userNo : <%=loginuser.getUserNo()%>,
		        	 stNo : stNo
		         }, 
		         success:function(data){   
		        	 window.location.reload();
		            alert("삭제되었습니다."); 
		            }
		         }); 
		}
		
		function openMfApp(stNo,event){
			$("#modifyForm").bPopup();
			
			$("#mBtn").on('click', function(){
				modifyApp(stNo);
			});
			
			$("#dBtn").on('click', function(){
				deleteApp(stNo);
			});
			
			event.stopPropagation();
		}
		
		
		function modifyApp(stNo){
			if(!confirm("수정하시겠습니까?")){
				$("#mtitle").val("");
				$("#mlocation").val("");
				$("#mtime").val("");
				$("#modifyForm").bPopup().close();
				return false;
			}
			if($("#title").val() == "" || $("#location").val() == "" || $("#time").val() == ""){
				alert("모든 정보를 입력해주세요.");
				return false;
			}
			$.ajax({
		         url:"/KH_Groupware/modStudy.st",
		         data:{stNo : stNo,
		        	 title : $("#mtitle").val(),
		        	 location : $("#mlocation").val(),
		        	 time : $("#mtime").val()
		         }, 
		         success:function(data){   
		        	
		        	window.location.reload();
		            alert("정보가 수정되었습니다."); 
		            }
		         });  
			$("#mtitle").val("");
			$("#mlocation").val("");
			$("#mtime").val("");
			$("#mopenForm").bPopup().close();
		}
		
		
		
		function deleteApp(stNo){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}
			alert(stNo);
			$.ajax({
		         url:"/KH_Groupware/delStudy.st",
		         data:{ stNo : stNo
		         }, 
		         success:function(data){   
		        	 window.location.reload();
		            alert("삭제되었습니다."); 
		            }
		         }); 
		}
		

		
		
		
	</script>

</body>
</html>