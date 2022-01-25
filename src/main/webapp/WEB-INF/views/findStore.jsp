<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Kakao 지도 시작하기</title>
</head>
<body>
	<div align="center">
	<h4>${brandName}의 매장 찾기</h4>
	<div id="map" style="width:500px;height:400px;"></div>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8547f93b54406e59c3af7f31d598309a&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
	</div>
</body>
</html>