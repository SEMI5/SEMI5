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

   flist = (ArrayList<Attachment>)request.getAttribute("flist");
   flist.add(new Attachment());
   flist.add(new Attachment());
   flist.add(new Attachment());
   flist.add(new Attachment());
   flist.add(new Attachment());
   flist.add(new Attachment());
   flist.add(new Attachment());
   flist.add(new Attachment());


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
      width: 90px;
   }
   
   #listBtn:hover{
      background-color: darkgray;
      color: white;
   }
   
   #updateBtn{
      border:none;
      outline: none;
      background-color: black; 
      color: white;
      font-size: 16px;
      height: 40px;
      width: 90px;
   }
   
   #updateBtn:hover{
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
      margin-left: 173px;
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
   
   
   
</style>
   
<title>Insert title here</title>

</head>




<header>
<%@ include file = "../common/header.jsp" %>
</header>
<body>
<br><br>
<form id= updateForm action = "<%=request.getContextPath()%>/Fupdate.bo" method="post" encType="multipart/form-data">
<div id="outer">
   <div class="titleDiv1"><div class= "titleDiv2"><b>자&nbsp;유&nbsp;게&nbsp;시&nbsp;판</b></div></div>
   <br>
   <div id = "tableDiv">
      <table align="center" id="listArea">
         <tr>
            <td class= "titleTd tableTd"><b>제목</b></td>
            <td class ="tableTd"><input type="text" name= "btitle" class="inputTd" value="<%=b.getbTitle()%>">&nbsp;&nbsp;
				<%if(loginUser.getUserNo() >10000){%>
					<%if(b.getBlevl() <4){ %>
					<input id = superCheck type="checkbox" name="blevel" value="4" onclick="checkBox();">
					<%} else{%>
					<input id = superCheck type="checkbox" name="blevel" value="4" onclick="checkBox();" checked>
					<%} %>
				 <%} %>
				<label for="superCheck" id=checkLabel><span style="position: absolute; top:27px"><b>상단위치</b></span></label>
				<input id = noCheck type= "hidden" name="blevel" value="1">
            					 <input type="hidden" name = "btype" value="<%=b.getBtype() %>">
            					 <input type="hidden" name = "bid" value="<%=b.getbId() %>">
			</td>
         </tr>
            <td class= "titleTd tableTd"><b>작성자</b></td>
            <td  class ="tableTd"><span style="padding-left: 17px; font-size: 16px;"><%=loginUser.getUserName()%></span></td>
         <tr>
            <td class= "titleTd tableTd"><b>작성일</b></td>
            <td  class ="tableTd"><span style="padding-left: 17px; font-size: 16px;"><%=today%></span></td>
         </tr>
      </table>
      <div id="textareaDiv"><textArea id= summernote rows=30 name = "bcontent" placeholder="내용을 입력해주세요"><%=b.getbContent()%></textArea><div>
      
      <%if(loginUser != null &&loginUser.getUserNo() > 10000){ %>
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
               &nbsp;<span style="font-size: 15px">파일 갯수를 지정해주세요</span>
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
      <%}%>
      
      <br><br>
      <div class= btnDiv>
            <button type='button'id="listBtn" onclick="location.href='<%=request.getContextPath() %>/Ndetail.bo?bid=<%=b.getbId()%>'"><b>뒤로가기</b></button>&nbsp;&nbsp;
            <button id="updateBtn" type = "button" onclick="updateSubmit();"><b>수정</b></button>
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

<div style="display:none">
   <br>
   
   <input type = "text" id="delFid1" name = "delFid1" value = "0" ><br>
   <input type = "text" id="delFid2" name = "delFid2" value = "0"><br>
   <input type = "text" id="delFid3" name = "delFid3" value = "0"><br>
   <input type = "text" id="delFid4" name = "delFid4" value = "0"><br>
   <input type = "text" id="delFid5" name = "delFid5" value = "0"><br>
   <input type = "text" id="delFid6" name = "delFid6" value = "0"><br>
   <input type = "text" id="delFid7" name = "delFid7" value = "0"><br>
   <input type = "text" id="delFid8" name = "delFid8" value = "0"><br>
   
