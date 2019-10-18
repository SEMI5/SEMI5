<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, java.text.*, member.model.vo.Member"%>
    
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd.");
	 String today = formatter.format(new java.util.Date());
	

%>
<!DOCTYPE html>
<html>
<head>
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
		width: 240px;	
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
    
    textarea{
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
		width: 300px;
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
</style>
   
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>




<header>
<%@ include file = "../common/header.jsp" %>
</header>
<body>
<br><br>
<div id="outer">
	<div class="titleDiv1"><div class= "titleDiv2"><b>공&nbsp;지&nbsp;사&nbsp;항</b></div></div>
	<br>
	<div id = "tableDiv">
		<table align="center" id="listArea">
			<tr>
				<td class= "titleTd tableTd"><b>제목</b></td>
				<td class ="tableTd"><input type="text" class="inputTd"></td>
			</tr>
				<td class= "titleTd tableTd"><b>작성자</b></td>
				<td  class ="tableTd"><span style="padding-left: 17px; font-size: 16px;"><%=loginUser.getUserName()%></span></td>
			<tr>
				<td class= "titleTd tableTd"><b>작성일</b></td>
				<td  class ="tableTd"><span style="padding-left: 17px; font-size: 16px;"><%=today%></span></td>
			</tr>
		</table>
		<div id="textareaDiv"><textarea name= content id= summernote rows=30> 내용을 입력하세요. </textarea><div>
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
					&nbsp;<span style="font-size: 15px">파일 갯수를 지정해주십시오</span>
				</td>
			</tr> 
			<tr class= attachTr>
				<td class= attachTd style="border-bottom: 1px solid #dbdbdb">
					<input id = "attachInput1" type="text" placeholder="첨부파일을 등록하세요">&nbsp;
					<button id= "attachBtn1" class="attachBtn" onclick="fileInputClick1();"><b>찾아보기</b></button>
				</td>
			</tr>
				
		</table>
		<br><br>
		<div class= btnDiv>
				<button id=listBtn onclick=><b>목록</b></button>&nbsp;&nbsp;
				<button id=insertBtn><b>등록</b></button>
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
</body>


<script>
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
		
		$(".attachTr").remove();
		
		var number = $("#attachCount").val();
	 	for(var i=0; i< number; i++){
	 		
	 		if( i == number-1){
	 			$("#attachTable").append("<tr class= attachTr>"
	 										+" <td class= attachTd style=\"border-bottom: 1px solid #dbdbdb\">"
	 										+" <input id= 'attachInput"+(i+1)+"' type='text' placeholder='첨부파일을 등록하세요'>&nbsp;"
	 								        +" <button id= 'attachBtn"+(i+1)+"' class='attachBtn' onclick='fileInputClick"+(i+1)+"();'><b>찾아보기</b></button></td></tr>");
	 		}else{
	 			$("#attachTable").append("<tr class= attachTr>"
								+" <td class= attachTd>"
								+" <input id= 'attachInput"+(i+1)+"' type='text' placeholder='첨부파일을 등록하세요'>&nbsp;"
						        +" <button id= 'attachBtn"+(i+1)+"' class='attachBtn' onclick='fileInputClick"+(i+1)+"();'><b>찾아보기</b></button></td></tr>");
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