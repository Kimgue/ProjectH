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

    <title>헝픽 브랜드 메뉴보기</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
    
</head>

<body id="page-top">	
	<div id="content">
		<div id="menu_list" class="b-Div text-center">
			<c:forEach var="menuVo" items="${menuVo}">
				<div style="width:380px; height:400px;" class="card shadow mr-3 mb-3">
					<div class="card-body overflow-hidden">
						<img src="<c:out value="resources/${menuVo.menuDto.menuImg}"/>" alt="메뉴 이미지" height="200" width="200" />
						<div class="h3 font-weight-bolder"><c:out value="${menuVo.menuDto.menuName}" /></div>
						<div><c:out value="${menuVo.menuDto.menuPrice}"/>원</div>
						<div><c:out value="${menuVo.menuDto.menuIngredients}" /></div>
						<div class="font-weight-bold text-gray-800 mt-3"><c:out value="${menuVo.menuDto.menuDescription}" /></div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>