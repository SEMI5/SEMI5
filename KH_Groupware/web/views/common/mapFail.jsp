<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container" style="overflow: auto;">
		<div id="mainContent" style="overflow: auto; height: 276px;">
			<div style="width: 100%;height: 50px; background: black;"></div>
			<h2 style="text-align: -webkit-center;">FAIL!</h2>
		</div>
		<button id="close" style="inline-size: -webkit-fill-available; border: 0px solid black">close</button>
			<div style="width: 100%;height: 50px; background: black;"></div>
	</div>
	
	<script type="text/javascript">
		$("#close").click(function() {
			window.close();
		});
	</script>
</body>
</html>