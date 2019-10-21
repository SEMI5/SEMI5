<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<%@ include file = "../common/header.jsp" %> 
<title>Insert title here</title>

<style>
#S-title{
	width : 100%;
}
#summernote{
	height : 600px;
	
}

#S_commit{
	float : left;
}

#S-list{
	float : right;
}

#S-table{
	width : 1100px;
	font-size: 12px;
	line-height: 24px;
	margin: 30px auto;
	text-align: left;
}


/* 사진아래 구분 공간 */
#thum1{
	background : black;
} 

th{
	background : #fafafa;
	text-align : center;
}

</style>

</head>

<body>
<!-- 	<div id="log">
  <h3>Before $.noConflict(true)</h3>
</div>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
 
<script>
var $log = $( "#log" );
 
$log.append( "2nd loaded jQuery version ($): " + $.fn.jquery + "<br>" );
 
// Restore globally scoped jQuery variables to the first version loaded
// (the newer version)
 
jq162 = jQuery.noConflict( true );
 
$log.append( "<h3>After $.noConflict(true)</h3>" );
$log.append( "1st loaded jQuery version ($): " + $.fn.jquery + "<br>" );
$log.append( "2nd loaded jQuery version (jq162): " + jq162.fn.jquery + "<br>" );
</script>
 -->


<br><br><br><br>
	<div>
	<img src="<%=request.getContextPath() %>/images/hdd.jpg" style="width:100%; height:300px;">
		<div id = "thum1" style="width:100%; height:60px">
		</div>
	</div>
 <div class = "outer">
	<h2 align = "center">자료실 > 글쓰기 </h2>
<hr>
<table id = "S-table" border= "1";>
	<tr>
		<th width = "200px" height = "80px">제목*</th>
		<td><input type ="text" placeholder="제목을입력하세요" style="width:900px; height:35px;"></td>
	</tr>
	<tr>
		<th width = "200px"  height = "100px">작성자*</th>
		<td><input type ="text" style="height:35px;"> </td>
	</tr>
	<tr>
		<th width = "200px"  height = "100px">작성일</th>
		<td><input type ="date"> </td>
	</tr>
	<tr>
		<th> 내용</th>
	<!-- 	<th colspan="2" height = "50px">내용</th> -->
		<td colspan="2">
	</tr>
	 <td colspan ="2"><div id="summernote"></div></td> 
	<tr>
		<th width = "200px"  height = "100px">파일선택</th>
		<td><input type = "file"></td>
	</tr>
	

	<tr>
		<td colspan = "2">
			<button id = "S-commit" onClick="S-commit();"> 등록 </button>
			<button id = "S-list"> 목록 </button>
		</td>
		
	</tr>
	</table>

<!-- <div id="summernote"></div>  -->

</div>

<br><br><br><br>



<script>

	$('#summernote').summernote({
	  height: 300,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true                  // set focus to editable area after initializing summernote
	});
	

</script>



</body>
</html>