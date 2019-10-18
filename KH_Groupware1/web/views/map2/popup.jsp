<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
		<%
			String Aname = (String)request.getParameter("A");
			String Address = (String)request.getParameter("B");
			
			out.print(Aname); 
			out.print(Address); 
		%> 
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
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
				<%-- <input type="hidden" name="TR_LatLng" value="<%=Address%>"> --%> <!-- 주소-->
				<input type="hidden" name="ST_id" value="0">
			</table>
			<button type="submit">등록 완료</button>
		</form>
		 

</body>
</html> 