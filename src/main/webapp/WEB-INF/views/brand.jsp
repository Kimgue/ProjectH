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
			<div align="center">
				<h1>브랜드</h1>
				<br>
				<a href="main">메인 페이지로</a>
				<hr>
				<br>
				<div class="container">
					<c:forEach var="brand" items="${brand}">
						<a href="https://map.kakao.com/link/search/${brand.brandName}" target="_blank">가까운 매장찾기</a>
						<br>
						<a href="menuResult?brandCode=${brand.brandCode}&menuPrice=&menuName=">메뉴 보기</a>
						<br>
						<a href="${brand.brandLink}">
						<img src="<c:out value="resources/${brand.brandImg}" />" 
						alt="브랜드 이미지" height="270" width="270" />
						</a>
						<p style="font-size: 15pt">
							<c:out value="${brand.brandName}" />
						</p>
						<p style="font-size: 12pt">
							<c:out value="${brand.brandDescription}" />
						</p>
						<hr>
						<br>
					</c:forEach>
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