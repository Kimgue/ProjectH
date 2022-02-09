<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 검색 결과</title>
<style>
hr {  
  width: 400px;
}
</style>
</head>
<body>
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
					
					<c:url value="review" var="reviewUrl">
						<c:param name="brandCode" value="${menuVo.brandDto.brandCode}"/>
						<c:param name="menuCode" value="${menuVo.menuDto.menuCode}"/>
						<c:param name="menuName" value="${menuVo.menuDto.menuName}" />
					</c:url>
					<a href="${reviewUrl}">상품 리뷰</a>	
				<hr>
	</c:forEach>
	</div>
</div>
</body>
</html>