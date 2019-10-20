<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, java.text.*, member.model.vo.*, board.model.vo.*"%>
    

<!DOCTYPE html>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<%
Board b = (Board)request.getAttribute("board");
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd.");
String today = formatter.format(new java.util.Date());

ArrayList<Attachment> flist= new ArrayList<Attachment>();

String[] nameList = new String[8]; 
int flistSize= 1; 

if(b.getBtype().equals("2")){ //첨부파일 있다면 
	flist = (ArrayList<Attachment>)request.getAttribute("flist");
	flistSize= flist.size();
	flist.add(new Attachment());
	flist.add(new Attachment());
	flist.add(new Attachment());
	flist.add(new Attachment());
	flist.add(new Attachment());
	flist.add(new Attachment());
	flist.add(new Attachment());
	flist.add(new Attachment());

	
}

String originName1= flist.get(0).getOriginName();
String originName2= flist.get(1).getOriginName();
String originName3= flist.get(2).getOriginName();
String originName4= flist.get(3).getOriginName();
String originName5= flist.get(4).getOriginName();
String originName6= flist.get(5).getOriginName();
String originName7= flist.get(6).getOriginName();
String originName8= flist.get(7).getOriginName();

%>

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
	
	
	.delAttachBtn{
		outline: none;
		border: none; 
		background: black;
		color: white;
		font-size: 15px;
		width: 100px;
		height: 40px;		
	}
	
	.delAttachBtn:hover{
	   background-color: #f53f29;
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
		margin-left: 159px; 
	}
	
</style>
   
<title>Insert title here</title>

</head>




<header>
<%@ include file = "../common/header.jsp" %>
</header>
<body>
<br><br>
<form id= insertForm action = "<%=request.getContextPath()%>/insert.Nbo" method="post" encType="multipart/form-data">
<div id="outer">
	<div class="titleDiv1"><div class= "titleDiv2"><b>공&nbsp;지&nbsp;사&nbsp;항</b></div></div>
	<br>
	<div id = "tableDiv">
		<table align="center" id="listArea">
			<tr>
				<td class= "titleTd tableTd"><b>제목</b></td>
				<td class ="tableTd"><input type="text" name= "btitle" class="inputTd" value="<%=b.getbTitle()%>"></td>
			</tr>
				<td class= "titleTd tableTd"><b>작성자</b></td>
				<td  class ="tableTd"><span style="padding-left: 17px; font-size: 16px;"><%=loginUser.getUserName()%></span></td>
			<tr>
				<td class= "titleTd tableTd"><b>작성일</b></td>
				<td  class ="tableTd"><span style="padding-left: 17px; font-size: 16px;"><%=today%></span></td>
			</tr>
		</table>
		<div id="textareaDiv"><textArea id= summernote rows=30 name = "bcontent" placeholder="내용을 입력해주세요"><%=b.getbContent()%></textArea><div>
		<table id = "attachTable">
			<tr>
				<td rowspan=9 class= "titleTd" style= "border-right: 1px solid #dbdbdb">
					<b>첨부파일</b>
				</td>
				<td  style= "border:none; height:30px; color:gray; padding:12px;padding-left:15px">
					<select id= attachCount onchange="changeSelect();" style="color:darkgray" disabled>
						 <option name= aCount value=1>1</option>
						 <option name= aCount value=2>2</option>
						 <option name= aCount value=3>3</option>
						 <option name= aCount value=4>4</option>
						 <option name= aCount value=5>5</option>
						 <option name= aCount value=6>6</option>
						 <option name= aCount value=7>7</option>
						 <option name= aCount value=8 selected>8</option>
					</select>
					&nbsp;<span style="font-size: 15px">파일 갯수를 지정해주십시오</span>
					<button type="button" id= "resetBtn" class="delAttachBtn" onclick="selectReset();"><b>리셋</b></button>
				</td>
			</tr> 
			<tr class= attachTr>
				<td class= attachTd>
					<input id = "attachInput1" type="text" placeholder="첨부파일을 등록하세요" readonly value ="<%=originName1%>" >&nbsp;
					<button type="button" id= "attachBtn1" class="attachBtn" onclick="fileInputClick1();"><b>찾아보기</b></button>&nbsp;
					<button type="button" id= "delAttachBtn1" class="delAttachBtn" onclick="delAttach1();"><b>삭제</b></button>
				</td>
			</tr>
				<tr class= attachTr>
				<td class= attachTd>
					<input id = "attachInput2" type="text" placeholder="첨부파일을 등록하세요" readonly value ="<%=originName2%>" >&nbsp;
					<button type="button" id= "attachBtn2" class="attachBtn" onclick="fileInputClick2();"><b>찾아보기</b></button>&nbsp;
					<button type="button" id= "delAttachBtn2" class="delAttachBtn" onclick="delAttach2();"><b>삭제</b></button>
				</td>
			</tr>
				<tr class= attachTr>
				<td class= attachTd>
					<input id = "attachInput3" type="text" placeholder="첨부파일을 등록하세요" readonly value ="<%=originName3%>" >&nbsp;
					<button type="button" id= "attachBtn3" class="attachBtn" onclick="fileInputClick3();"><b>찾아보기</b></button>&nbsp;
					<button type="button" id= "delAttachBtn3" class="delAttachBtn" onclick="delAttach3();"><b>삭제</b></button>
				</td>
			</tr>
				<tr class= attachTr>
				<td class= attachTd>
					<input id = "attachInput4" type="text" placeholder="첨부파일을 등록하세요" readonly value ="<%=originName4%>" >&nbsp;
					<button type="button" id= "attachBtn4" class="attachBtn" onclick="fileInputClick4();"><b>찾아보기</b></button>&nbsp;
					<button type="button" id= "delAttachBtn4" class="delAttachBtn" onclick="delAttach4();"><b>삭제</b></button>
				</td>
			</tr>
				<tr class= attachTr>
				<td class= attachTd>
					<input id = "attachInput5" type="text" placeholder="첨부파일을 등록하세요" readonly value ="<%=originName5%>" >&nbsp;
					<button type="button" id= "attachBtn5" class="attachBtn" onclick="fileInputClick5();"><b>찾아보기</b></button>&nbsp;
					<button type="button" id= "delAttachBtn5" class="delAttachBtn" onclick="delAttach5();"><b>삭제</b></button>
				</td>
			</tr>
				<tr class= attachTr>
				<td class= attachTd>
					<input id = "attachInput6" type="text" placeholder="첨부파일을 등록하세요" readonly value ="<%=originName6%>" >&nbsp;
					<button type="button" id= "attachBtn6" class="attachBtn" onclick="fileInputClick6();"><b>찾아보기</b></button>&nbsp;
					<button type="button" id= "delAttachBtn6" class="delAttachBtn" onclick="delAttach6();"><b>삭제</b></button>
				</td>
			</tr>
				<tr class= attachTr>
				<td class= attachTd >
					<input id = "attachInput7" type="text" placeholder="첨부파일을 등록하세요" readonly value ="<%=originName7%>" >&nbsp;
					<button type="button" id= "attachBtn7" class="attachBtn" onclick="fileInputClick7();"><b>찾아보기</b></button>&nbsp;
					<button type="button" id= "delAttachBtn7" class="delAttachBtn" onclick="delAttach7();"><b>삭제</b></button>
				</td>
				<tr class= attachTr style="border-bottom: 1px solid #dbdbdb">
				<td class= attachTd>
					<input id = "attachInput8" type="text" placeholder="첨부파일을 등록하세요" readonly value ="<%=originName8%>" >&nbsp;
					<button type="button" id= "attachBtn8" class="attachBtn" onclick="fileInputClick8();"><b>찾아보기</b></button>&nbsp;
					<button type="button" id= "delAttachBtn8" class="delAttachBtn" onclick="delAttach8();"><b>삭제</b></button>
				</td>
			</tr>
		</table>
		<br><br>
		<div class= btnDiv>
				<button type='button'id=listBtn onclick=><b>목록</b></button>&nbsp;&nbsp;
				<button id=insertBtn onclick="insertSubmit();"><b>등록</b></button>
		</div>
	</div>
