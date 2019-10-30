<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="member.model.vo.Member" %>
		<%
		    //Member loginUser = (Member)session.getAttribute("loginUser");
			String Aname = (String)request.getParameter("A");
			String Address = (String)request.getParameter("B");
			
			//out.print(Aname); 
			//out.print(Address); 
		%> 
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	likeBtn{
		width: 20px;
		height: 20px;
	}
	#completeBtn{
		background: gainsboro; border: 0px solid black; color: black;
		font-weight: bolder;
	}
	#completeBtn:hover {
		background: black;
		color: white;
		opacity: 0.7;
	}
</style>
</head>
<body>
	<div id="container" style="overflow: auto;">
		<div id="mainContent" style="overflow: auto; height: 276px;">
					<div style="width: 100%;height: 50px; background: black;"></div>
					<h2 id="h">맛집 등록</h2>
				
						<form id="listForm" action="<%=request.getContextPath()%>/insert.tr" method="post">
						<table>
							<tr>
								<td>가게 명 : </td>
								<td><input name="TR_name" id="TR_name" type="text" maxlength="50" value="<%=Aname %>" readonly required></td>
							</tr>
							<tr>
								<td>한줄 평 : </td>
								<td><textarea  name="TR_memo" id="TR_memo" placeholder="간단하게 등록" rows="2" value="1" required style="resize:none;"></textarea></td>
							</tr>
							<tr>
								<td>주소 : </td>
								<td><input name="TR_LatLng" id=TR_LatLng type="text" maxlength="50" value="<%=Address %>" readonly required></td>
							</tr>
							<input type="hidden" name="TR_LatLng" value="<%=Address%>"> <!-- 주소-->
							<input type="hidden" name="ST_id" value="0">
						</table>
							<button type="submit" id="completeBtn" onclick="complete">등록 완료</button>
					</form>
			
		</div>
			<div style="width: 100%;height: 50px; background: black;"></div>
	</div>

</body>
</html> 