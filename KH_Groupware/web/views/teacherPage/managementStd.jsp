<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member" %>
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
		padding: 20px;
	}

#content {
	margin: 15%;
	margin-top: 1%;

	width: 70%;
}

#stdList {
	display: inline-block;
	margin: 2%;
	width: 30%;
	height: 570px;
}

#consulting {
	display: inline-block;
	margin: 2%;
	width: 60%;
	height: 570px;
	text-align: center;
	
}

.consultingForm { 
	width: 100%;
	height: 400px;
	display: none;
	padding: 10px;
	border: 1px solid lightgrey;
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
	 font-size:12px;
	 width:15px;
	 height:15px
}

#stdInfoCheck>td{
	 width:350px;
	 height:80px;
	 text-align: left;"
}

#consulting td{
	width: 40%;
	height: 60px;
	border-bottom-width: 1px solid lightgrey;
}


#submitInfo:hover{
	background: white;
	cursor: pointer;
}

#stdList{
	font-size: 12px;
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
	<%@ include file="/views/common/header.jsp"%>
</header>






<body>
	<div id = "banner">	
		<img src="https://images2.imgbox.com/16/2a/21JdCHzj_o.jpg" alt="image host"/>
		<div  id = "mainTitle"><b style="margin-bottom: 3000px;">학생 관리</b></div>
	</div>

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
					<td><%=count %></td>
					<td><%=stdList.get(i).getUserName() %></td>
					<td><%=stdList.get(i).getRRN()%></td>
					<td><%=i%></td>
				</tr>
				<% count ++;} %>
			</table>
		</div>

		<div id="consulting">
			<%for(int i = 0; i < stdList.size() ; i++){ %>
			<div id="consulting<%=i%>" class = "consultingForm">
				<div class = "stdInfo">
					<h2 style = "text-align: left;"><%=stdList.get(i).getUserName() %> 상담일지</h2>
					<h4 style = "text-align: left;"><%=stdList.get(i).getAddress() %></h4>
					<%if(stdList.get(i).getConsult() == null){ %>
						<textarea style="resize: none; width: 100%; height: 250px;" name = "consult<%=i%>" placeholder = "내용을 입력하세요."></textarea>
					<%}else{ %>
						<textarea style="resize: none; width: 100%; height: 250px;" name = "consult<%=i%>"><%=stdList.get(i).getConsult() %></textarea>
					<%} %>
					<br><br><br>
					<table id = "stdInfoCheck">
						<tr>
							<td>
								<%
								String smkY = null, smkN = null;
								if(stdList.get(i).getSmoking() == null){
									/*  */
								}else if(stdList.get(i).getSmoking().equals("Y")){
									smkY = "checked";
								}else{
									smkN = "checked";
								}
								%>
								<label style="font-size:20px">흡연여부</label><br>
								<input type="radio" id="smokingY" name="smokingYN<%=i%>" value="Y" <%=smkY%>> 
								<label for="smokingY">Y</label> 
								<input type="radio" id="smokingN" name="smokingYN<%=i%>" value="N" <%=smkN%>>
								<label for="smokingN">N</label>
							</td>
							<td style="width:350px;height:80px;text-align: left;">
								
								<%
								String mjrY = null, mjrN = null;
								if(stdList.get(i).getMajor() == null){
									/*  */
								}else if(stdList.get(i).getMajor().equals("Y")){
									mjrY = "checked";
								}else{
									mjrN = "checked";
								}
								%>
								<label style="font-size:20px">전공유무</label><br>
								<input type="radio" id="majorY" name="majorYN<%=i%>" value="Y" <%=mjrY%>> 
								<label for="majorY">Y</label> 
								<input type="radio" id="majorN" name="majorYN<%=i%>" value="N" <%=mjrN%>>
								<label for="majorN">N</label>
							</td>
						</tr>
						<tr>
							<td>
								<%
								String[] level = new String[3];
								if(stdList.get(i).getStdLv() != null){
								switch(stdList.get(i).getStdLv()){
								case "3": level[0] = "checked"; break;
								case "2": level[1] = "checked"; break;
								case "1": level[2] = "checked"; break;	
								 }
								}
								 %>
								<label style="font-size:20px">학생Level</label><br>
								<input type="radio" id="beginningLv" name="stdLevel<%=i%>" value="3" <%= level[0]%>> 
								<label for="beginningLv">초급</label> 
								<input type="radio" id="intermediateLv" name="stdLevel<%=i%>" value="2" <%= level[1]%>>
								<label for="intermediateLv">중급</label>
								<input type="radio" id="advancedLv" name="stdLevel<%=i%>" value="1" <%= level[2]%>>
								<label for="advancedLv">고급</label>
							</td>
							<td style="width:350px;height:80px;text-align: left;">

								<%
								String expY = null, expN = null;
								if(stdList.get(i).getExp() == null){
									/*  */
								}else if(stdList.get(i).getExp().equals("Y")){
									expY = "checked";
								}else{
									expN = "checked";
								}
								%>
								<label style="font-size:20px">실무경험</label><br>
								<input type="radio" id="pExpY" name="PracticalExp<%=i%>" value="Y" <%=expY%>> 
								<label for="pExpY">Y</label> 
								<input type="radio" id="pExpN" name="PracticalExp<%=i%>" value="N" <%=expN%>>
								<label for="pExpN">N</label>
							</td>
							<td style="width:350px;height:80px;text-align: right;">
								<button id = "submitInfo" style="width:150px; height: 50px; font-size:20px; background: black; color: white;" onclick = "updateStd(<%=stdList.get(i).getUserNo()%>, <%=i%>);">
								저장하기
								</button>
								<script type="text/javascript">

								function updateStd (stdNo, i){
									 $.ajax({
										url:"/KH_Groupware/updateD.te",
										data:{
											stdNo : stdNo,
											consult : $("textarea[name=consult"+i+"]").val(),
											smoking : $("input[name=smokingYN"+i+"]:checked").val(),
											major : $("input[name=majorYN"+i+"]:checked").val(),
											level : $("input[name=stdLevel"+i+"]:checked").val(),
											exp : $("input[name=PracticalExp"+i+"]:checked").val()
											},
										success:function(data){	
											alert("정상적으로 저장되었습니다.");
											$("#consulting"+i).toggle(500);
											}
										}
									); 
								};
								
								$(function(){
									$("#c")
									
								});
								
								
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
		
		$("#consulting"+stdNum).toggle(800);
		$(".std").css("background","white")
		$("#consulting"+stdNum).css("display","table");
		$("#std"+stdNum).css({"background":"whitesmoke"});	
	};

</script>

