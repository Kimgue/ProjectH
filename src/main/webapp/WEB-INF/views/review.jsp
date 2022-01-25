<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰</title>
</head>
<h2>${menuName}의 상품리뷰</h2>
<body>
<div align="center">
		<br>
		<a href="menu">메뉴 페이지로</a>
		<br>
		<table border="1">
		<tr>
			<td width=50>닉네임</td>
			<td width=40>점수</td>
			<td width=80>리뷰날짜</td>
			<td width=150>내용</td>
			<td width=120>상세리뷰</td>
	
		</tr>
		<c:forEach var="review" items="${review}">
			<tr>
				<td><c:out value="${review.memberDto.memberNickname}" /></td>
				<td><c:out value="${review.reviewDto.reviewScore}" /></td>
				<td><c:out value="${review.reviewDto.reviewDate}" /></td>
				<td><c:out value="${review.reviewDto.reviewContent}" /></td>
				
				<c:url value="reviewLookup" var="lookupUrl">
				<c:param name="brandCode" value="${review.reviewDto.brandCode}"/>
				<c:param name="menuCode" value="${review.reviewDto.menuCode}" />
				<c:param name="reviewCode" value="${review.reviewDto.reviewCode}" />
				<c:param name="memberCode" value="${review.reviewDto.memberCode}" />
				</c:url>
				<td><a href="${lookupUrl}">상세 리뷰 보기</a></td>
			</tr>
				
		</c:forEach>
		</table>	
		<%-- 
			<c:url value="reviewWrite" var="writeUrl">
				<c:param name="nickName" value="${memberNickname}"/>
				<c:param name="menuName" value="${menuName}" />
			</c:url>
		<a href="${writeUrl}">리뷰 작성하기</a>
		 세션에서 회원 정보 받아서 회원 닉네임 넘기기 
		--%>
</div>
</body>
</html>