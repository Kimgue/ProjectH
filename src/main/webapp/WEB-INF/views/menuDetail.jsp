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
				<h2>${menuName}</h2>
				<br>
				<a href="menu">메뉴 페이지로</a>
				<br>
				<a href="#"> 
				<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="270" width="270" />
				</a>
				<p style="font-size: 15pt">
					<c:out value="메뉴명: ${menu.menuName}" />
				</p>
				<p style="font-size: 15pt">
					<c:out value="메뉴가격: ${menu.menuPrice}" />
				</p>
				<p style="font-size: 12pt">
					<c:out value="메뉴설명: ${menu.menuDescription}" />
				</p>
				<p style="font-size: 12pt">
					<c:out value="메뉴재료: ${menu.menuIngredients}" />
				</p>
				<hr>
				<table border="1">
					<tr>
						<td width=50>닉네임</td>
						<td width=40>점수</td>
						<td width=100>리뷰날짜</td>
						<td width=150>내용</td>
						<td width=120>상세리뷰</td>	
					</tr>
				<c:forEach var="review" items="${review}">
					<tr>
						<td><c:out value="${review.memberDto.memberNickname}" /></td>
						<td><c:out value="${review.reviewDto.reviewScore}" /></td>
						<td><c:out value="${review.reviewDto.reviewDate}" /></td>
						<td><c:out value="${review.reviewDto.reviewContent}" /></td>
						
						<c:url value="reviewLookup" var="reviewLookup">
							<c:param name="brandCode" value="${review.reviewDto.brandCode}"/>
							<c:param name="menuCode" value="${review.reviewDto.menuCode}" />
							<c:param name="reviewCode" value="${review.reviewDto.reviewCode}" />
							<c:param name="memberCode" value="${review.reviewDto.memberCode}" />
						</c:url>
						<td><a href="${reviewLookup}">상세 리뷰 보기</a></td>
					</tr>
					<br>
				</c:forEach>
				</table>	
				<hr>
				<c:url value="reviewWrite" var="reviewWrite">
					<c:param name="brandCode" value="${menu.brandCode}"/>
					<c:param name="menuCode" value="${menu.menuCode}" />
					<c:param name="menuName" value="${menu.menuName}" />
				</c:url>
				<a href="${reviewWrite}">리뷰 작성하기</a>
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