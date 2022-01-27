<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰</title>
<style>
hr {  
  width: 400px;
}
</style>
</head>

<body>
<div align="center">
		<h2>${menuName}의 상품리뷰</h2>
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
		<hr>
		리뷰 작성하기
		<table border="1">
		<tr>
			<td width=50>닉네임</td>
			<td width=40>점수</td>
			<td width=150>내용</td>
		</tr>
		<tr>
			<td><input type="text" id="memberNickname"></td><%-- 세션받아서 닉네임 설정해야함 --%>
			<td><input type="text" id="reviewScore"></td><%-- 리뷰 점수 css로 별점화 해야함 --%>
			<td><input type="text" id="reviewContent"></td><%-- 리뷰내용 --%>
		</tr>
		</table>
		<button onclick="">작성</button>
</div>
</body>
</html>