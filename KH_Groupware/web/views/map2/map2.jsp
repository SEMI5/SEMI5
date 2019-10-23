<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="member.model.vo.*, map.model.vo.*" %>
<%
	Member loginUser2 = (Member)session.getAttribute("loginUser"); // 지도api에서 변수명 겹치는것 있음. loginUser -> loginUser2로.. 변경
%>
<!DOCTYPE html>

<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<meta charset="utf-8">
	
	<!-- 지도 CSS -->
	<style>
		.map_wrap, .map_wrap * {
			margin: 0;
			padding: 0;
			font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
			font-size: 12px;
		}
		
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
			color: #000;
			text-decoration: none;
		}
		
		.map_wrap {
			position: relative;
			width: 100%;
			height: 500px;
		}
		
		#menu_wrap {
			position: absolute;
			top: 0;
			left: 0;
			bottom: 0;
			width: 250px;
			margin: 10px 0 30px 10px;
			padding: 5px;
			overflow-y: auto;
			background: rgba(255, 255, 255, 0.7);
			z-index: 1;
			font-size: 12px;
			border-radius: 10px;
		}
		
		.bg_white {
			background: #fff;
		}
		
		#menu_wrap hr {
			display: block;
			height: 1px;
			border: 0;
			border-top: 2px solid #5F5F5F;
			margin: 3px 0;
		}
		
		#menu_wrap .option {
			text-align: center;
		}
		
		#menu_wrap .option p {
			margin: 10px 0;
		}
		
		#menu_wrap .option button {
			margin-left: 5px;
		}
		
		#placesList li {
			list-style: none;
		}
		
		#placesList .item {
			position: relative;
			border-bottom: 1px solid #888;
			overflow: hidden;
			cursor: pointer;
			min-height: 65px;
		}
		
		#placesList .item span {
			display: block;
			margin-top: 4px;
		}
		
		#placesList .item h5, #placesList .item .info {
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
			position: initial;  /* 포지션을 맨 앞으로 하는것임. */
		}
		
		
		#placesList .item .info {
			padding: 10px 0 10px 55px;
		}
		/*   .item :hover {
		 	background: black;
			opacity: 0.2;
		}  */
		
		#placesList .info .gray {
			color: #8a8a8a;
		}
		
		#placesList .info .jibun {
			padding-left: 26px;
			background:
				url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
				no-repeat;
		}
		
		#placesList .info .tel {
			color: #009900;
		}
		
		#placesList .item .markerbg {
			float: left;
			position: absolute;
			width: 36px;
			height: 37px;
			margin: 10px 0 0 10px;
			background:
				url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
				no-repeat;
		}
		
		#placesList .item .marker_1 {
			background-position: 0 -10px;
		}
		
		#placesList .item .marker_2 {
			background-position: 0 -56px;
		}
		
		#placesList .item .marker_3 {
			background-position: 0 -102px
		}
		
		#placesList .item .marker_4 {
			background-position: 0 -148px;
		}
		
		#placesList .item .marker_5 {
			background-position: 0 -194px;
		}
		
		#placesList .item .marker_6 {
			background-position: 0 -240px;
		}
		
		#placesList .item .marker_7 {
			background-position: 0 -286px;
		}
		
		#placesList .item .marker_8 {
			background-position: 0 -332px;
		}
		
		#placesList .item .marker_9 {
			background-position: 0 -378px;
		}
		
		#placesList .item .marker_10 {
			background-position: 0 -423px;
		}
		
		#placesList .item .marker_11 {
			background-position: 0 -470px;
		}
		
		#placesList .item .marker_12 {
			background-position: 0 -516px;
		}
		
		#placesList .item .marker_13 {
			background-position: 0 -562px;
		}
		
		#placesList .item .marker_14 {
			background-position: 0 -608px;
		}
		
		#placesList .item .marker_15 {
			background-position: 0 -654px;
		}
		
		#pagination {
			margin: 10px auto;
			text-align: center;
		}
		
		#pagination a {
			display: inline-block;
			margin-right: 10px;
		}
		
		#pagination .on {
			font-weight: bold;
			cursor: default;
			color: #777;
		}
		.info{
			
		}
	</style>

