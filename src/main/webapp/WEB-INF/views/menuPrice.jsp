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

    <title>헝픽 메뉴 검색</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	
</head>

<body id="page-top">
	<!-- 메인 -->
	<div id="content">
		<div id="menu_list" class="m-Div text-center">
			<c:forEach var="menu" items="${menu}">
				<div style="width:750px; height:500px;" class="card shadow ml-3 mb-3">
					<div class="card-body">
						<div class="mt-3">
							<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="200" width="200" />
						</div>
						
						<div>
							<div class="h3 font-weight-bolder"><c:out value="${menu.menuName}" /></div>
							<div><c:out value="${menu.menuPrice}"/>원</div>
							<div><c:out value="${menu.menuIngredients}" /></div>
						</div>
						
						<div>
							<div class="font-weight-bold text-gray-800 mt-3">
								<c:out value="${menu.menuDescription}" />
							</div>
						</div>
						<c:url value="menuDetail" var="menuDetail">
							<c:param name="brandCode" value="${menu.brandCode}"/>
							<c:param name="menuCode" value="${menu.menuCode}"/>
							<c:param name="menuName" value="${menu.menuName}" />
						</c:url>
						<div class="mt-5">
							<a class="btn btn-warning" href="${menuDetail}">상세보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 메인 컨텐츠 끝 -->
	
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
    	
</body>
</html>