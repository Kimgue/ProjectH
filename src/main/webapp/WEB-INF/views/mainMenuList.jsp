<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>헝픽 메인 메뉴 리스트</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/menu/menu.js"></script>
    
</head>
<body id="page-top">
	<div class="mainMenuGrid text-center">
		<div class="h1 mainMenuGridText mb-3">
			각종 메뉴를 리뷰해보세요!
		</div>
		<c:forEach var="menu" items="${menu}">
			<div style="height:230px; "class="card d-inline-block shadow overflow-hidden mainMenu">
				<div class="card-body">
					<c:url value="menuDetail" var="menuDetail">
					<c:param name="brandCode" value="${menu.brandCode}"/>
					<c:param name="menuCode" value="${menu.menuCode}"/>
					<c:param name="menuName" value="${menu.menuName}" />
					</c:url>
					<a href="${menuDetail}">
						<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="200" width="200" />				
					</a>	
					<div class="h4"><c:out value="${menu.menuName}" /></div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>