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
				<h1>메뉴검색결과</h1>
				<br>
					<a href="menu">메뉴 페이지로</a>
				<br>
				<h4><c:out value="${ResultMsg}"/></h4>
				<div id="menuResult">
					<c:forEach var="menuVo" items="${menuVo}">
						<a href="#"> <img src="<c:out value="resources/${menuVo.menuDto.menuImg}"/>"
						alt="메뉴 이미지" height="270" width="270" /></a>
						<p style="font-size: 10pt">
							<c:out value="브랜드명: ${menuVo.brandDto.brandName}" />
						</p>
						<p style="font-size: 10pt">
							<c:out value="메뉴명: ${menuVo.menuDto.menuName}" />
						</p>
						<p style="font-size: 10pt">
							<c:out value="메뉴가격: ${menuVo.menuDto.menuPrice}" />
						</p>
						<p style="font-size: 10pt">
							<c:out value="메뉴설명: ${menuVo.menuDto.menuDescription}" />
						</p>
						<p style="font-size: 8pt">
							<c:out value="메뉴재료: ${menuVo.menuDto.menuIngredients}" />
						</p>
						
						<c:url value="menuDetail" var="menuDetail">
							<c:param name="brandCode" value="${menuVo.brandDto.brandCode}"/>
							<c:param name="menuCode" value="${menuVo.menuDto.menuCode}"/>
							<c:param name="menuName" value="${menuVo.menuDto.menuName}" />
						</c:url>
						<a href="${menuDetail}">상품 리뷰</a>	
						<hr>
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