<div style="display:display">
	<input type="file" id="fileInput1" name = "file1" onchange="loadAttachName(this,1);">
	<input type="file" id="fileInput2" name = "file2" onchange="loadAttachName(this,2);">
	<input type="file" id="fileInput3" name = "file3" onchange="loadAttachName(this,3);">
	<input type="file" id="fileInput4" name = "file4" onchange="loadAttachName(this,4);">
	<input type="file" id="fileInput5" name = "file5" onchange="loadAttachName(this,5);">
	<input type="file" id="fileInput6" name = "file6" onchange="loadAttachName(this,6);">
	<input type="file" id="fileInput7" name = "file7" onchange="loadAttachName(this,7);">
	<input type="file" id="fileInput8" multiple="multiple" name = "file8" onchange="loadAttachName(this,8)">
</div>

<div style="display:display;width:100%">
	<input  id="delInput" name = "del1" style="width:100%">
</div>

</form>
</body>

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
	 										+" <input id= 'attachInput"+(i+1)+"' type='text' placeholder='첨부파일을 등록하세요' >&nbsp;"
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


 function insertSubmit(){
	$("#insertForm").submit();	
} 

 function selectReset(){
	 
	 for(var i=1; i<9;i++){
		 $("#fileInput"+i).val("");
		$("#attachInput"+i).val(""); 
	 }
		// 안에 있던 모든 삭제 파일들 ->  삭제리스트에 추가 
}
 
function delAttach1(){
	

	var split = ",";
	 var delValue = $("#attachInput1").val(); 
	var delValues = document.getElementById("delInput").value += delValue+split;


	$("#attachInput1").val(""); 
	
 } 
 
function delAttach2(){
	$("#attachInput2").val(""); 
 } 
function delAttach3(){
	$("#attachInput3").val(""); 
 } 
function delAttach4(){
	$("#attachInput4").val(""); 
 } 
function delAttach5(){
	$("#attachInput5").val(""); 
 } 
function delAttach6(){
	$("#attachInput6").val(""); 
 } 
function delAttach7(){
	$("#attachInput7").val(""); 
 } 
function delAttach8(){
	$("#attachInput8").val(""); 
 } 
</script>






</html>