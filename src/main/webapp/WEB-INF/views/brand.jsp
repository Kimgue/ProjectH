<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>브랜드 소개</title>
<style>
hr {  
  width: 400px;
}​
</style>
</head>
<body>
<div align="center">
	<h1>브랜드</h1>
	<br>
	<a href="">메인 페이지로</a>
	<hr>
	<br>
	<div class="container">
	<c:forEach var="brand" items="${brand}">
		<a href="https://map.kakao.com/link/search/${brand.brandName}" target="_blank">가까운 매장찾기</a>
		<br>
		<a href="menuResult?brandCode=${brand.brandCode}&menuPrice=&menuName=">메뉴 보기</a>
		<br>
		<img src="<c:out value="resources/${brand.brandImg}" />" 
		alt="브랜드 이미지" height="270" width="270" />
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
</body>
</html>