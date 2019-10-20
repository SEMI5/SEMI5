	const fill = document.querySelector("#sdt");
	const empties = document.querySelectorAll(".empty");
	
	fill.addEventListener("dragstrat", dragStart);
	fill.addEventListener("dragend", dragEnd);
	
	function dragStart(){
		console.log("start");
	}
	
	function dragEnd(){
		console.log("end");
	}
