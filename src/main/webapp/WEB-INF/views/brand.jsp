<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>브랜드 소개</title>
<style>

.container {
	display:flex;
}
</style>
</head>
<body>
<div align="center">
	<h1>브랜드</h1>
	<br>
	<a href="">메인 페이지로</a>
	<br>
	<div class="container">
	<c:forEach var="brand" items="${brand}">
		<a href="#"> <img
			src="<c:out value="resources/${brand.brandImg}"/>" alt="브랜드 이미지"
			height="270" width="270" /></a>
		<p style="font-size: 15pt">
			<c:out value="${brand.brandName}" />
		</p>
		<p style="font-size: 12pt">
			<c:out value="${brand.brandDescription}" />
		</p>
	</c:forEach>
	</div>
</div>
</body>
</html>