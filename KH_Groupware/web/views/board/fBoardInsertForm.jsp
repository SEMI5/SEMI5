<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, java.text.*, member.model.vo.Member"%>
    
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd.");
	 String today = formatter.format(new java.util.Date());
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href='<%=request.getContextPath()%>/images/KH_favicon.ico'>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>



<meta charset="UTF-8">
<style>
   #outer{
       width: 100%;
       position: absolute;
       padding: 10px;
   	   border:none;
  	} 
   
    #tableDiv{
      position: relative;
      width: 1300px;
      padding:10px;
      margin: auto;
      border:none;
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
    
    #listArea{
    	width: 1230px;
    	border-spacing:0px;
   		border-top:2px solid black;
    }
    
    .tableTd{
    	border-bottom:1px solid  #dbdbdb;
    	border-right: 1px solid  #dbdbdb;
    	
    }
    
    .titleTd{
    	width: 180px;
    	height: 50px;
    	background: #f3f3f3 ;
    	text-align: center;
    	font-size: 16px;
    	border-left: 1px solid  #dbdbdb;
    }
    
    .inputTd{
    	width: 800px;
    	height: 30px; 
    	margin-left: 10px;
    }
    
    textrea{
    	border-left: 1px solid  #dbdbdb;
    	overflow-y:scroll;
		resize:none;
		width: 1229px;
    }
    #textareaDiv{
    	position: relative;
    	margin:auto;
    	width: 1230px;
    }
    
    .attachTd{
		padding: none; 
		padding-left: 15px;
		padding-bottom: 12px;
	
    }
    

    #attachCount{    
    	width: 50px;
    	height: 40px;
    }

	#attachTable{
		border: 1px solid #dbdbdb;
		width: 1230px;
	}   
	
	.attachTd input{
		height: 40px;
		padding-left:10px;
		font-size: 15px;
		width: 400px;
	} 
	
	.attachBtn{
		outline: none;
		border: none; 
		background: black;
		color: white;
		font-size: 15px;
		width: 100px;
		height: 40px;		
	}
	
	.attachBtn:hover{
	   background-color: darkgray;
	   color: white;
	}
	
	
	#listBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 70px;
	}
	
	#listBtn:hover{
	   background-color: darkgray;
	   color: white;
	}
	
	#insertBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 70px;
	}
	
	#insertBtn:hover{
	   background-color: #f53f29; 
	   color: white;
	}
	
	.btnDiv{
		border-top: 1px solid darkgray;
		height: 80px;
		text-align: center;
		padding-top: 30px;
	}
	

	#resetBtn{
		outline: none;
		border: none; 
		background: black;
		color: white;
		font-size: 15px;
		width: 100px;
		height: 40px;	
		margin-left: 182px; 
	}
	
	#resetBtn:hover{
	   background-color: #f53f29; ;
	   color: white;
	}
	
	
	
	#superCheck{
		width: 23px; 
		height: 23px;
		position: absolute; 
		background-color: white;
		border: 1px solid black;
		outline: none;
	}
	
	#checkLabel{
		font-size: 16px;
		margin-left: 30px;
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
   
<title>KH_Groupware</title>

</head>




<header>
<%@ include file = "../common/header.jsp" %>
</header>
<body>
<div style="height:46px;width:100%;background:#262A2D;"></div>
<div id= boardImg1>
		<img id= boardImg src="<%=request.getContextPath() %>/images/board_back2.jpg">
		<div style="width:100%; height:60px;background:black;"></div>
</div>


<br><br><br><br>
<form id= insertForm action = "<%=request.getContextPath()%>/insert.Fbo" method="post" encType="multipart/form-data">
<div id="outer">
	<div class="titleDiv1"><div class= "titleDiv2"><b>자&nbsp;유&nbsp;게&nbsp;시&nbsp;판</b></div></div>
	<br>
	<div id = "tableDiv">
		<table align="center" id="listArea">
			<tr>
				<td class= "titleTd tableTd"><b>제목</b></td>
				<td class ="tableTd"><input type="text" name= "btitle" class="inputTd">&nbsp;&nbsp;

				<%if(loginUser.getUserNo() >10000){%>
				<input id = superCheck type="checkbox" name="blevel" value="4" onclick="checkBox();"><label for="superCheck" id=checkLabel><span style="position: absolute; top:27px"><b>상단위치</b></span></label>
				<%}%>
				<input id = noCheck type= "hidden" name="blevel" value="1">
				</td> 
			</tr>
				<td class= "titleTd tableTd"><b>작성자</b></td>
				<td  class ="tableTd"><span style="padding-left: 17px; font-size: 16px;"><%=loginUser.getUserName()%></span></td>
			<tr>
				<td class= "titleTd tableTd"><b>작성일</b></td>
				<td  class ="tableTd"><span style="padding-left: 17px; font-size: 16px;"><%=today%></span></td>
			</tr>
		</table>
		<div id="textareaDiv"><textArea id= summernote rows=30 col=100 name = "bcontent" placeholder="내용을 입력해주세요"></textArea><div>
		
		<% if (loginUser!= null && loginUser.getUserNo() > 10000){ %>
		<table id = "attachTable">
			<tr>
				<td rowspan=9 class= "titleTd" style= "border-right: 1px solid #dbdbdb">
					<b>첨부파일</b>
				</td>
				<td  style= "border:none; height:30px; color:gray; padding:12px;padding-left:15px">
					<select id= attachCount onchange="changeSelect();" style="color:black">
						 <option>1</option>
						 <option>2</option>
						 <option>3</option>
						 <option>4</option>
						 <option>5</option>
						 <option>6</option>
						 <option>7</option>
						 <option>8</option>
					</select>
					&nbsp;<span style="font-size: 15px">파일 갯수를 지정해주세요</span>
					<button type="button" id= "resetBtn" class="attachBtn" onclick="selectReset();"><b>리셋</b></button>
				</td>
			</tr> 
			<tr class= attachTr>
				<td class= attachTd style="border-bottom: 1px solid #dbdbdb">
					<input id = "attachInput1" type="text" placeholder="첨부파일을 등록하세요" readonly>&nbsp;
					<button type="button" id= "attachBtn1" class="attachBtn" onclick="fileInputClick1();"><b>찾아보기</b></button>
			</tr>
				
		</table>
		<% }%>
		<br><br>
		<div class= btnDiv>
				<button type='button'id=listBtn onclick="goBoardListView();"><b>목록</b></button>&nbsp;&nbsp;
				<button id=insertBtn type="button" onclick="insertSubmit();"><b>등록</b></button>
		</div>
	</div>
