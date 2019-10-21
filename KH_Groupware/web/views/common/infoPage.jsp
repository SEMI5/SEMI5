<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container {
  border: 2px solid #ccc;
  background-color: #eee;
  border-radius: 5px;
  padding: 16px;
  margin: 16px 0
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  margin-right: 20px;
  border-radius: 50%;
}

.container span {
  font-size: 20px;
  margin-right: 15px;
}

@media (max-width: 500px) {
  .container {
      text-align: center;
  }
  .container img {
      margin: auto;
      float: none;
      display: block;
  }
}
</style>


</head>
<body>
	<%@ include file = "header.jsp" %>
<h2>Responsive Testimonials</h2>
<p>Resize the browser window to see the effect.</p>

<div class="container">
  <img src="../../images/bandmember.jpg" alt="Avatar" style="width:90px">
  <p><span>Chris Fox.</span> CEO at Mighty Schools.</p>
  <p>John Doe saved us from a web disaster.</p>
</div>

<div class="container">
  <img src="../../images/bandmember.jpg"" alt="Avatar" style="width:90px">
  <p><span>Rebecca Flex.</span> CEO at Company.</p>
  <p>No one is better than John Doe.</p>
</div>

<div class="container">
  <img src="../../images/bandmember.jpg"" alt="Avatar" style="width:90px">
  <p><span>Rebecca Flex.</span> CEO at Company.</p>
  <p>No one is better than John Doe.</p>
</div>

<div class="container">
  <img src="../../images/bandmember.jpg"" alt="Avatar" style="width:90px">
  <p><span>Rebecca Flex.</span> CEO at Company.</p>
  <p>No one is better than John Doe.</p>
</div>
</body>
</html>