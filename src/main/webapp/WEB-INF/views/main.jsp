<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>헝픽</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
    
</head>

<body>
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	<!-- 사이드바 -->
	<jsp:include page="PageSide.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
	<!-- 상단 -->
	<jsp:include page="PageHeader.jsp" flush="false"/>
					
		<!-- 메인 -->
		<div id="content">	
			<!-- 슬라이드 -->
			<div class="slide">
				<input type="radio" name="pos" id="pos1" checked>
				<input type="radio" name="pos" id="pos2">
				<input type="radio" name="pos" id="pos3">
				<input type="radio" name="pos" id="pos4">
				<ul>
					<li>테스트1</li>
					<li>테스트2</li>
					<li>테스트3</li>
					<li>테스트4</li>
				</ul>
				<p class="bullet">
					<label for="pos1">1</label>
					<label for="pos2">2</label>
					<label for="pos3">3</label>
					<label for="pos4">4</label>
				</p>
			</div>
			
			<!-- 메뉴 리스트 -->
			<h1 class="text-center">메뉴 리스트</h1>
			<div class="d-flex align-items-center justify-content-center">
				<div class="md">
					<div class="mdList">1</div>
					<div class="mdList">2</div>
					<div class="mdList">3</div>
					<div class="mdList">4</div>
					<div class="mdList">5</div>
					<div class="mdList">6</div>
					<div class="mdList">7</div>
					<div class="mdList">8</div>
					<div class="mdList">9</div>
				</div>
			</div>
			
		</div>
		<!-- 메인 컨텐츠 끝 -->
			
	<!-- 하단 -->
	<jsp:include page="PageFooter.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 끝 -->
	</div>
	<!-- 페이지 Wrapper 끝 -->
	</div>
	<!-- 페이지 상단 버튼 -->
	<jsp:include page="PageTopBtn.jsp" flush="false"/>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>	
</body>
</html>