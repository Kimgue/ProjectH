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
	<c:forEach var="menuVo" items="${menuVo}">
		<div class="col-md-3">
			<div class="thumbnail">
				<a href="#"> <img src="<c:out value="resources/${menuVo.menuDto.menuImg}"/>"
					alt="메뉴 이미지" height="270" width="270" /></a>
				<div class="caption">
					<p style="font-size: 10pt">
						<c:out value="${menuVo.brandDto.brandName}" />
					</p>
					<p style="font-size: 10pt">
						<c:out value="${menuVo.menuDto.menuName}" />
					</p>
					<p style="font-size: 10pt">
						<c:out value="${menuVo.menuDto.menuPrice}" />
					</p>
					<p style="font-size: 10pt">
						<c:out value="${menuVo.menuDto.menuDescription}" />
					</p>
					<p style="font-size: 8pt">
						<c:out value="${menuVo.menuDto.menuIngredients}" />
					</p>
					
					<c:url value="review" var="url">
						<c:param name="brandCode" value="${menuVo.brandDto.brandCode}"/>
						<c:param name="menuCode" value="${menuVo.menuDto.menuCode}"/>
						<c:param name="menuName" value="${menuVo.menuDto.menuName}" />
					</c:url>
					<a href="${url}">상품 리뷰</a>
					<%--
					<c:out value="리뷰개수: ${menuVo.brandDto.brandName}" />
					 --%>
				</div>
			</div>
		</div>
		<hr>
	</c:forEach>
</div>
</body>
</html>