</head>
<body>


	<!-- 지도 안, 검색박스  -->
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white" style="z-index: 2;">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="" id="keyword" required><br>
						<button type="submit">검색</button>
						<!-- 로그인 한 사람만 등록 가능하게함. -->
						<%if(loginUser2 != null){ %>
						<button type="button" onclick="popupOpen();">등록</button>
						<%}%>
					</form>
				</div>
			</div>
			<hr>
			<ul class="placesList2" id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

    <!-- 팝업 로드 -->
	<script>
		function popupOpen(){
		var popUrl = "popup.jsp?A="+A+"&B="+B;	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
	</script>	

	<!-- 지도 API로드 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9db7af1214b0f763e2d8fd3b9129b6d9&libraries=services"></script>
	
	<!-- 지도 로직 -->
	<script>

		// 마커를 담을 배열
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.4990000,127.0328800), // 지도의 중심좌표(KH학원 기준)
			level : 4
		// 지도의 확대 레벨
		};
		// 지도를 생성
		var map = new kakao.maps.Map(mapContainer, mapOption);

		
		// 지도에 원을 표시(학원에서 250m기준)
		var circle = new kakao.maps.Circle({
			map: map, // 원을 표시할 지도 객체
			center : new kakao.maps.LatLng(37.4990000,127.03288002), // 지도의 중심 좌표
			radius : 250, // 원의 반지름 (단위 : m)
			fillColor: '#f8fc09', // 채움 색
			fillOpacity: 0.2, // 채움 불투명도
			strokeWeight: 1, // 선의 두께
			strokeColor: '#83842f', // 선 색
			strokeOpacity: 0.3, // 선 투명도 
			strokeStyle: 'solid' // 선 스타일
		});	
		
		

		// 장소 검색 객체를 생성
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
				
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				//alert('맛집을 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

	
		var B = null;
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'click',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});
					
					/* document.getElementById('placesList').onclick = function () {
						displayInfowindow(marker, title);
						}; */
					
						
					  itemEl.onmousedown = function() {
						displayInfowindow(marker, title);
						$(this).css({"background":"black","color":"white","opacity":"0.5"});
						// 주소를 B에 담았음
						B = $(this).find("#address").text();  // find메소드로 하위 개체들을 찾아올 수 있게 해줘야, 정확한 위치로 간다.
						//alert(B);
						var ExistList = $("tr #storeName").text();
						var CheckingList = title;
						
						/* 이름 같은것 추가 */
				 		if(ExistList.match(CheckingList) ){
							var result = confirm("이미 등록된 가게입니다. 좋아요를 자동선택 하시겠습니까?");
							
							
							if(result){
									//예 눌렀을 때,
									var strList = $("tr #storeName").text();
									var strListSplit = strList.split(".");

									for(var i = 1; i<strListSplit.length; i++){
												if(title == strListSplit[i])
													$("#likeTd"+i).trigger('click');	// #trg에 선언된 click이벤트의 이벤트 핸들러 함수를 호출
									}
								}else {
								//아니오 눌렀을 때,
								
								}
						
							
							}else {
							alert("등록되지 않은 가게입니다. '등록' 버튼을 눌러주세요");
						}  
					};
					
					
					
					itemEl.onmouseout = function() {
						infowindow.close();
					};   	
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
		// ##################################################################### 여기서 뽑아와야함.
		// 검색결과 항목을 Element로 반환하는 함수입니다
		
 		function getListItem(index, places) {
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5 id="TRname2">' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span id=address>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';
			
			return el;
		} 

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		
		// 인포윈도우에 장소명을 표시합니다
		var A = null;
		
		function displayInfowindow(marker, title) {
		 	var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>'; 
			
			infowindow.setContent(content);
			infowindow.open(map, marker);
			
			A = title;
		    // marker.getPosition(); 해당 마커의 좌표값받아오는것.
		}
		
		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
		
		// 주소를 좌표로 변환해주는 객체
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	</script>


</body>
</html>