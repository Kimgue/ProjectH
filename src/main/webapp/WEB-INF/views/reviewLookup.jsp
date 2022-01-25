<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 리뷰</title>
</head>
<body>
<div align="center">
	<img src="<c:out value="resources/${Lookup.reviewDto.reviewImg1}"/>"
		alt="리뷰 이미지" height="270" width="270" />
	<img src="<c:out value="resources/${Lookup.reviewDto.reviewImg2}"/>"
		alt="리뷰 이미지" height="270" width="270" />
		<div class="caption">
		<button onclick="history.back()">상품 리뷰로</button>	
		<p style="font-size: 10pt">
			<c:out value="${Lookup.memberDto.memberNickname}" />
		</p>
		<p style="font-size: 10pt">
			<c:out value="${Lookup.reviewDto.reviewScore}" />
		</p>
		<p style="font-size: 10pt">
			<c:out value="${Lookup.reviewDto.reviewDate}" />
		</p>
		<p style="font-size: 10pt">
			<c:out value="${Lookup.reviewDto.reviewContent}" />
		</p>
		</div>
</div>
</body>
</html>