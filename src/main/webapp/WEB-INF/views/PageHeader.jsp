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
    
</head>

<body id="page-top">

	<!-- 상단바 시작 -->
	<nav class="navbar navbar-expand navbar-light bg-white topbar static-top shadow">
	
	<!-- 사이드바 토글 버튼 (상단에 붙은것) -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>
	
	<!-- 상단바 : 검색 -->
	<form action="menuResult" class="navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small" name="menuName" placeholder="메뉴 이름 검색" aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-warning" type="submit">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>

	<!-- 상단바 : 회원버튼 -->
	<%-- <ul class="navbar-nav">
		<c:choose>
			<c:when test="${loginBool eq true}">
				<c:choose>
					<c:when test="${not empty adminDTO}">
						<li class="nav-item dropdown no-arrow">
							<input class="btn btn-primary" type="button" id="userDropdown" value="${adminDTO.adminName}"data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
							<a class="dropdown-item" href="adminPage">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 관리자 페이지
							</a>
							<a class="dropdown-item" href="userMyInfo">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 마이페이지
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="userLogout">
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
							</a>
							</div>
						</li>
					</c:when>
					<c:otherwise>
					<li class="nav-item dropdown no-arrow">
						<input class="btn btn-primary" type="button" id="userDropdown" value="${memberDTO.memberName}"data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
						<a class="dropdown-item" href="userMyInfo">
							<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 마이페이지
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="userLogout">
							<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
						</a>
						</div>
					</li>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
			<a class="btn rounded-0 border-right" href="userLogin">로그인</a>
			<a class="btn rounded-0" href="userSignUp">회원가입</a>			
			</c:otherwise>
		</c:choose>
	</ul> --%>

	</nav>
	<!-- 상단바 끝 -->
	
</body>
</html>