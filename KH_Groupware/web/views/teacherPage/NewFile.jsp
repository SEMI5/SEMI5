<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	ArrayList<Member> stdList = (ArrayList)session.getAttribute("stdList");

%>
	
	
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src = "http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>
<meta charset="UTF-8">
<title>학생관리</title>
<style type="text/css">
#outer{
		width: 100%;
		height: 100%;
		border: 3px solid red;
		padding: 20px;
	}

#content {
	margin: 5%;
	margin-top: 3%;
	border: 5px solid black;
}

#stdList {
	display: inline-block;
	margin: 2%;
	border: 5px solid black;
	width: 30%;
	height: 770px;
}

#consulting {
	display: inline-block;
	margin: 2%;
	border: 5px solid black;
	width: 60%;
	height: 770px;
	
}

.consultingForm {
	border: 3px solid red; 
	width: 100%;
	height: 700px;
	display: none;
	padding: 10px;
	}

#stdList>table {
	width: 100%;
	border-top: 0.5px solid darkgray;
	border-collapse: collapse;
}

#stdList>th, #stdList td {
	text-align: center;
	border-bottom: 0.5px solid darkgray;
	padding: 1.5px;
}

#stdInfoCheck>input, #stdInfoCheck>button{
	 font-size:17px;
	 width:15px;
	 height:15px
}

#stdInfoCheck>td{
	 width:350px;
	 height:80px;
	 text-align: left;"
}



</style>


</head>

<header>
	<%@ include file="/views/common/header.jsp"%>
</header>






<body>
<div id = "outer">
	<div id="content">
		<div id="stdList">
			<table>
				<tr>
					<th width="100px">학생번호</th>
					<th width="200px">학생이름</th>
					<th width="250px">생년월일</th>
					<th width="150px">비고</th>
				</tr>
				<%for(int i = 0; i < stdList.size() ; i++){ %>
				<tr id="std<%=i%>" class="std" onclick = "showConsultingForm(<%=i%>);">
					<td><%=stdList.get(i).getUserNo() %></td>
					<td><%=stdList.get(i).getUserName() %></td>
					<td><%=stdList.get(i).getRRN()%></td>
					<td><%=i%></td>
				</tr>
				<%} %>
			</table>
		</div>

		<div id="consulting">
			<%for(int i = 0; i < stdList.size() ; i++){ %>
			<div id="consulting<%=i%>" class = "consultingForm">
				<div class = "stdInfo">
					<h2><%=stdList.get(i).getUserName() %> 상담일지</h2>
					<h4><%=stdList.get(i).getAddress() %></h4>
					<textarea rows="25" cols="150" style="resize: none" name = "consult"><%=stdList.get(i).getConsult() %></textarea>
					<br><br><br>
					<table id = "stdInfoCheck">
						<tr>
							<td>
								<label style="font-size:20px">흡연여부</label>
								<input type="radio" id="smokingY" name="smokingYN" value="Y" > 
								<label for="smokingY">Y</label> 
								<input type="radio" id="smokingN" name="smokingYN" value="N" >
								<label for="smokingN">N</label>
							</td>
							<td style="width:350px;height:80px;text-align: left;">
								<label style="font-size:20px">전공유무</label>
								<input type="radio" id="majorY" name="majorYN" value="Y"> 
								<label for="majorY">Y</label> 
								<input type="radio" id="majorN" name="majorYN" value="N">
								<label for="majorN">N</label>
							</td>
							
						</tr>
						<tr>
							<td>

								<label style="font-size:20px">학생Level</label>
								<input type="radio" id="beginningLv" name="stdLevel" value="3"> 
								<label for="beginningLv">초급</label> 
								<input type="radio" id="intermediateLv" name="stdLevel" value="2">
								<label for="intermediateLv">중급</label>
								<input type="radio" id="advancedLv" name="stdLevel" value="1">
								<label for="advancedLv">고급</label>
							</td>
							<td style="width:350px;height:80px;text-align: left;">

								<label style="font-size:20px">실무경험</label>
								<input type="radio" id="pExpY" name="PracticalExp" value="Y"> 
								<label for="pExpY">Y</label> 
								<input type="radio" id="pExpN" name="PracticalExp" value="N">
								<label for="pExpN">N</label>
							</td>
							<td style="width:350px;height:80px;text-align: right;">
								<button id = "submitInfo" style="width:250px;height:50px; font-size:30px;" onclick = "updateStd(<%=stdList.get(i).getUserNo()%>, <%=stdList.get(i).getUserId()%>);">
								저장하기
								</button>
								<script type="text/javascript">

								function updateStd (stdNo, userId){
									 $.ajax({
										url:"/KH_Groupware/updateD.te",
										data:{stdNo:stdNo,
											consult:$("textarea[name=consult]").val(),
											smoking:$("input[name=smokingYN]:checked").val(),
											major:$("input[name=majorYN]:checked").val(),
											level:$("input[name=stdLevel]:checked").val(),
											exp:$("input[name=PracticalExp]:checked").val(),
											userId:userId},
										success:function(data){	
											$(".consultingForm").css("display","none");
											}
										}
									); 
								};
								
								<%
									String smokingYN;
									String majorYN;
									String expYN;
									String stdLV;
								
									if(stdList.get(i).getSmoking() == null){
										smokingYN = null;
									} else{
										smokingYN = stdList.get(i).getSmoking();
									}
									
									if(stdList.get(i).getMajor() == null){
										majorYN = null;
									} else{
										majorYN = stdList.get(i).getMajor();
									}
									
									if(stdList.get(i).getExp() == null){
										expYN = null;
									} else{
										expYN = stdList.get(i).getExp();
									}
									
									if(stdList.get(i).getStdLv() == null){
										stdLV = null;
									} else{
										stdLV = stdList.get(i).getStdLv();
									}
								
								%>
								

								if(<%=smokingYN%> == "Y"){
									$("#smokingY").prop("checked", true);
								}else{
									$("#smokingN").prop("checked", true);
								}
								
								
								if(<%=expYN%> == "Y") {
									$("#pExpY").prop("checked", true);
								}else if(<%=expYN%> == "N"){
									$("#pExpN").prop("checked", true);
								}
								
								if(<%=majorYN%> == "Y") {
									$("#majorY").prop("checked", true);
								}else if(<%=majorYN%> == "N"){
									$("#majorN").prop("checked", true);
								}
								
								
								switch(stdLV){
									case "3": $("#beginningLv").prop("checked", true); break;
									case "2": $("#intermediateLv").prop("checked", true); break;
									case "1": $("#advancedLv").prop("checked", true); break;
								}
								


								</script>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</div>
</body>




<footer>
	<%@ include file="/views/common/footer.jsp"%>
</footer>



<script type="text/javascript">

	$(".std").hover(function() {
		  $(this).css({"color":"darkgray", "cursor" : "pointer"});
		}, function(){
		  $(this).css("color", "black");
		});

	
	function showConsultingForm(stdNum){
		
		$(".consultingForm").css("display","none");
		$(".std").css("background","white")
		$("#consulting"+stdNum).css("display","table");
		$("#std"+stdNum).css({"background":"whitesmoke"});	
	};

</script>