</div>
</form>


<div style="display:none">
	<br>
   <input type = "text" id="originFid1" name = "originFid1" value =<%=flist.get(0).getfId()%> ><br>
   <input type = "text" id="originFid2" name = "originFid2" value =<%=flist.get(1).getfId()%> ><br>
   <input type = "text" id="originFid3" name = "originFid3" value =<%=flist.get(2).getfId()%> ><br>
   <input type = "text" id="originFid4" name = "originFid4" value =<%=flist.get(3).getfId()%> ><br>
   <input type = "text" id="originFid5" name = "originFid5" value =<%=flist.get(4).getfId()%> ><br>
   <input type = "text" id="originFid6" name = "originFid6" value =<%=flist.get(5).getfId()%> ><br>
   <input type = "text" id="originFid7" name = "originFid7" value =<%=flist.get(6).getfId()%> ><br>
   <input type = "text" id="originFid8" name = "originFid8" value =<%=flist.get(7).getfId()%> ><br>
</div>


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
$(function(){
	if(document.getElementById("superCheck").checked == true){
		document.getElementById("noCheck").disabled = true;
	}else{
		document.getElementById("noCheck").disabled = false;
	}
}); 
	
	
	
	
	function checkBox(){
		if(document.getElementById("superCheck").checked == true){
			document.getElementById("noCheck").disabled = true;
		}else{
			document.getElementById("noCheck").disabled = false;
		}
	}




   function fileInputClick1(){
       $("#fileInput1").click();
       delAttach1();
   }
   function fileInputClick2(){
      $("#fileInput2").click(); 
      delAttach2();
   }
   function fileInputClick3(){
       $("#fileInput3").click(); 
       delAttach3();
   }
   function fileInputClick4(){
      $("#fileInput4").click(); 
      delAttach4();
   }
   function fileInputClick5(){
       $("#fileInput5").click(); 
       delAttach5();
   }
   function fileInputClick6(){
      $("#fileInput6").click();
      delAttach6();
   }
   function fileInputClick7(){
       $("#fileInput7").click(); 
       delAttach7();
   }
   function fileInputClick8(){
      $("#fileInput8").click(); 
      delAttach8();
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


 function updateSubmit(){
   if(confirm("이대로 수정하시겠습니까?")) {
       $(this).parent().click();
   } else {
       return false;
   }
   $("#updateForm").submit(); 

} 

 function selectReset(){
    
	delAttach1();
	delAttach2();
	delAttach3();
	delAttach4();
	delAttach5();
	delAttach6();
	delAttach7();
	delAttach8();
      
}
  
function delAttach1(){
   $("#delFid1").val($("#originFid1").val());
   $("#attachInput1").val(""); 
 } 
 
function delAttach2(){
   $("#delFid2").val($("#originFid2").val());
   $("#attachInput2").val("");  
 } 
function delAttach3(){
   $("#delFid3").val($("#originFid3").val());
   $("#attachInput3").val(""); 
 } 
function delAttach4(){
   $("#delFid4").val($("#originFid4").val());
   $("#attachInput4").val(""); 
 } 
function delAttach5(){
   $("#delFid5").val($("#originFid5").val());
   $("#attachInput5").val(""); 
 } 
function delAttach6(){
   $("#delFid6").val($("#originFid6").val());
   $("#attachInput6").val(""); 
 } 
function delAttach7(){
   $("#delFid7").val($("#originFid7").val());
   $("#attachInput7").val(""); 
 } 
function delAttach8(){
   $("#delFid8").val($("#originFid8").val());
   $("#attachInput8").val(""); 
 } 
</script>






</html>