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

    <title>헝픽</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
    
</head>

<body>	
	<div id="content">
		<div id="menuResult">
			<c:forEach var="menuVo" items="${menuVo}">
				<div class="card shadow h-100 py-2 rounded-0">
					<div class="card-body">
					<div class="menu-grid">
						<div class="menuImg ml-n3">
							<img class="overflow-hidden" src="<c:out value="resources/${menuVo.menuDto.menuImg}"/>" alt="메뉴 이미지" height="250" width="250" />
						</div>
						
						<div class="menuTitle">
							<div class="h3 font-weight-bolder">
								<c:out value="${menuVo.menuDto.menuName}" />
							</div>
							<div><c:out value="${menuVo.menuDto.menuPrice}" />원</div>
							<div><c:out value="${menuVo.menuDto.menuIngredients}" /></div>
						</div>
	
						<div class="menuDescription">
							<div class="font-weight-bold text-gray-800 mt-3">
								<c:out value="${menuVo.menuDto.menuDescription}" />
							</div>
						</div>
					</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>