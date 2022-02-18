<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 리뷰</title>
<script src="resources\js\jquery-3.4.1.min.js"></script>
<script>
var reviewImg = '<c:out value= "${Lookup.reviewDto.reviewImg}"/>';
var imgFile = reviewImg.split(',');
var filePath = "images/review/"
var reviewImg1 = filePath + imgFile[0];
var reviewImg2 = filePath + imgFile[1];
	
$(document).ready(function()
		{
			console.log(reviewImg1);
			console.log(reviewImg2);
			$("#reviewImg1").attr("src", reviewImg1);
			$("#reviewImg2").attr("src", reviewImg2);
		});	
</script>
</head>
<body>
<div align="center">
	<img id="reviewImg1" alt="리뷰 이미지" height="270" width="270" />
	<img id="reviewImg2" alt="리뷰 이미지" height="270" width="270" />
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