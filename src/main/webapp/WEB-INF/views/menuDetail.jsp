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
</body>
</html>