<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Member loginuser =  (Member)session.getAttribute("loginUser");
	int stcount = 1;
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
  cursor: pointer;
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
  cursor: pointer;
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
</style>
</head>
<body>

	<div id="outer">
		<div id="mySlide">
			<h2 style = "text-align: center; margin-bottom: 35px; color:#262A2D; ">내 스터디</h2>
			<div id = "myStudy" class="main-carousel" style="width: 50%;">
				
			</div>
		</div>



	<div id="allSlide" style = "margin-top: 100px;">
		<h2 style = "text-align: center; margin-bottom: 0px; color:#262A2D;">모든 스터디</h2>
		<div style = "height: 30px; width: 6.85%; margin-left: 80%; margin-bottom: 5px;">
			<button id = "openStBtn" onclick = "openStudy();" style = "width: 100%; height: 100%; background: #262A2D; color: #F6F6F6">스터디 개설</button>
		</div>
		<div id = "allStudy" class="main-carousel">
			<div class="carousel-cell">
					<div>
						<div id="study0" class="change" choose="study"
							onclick="toggleTrsf(0);">
							<div class="front" style = "margin: auto;">
								<table id = "studyInfo">
									<tr>
										<th colspan="2">sdfsfsfsfsdfsfsds</th>
									</tr>
									<tr>
										<td style = "width: 30%;">스터디장</td>
										<td>dfsssfsf</td>
									</tr>
									<tr>
										<td>장소</td>
										<td></td>
									</tr>
									<tr>
										<td>시간</td>
										<td></td>
									</tr>
									<tr>
										<td>dd</td>
										<td></td>
									</tr>
								</table>
							</div>
							
							<div class="back" style = "margin: auto;">
								<table id = "attendance">
									<tr>
										<th style = "width: 30%; text-align: left; padding-left: 10px;">참여인원</th>
										<th style = "text-align: right; padding-right: 20px;">5/5</th>
									</tr>
									<tr>
										<td>강현모</td>
										<td>ㄴㅇㄹㄴㅇㄹㄴㅇ</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	</div>

	<div id = "openForm" style="display: none;">
		<table id = "openFormTable" style = "margin: auto; margin-top: 2%;">
			<h2 style = "text-align: center; margin-bottom: 20px; color:#262A2D; ">스터디 개설</h2>
			<tr>
				<td>제목</td>
				<td><input type = "text" id = "title" maxlength="15" required="required" placeholder="주제와 간단한 소개"></td>
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
				<td colspan="2"><button id = "openBtn" style = "width: 33%; margin-left: 33%; margin-right: 33%; margin-top: 20px;  background: #262A2D; color: #F6F6F6">개설하기</button></td>
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
		var appStudyList;
		$.ajax({
			 url:"/KH_Groupware/showStudy.st",
	         data:{cid : <%=loginuser.getcId()%>
	         }, 
	         success:function(data){   
	        	 
	        	 studyList = data;
	        	 $.ajax({
	    			 url:"/KH_Groupware/showAppStudy.st",
	    	         data:{cid : <%=loginuser.getcId()%>
	    	         }, 
	    	         success:function(data){   
	    	        	 
	    	        	 appStudyList = data;
	    	        	
	    	            }
	    	         });  
	        	 
	        	 for(var i in studyList){
		        	var title = studyList[i].stName;
		        	var location = studyList[i].location;
		        	var time = studyList[i].time;
		        	var openDate = studyList[i].openDate;
		        	
		        	var $study = $(makeMyStudy(stcount, title, location, time, openDate));
							        
		        	stcount++;
		        	
		        	if(<%=loginuser.getUserNo()%>==data[i].userNo){
	        	  		$myStudy.flickity('append', $study);
		        	}else{
	        	  		$allStudy.flickity('append', $study);	
		        		}
		        	}
	            }
	         });  

		
		$("#openBtn").click(function(){
			if(!confirm("정말로 스터디를 개설하시겠습니까?")){
				$("#title").val("");
				$("#location").val("");
				$("#time").val("");
				$("#openForm").bPopup().close();
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
		        	 
		        	 
		        	 var $study = $(makeMyStudy(<%=stcount%>, title, location, time, openDate));
		        	  $myStudy.flickity('append', $study);
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

		function makeMyStudy(stNo, title, location, time, openDate){
			var count = 1;
			
			return "<div class='carousel-cell'>"+	
			"<div>"+
				"<div id='study"+stNo+"' class='change' choose='study'"+
					"onclick='toggleTrsf("+stNo+");'>"+
					"<div class='front' style = 'margin: auto;'>"+
						"<table id = 'studyInfo'>"+
							"<tr>"+
								"<th class = 'frontTh' colspan='2'>"+title+"</th>"+
							"</tr>"+
							"<tr>"+
								"<td style = 'width: 30%;'>스터디장</td>"+
								"<td><%=loginuser.getUserName()%></td>"+
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
								"<td class = 'btnTd'><button id = 'appBtn' onclick = 'appStudy("+stcount+");' style = 'width:40%; height:80%; margin-left:50%; background:#262A2D; color:#F6F6F6'>신청하기</button></td>"+
							"</tr>"+
						"</table>"+
					"</div>"+
					"<div class='back' style = 'margin: auto;'>"+
						"<table id = 'attendance'>"+
							"<tr>"+
								"<th class = 'backTh' style = 'width: 30%; text-align: left; padding-left: 10px;'>참여인원</th>"+
								"<th class = 'backTh' style = 'text-align: right; padding-right: 20px;'>"+count+"/5</th>"+
							"</tr>"+
							"<tr>"+
								"<td><%=loginuser.getUserName()%></td>"+
								"<td><%=loginuser.getPhone()%></td>"+
							"</tr>"+
						"</table>"+
					"</div>"+
				"</div>"+
			"</div>"+
		"</div>";
		}
		
		function appStudy(stNo){
			if(!confirm("스터디에 참여하시겠습니까?")){
				 return false;
			}
			$.ajax({
		         url:"/KH_Groupware/appStudy.st",
		         data:{userNo : <%=loginuser.getUserNo()%>,
		        	 stNo : stNo
		         }, 
		         success:function(data){   
		        	$("#study"+stNo+" #attendance").append("<tr>"+
							"<td>추</td>"+
							"<td>가</td>"+
						"</tr>")
		            alert("저장이 완료되었습니다."); 
		            }
		         });  
		}

		
	</script>

</body>
</html>