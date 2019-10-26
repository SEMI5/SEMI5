<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>



div[choose="study"]{
  width: 200px;
  height: 100px;
  margin: 40px 0;
  cursor: pointer;
  transform-style: preserve-3d;
  transform-origin: center right;
  transition: transform 1s;
}


.front {
  position: absolute;
  width: 100%;
  height: 100%;
  color: white;
  text-align: center;
  backface-visibility: hidden;
  background: red;
}


.back {
  position: absolute;
  width: 100%;
  height: 100%;
  color: white;
  text-align: center;
  backface-visibility: hidden;
  background: blue;
  transform: rotateX(180deg);
}
</style>
</head>
<body>



		<div>
			<div id="study1" class="change" choose="study"
				onclick="toggleTrsf(1);">
				<div class="front">front</div>
				<div class="back">back</div>
			</div>
		</div>
		<div>
			<div id="study2" class="change" choose="study"
				onclick="toggleTrsf(2);">
				<div class="front">front</div>
				<div class="back">back</div>
			</div>
		</div>




	

	<script type="text/javascript">
		function toggleTrsf(id) {
			var card = $("#study" + id);
			if (card.hasClass("change") == true) {
				card.css("transform", "rotateX(-180deg)");
				card.removeClass("change");
			} else {
				card.css("transform", "");
				card.addClass("change");
			}
		}
		
		
		
	</script>

</body>
</html>