<div style="display:none">
	<input type="file" id="fileInput1" name = "file1" onchange="loadAttachName(this,1);">
	<input type="file" id="fileInput2" name = "file2" onchange="loadAttachName(this,2);">
	<input type="file" id="fileInput3" name = "file3" onchange="loadAttachName(this,3);">
	<input type="file" id="fileInput4" name = "file4" onchange="loadAttachName(this,4);">
	<input type="file" id="fileInput5" name = "file5" onchange="loadAttachName(this,5);">
	<input type="file" id="fileInput6" name = "file6" onchange="loadAttachName(this,6);">
	<input type="file" id="fileInput7" name = "file7" onchange="loadAttachName(this,7);">
	<input type="file" id="fileInput8" multiple="multiple" name = "file8" onchange="loadAttachName(this,8)">
</div>
</form>
</body>


<script>

	function checkBox(){
		if(document.getElementById("superCheck").checked == true){
			document.getElementById("noCheck").disabled = true;
		}else{
			document.getElementById("noCheck").disabled = false;
		}
	}



	function fileInputClick1(){
	 	$("#fileInput1").click(); 
	}
	function fileInputClick2(){
		$("#fileInput2").click();	
	}
	function fileInputClick3(){
	 	$("#fileInput3").click(); 
	}
	function fileInputClick4(){
		$("#fileInput4").click();	
	}
	function fileInputClick5(){
	 	$("#fileInput5").click(); 
	}
	function fileInputClick6(){
		$("#fileInput6").click();	
	}
	function fileInputClick7(){
	 	$("#fileInput7").click(); 
	}
	function fileInputClick8(){
		$("#fileInput8").click();	
	}

	function changeSelect(){
		 $("#fileInput1").val("");
		 $("#fileInput2").val("");
		 $("#fileInput3").val("");
		 $("#fileInput4").val("");
		 $("#fileInput5").val("");
		 $("#fileInput6").val("");
		 $("#fileInput7").val("");
		 $("#fileInput8").val("");
		$(".attachTr").remove();
		
		
		var number = $("#attachCount").val();
	 	for(var i=0; i< number; i++){
	 		
	 		if( i == number-1){
	 			$("#attachTable").append("<tr class= attachTr>"
	 										+" <td class= attachTd style=\"border-bottom: 1px solid #dbdbdb\">"
	 										+" <input id= 'attachInput"+(i+1)+"' type='text' placeholder='첨부파일을 등록하세요' readonly>&nbsp;"
	 								        +" <button type='button' id= 'attachBtn"+(i+1)+"' class='attachBtn' onclick='fileInputClick"+(i+1)+"();'><b>찾아보기</b></button></td></tr>");
	 		}else{
	 			$("#attachTable").append("<tr class= attachTr>"
								+" <td class= attachTd>"
								+" <input id= 'attachInput"+(i+1)+"' type='text' placeholder='첨부파일을 등록하세요' readonly>&nbsp;"
						        +" <button type='button' id= 'attachBtn"+(i+1)+"' class='attachBtn' onclick='fileInputClick"+(i+1)+"();'><b>찾아보기</b></button></td></tr>");
	 		}
		}  
	}
	

 

</script> 

<script>

function loadAttachName(attach,num){
	
	if(attach.files[0]!=undefined){ 
		var fileValue = $("#fileInput"+num).val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			$("#attachInput"+num).val(fileName); 
	}
}

function goBoardListView(){
	location.href="<%= request.getContextPath()%>/Flist.bo"	
}


 function insertSubmit(){
	$("#insertForm").submit();	
} 

function selectReset(){
	$("#attachCount").val(1);
	 $("#fileInput1").val("");
	 $("#fileInput2").val("");
	 $("#fileInput3").val("");
	 $("#fileInput4").val("");
	 $("#fileInput5").val("");
	 $("#fileInput6").val("");
	 $("#fileInput7").val("");
	 $("#fileInput8").val("");
	$(".attachTr").remove();
	var i=0;
	$("#attachTable").append("<tr class= attachTr>"
				+" <td class= attachTd style=\"border-bottom: 1px solid #dbdbdb\">"
				+" <input id= 'attachInput"+(i+1)+"' type='text' placeholder='첨부파일을 등록하세요'>&nbsp;"
		        +" <button type='button' id= 'attachBtn"+(i+1)+"' class='attachBtn' onclick='fileInputClick"+(i+1)+"();'><b>찾아보기</b></button></td></tr>");

}
 
 
</script>



<!--  summernote 동작 -->
<script> 
$(document).ready(function() {
    $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
});

$(document).ready(function() {
     $('#summernote').summernote();
});
</script>


</html>