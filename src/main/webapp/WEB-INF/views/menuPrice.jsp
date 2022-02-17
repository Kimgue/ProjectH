<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 높은 가격순</title>
</head>
<body>
<div id="menu_list">
		<c:forEach var="menu" items="${menu}">
			<c:url value="menuDetail" var="menuDetail">
					<c:param name="brandCode" value="${menu.brandCode}"/>
					<c:param name="menuCode" value="${menu.menuCode}"/>
					<c:param name="menuName" value="${menu.menuName}" />
			</c:url>
			<a href="${menuDetail}">
			<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="270" width="270" />
			</a>
			<p style="font-size: 15pt">
			<a href="${menuDetail}">
				<c:out value="메뉴명: ${menu.menuName}" />
			</a>
			</p>		
			<p style="font-size: 15pt">
				<c:out value="메뉴가격: ${menu.menuPrice}" />
			</p>		
			<hr>
		</c:forEach>
</div>
</body>
</html>