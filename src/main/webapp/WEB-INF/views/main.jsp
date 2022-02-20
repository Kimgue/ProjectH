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
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
</head>

<body>
	
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	
	<!-- 사이드바 시작 -->
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		<div class="sticky-left">
			<!-- 사이드바 : 메인 페이지 -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="main">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
			<div class="sidebar-brand-text mx-3">메인 페이지</div>
			</a>
			
			<!-- 구분선 -->
			<hr class="sidebar-divider my-0">
			
			<!-- 사이드바 : 메뉴 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Menu" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-fw fa-wrench"></i> <span>메뉴</span>
				</a>
				<div id="Menu" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="menu">메뉴 검색</a>
					</div>
				</div>
			</li>
			
			<!-- 사이드바 : 브랜드 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Brand" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-fw fa-wrench"></i> <span>브랜드</span>
				</a>
				<div id="Brand" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="brand">브랜드 검색</a>
					</div>
				</div>
			</li>
			
			<!-- 사이드바 : 공지사항 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Notice" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-fw fa-wrench"></i> <span>공지사항</span>
				</a>
				<div id="Notice" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="AdminNoticelist">공지사항 조회</a>
					</div>
				</div>
			</li>
			
			<!-- 사이드바 : 질문과 답변 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#QnA" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-fw fa-wrench"></i> <span>질문과 답변</span>
				</a>
				<div id="QnA" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="Nconfirm">질문과 답변</a>
					</div>
				</div>
			</li>
			
			<!--사이드바 : 이달의 기프티콘 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Gifticon" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-fw fa-wrench"></i> <span>이달의 기프티콘</span>
				</a>
				<div id="Gifticon" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="gifticonListUser">기프티콘 조회</a>
					</div>
				</div>
			</li>
			
			<!-- 구분선 -->
			<hr class="sidebar-divider d-none d-md-block">
			
			<!-- 사이드바 토글 버튼 -->			
			<div class="d-flex align-items-center justify-content-center">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</div>
	</ul>
	<!-- 사이드바 끝 -->
	
	<!-- 컨텐츠 Wrapper 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
	
	<!-- 메인 컨텐츠 -->
	<div id="content">

	<!-- 상단바 시작 -->
	<nav class="navbar navbar-expand navbar-light bg-white topbar static-top">
	
	<!-- 사이드바 토글 버튼 (상단에 붙은것) -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>
	
	<!-- 상단바 : 검색 -->
	<form action="menuResult" id="menuSearch" class="navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small" name="menuName" placeholder="메뉴 검색" aria-label="Search" aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="submit">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>

	<!-- 상단바 : 회원버튼 -->
	<ul class="navbar-nav ml-auto">
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
	</ul>

	</nav>
	<!-- 상단바 끝 -->
	
	<!-- 슬라이드 -->
	<div class="slide">
		<input type="radio" name="pos" id="pos1" checked>
		<input type="radio" name="pos" id="pos2">
		<input type="radio" name="pos" id="pos3">
		<input type="radio" name="pos" id="pos4">
		<ul>
			<li>테스트1</li>
			<li>테스트2</li>
			<li>테스트3</li>
			<li>테스트4</li>
		</ul>
		<p class="bullet">
			<label for="pos1">1</label>
			<label for="pos2">2</label>
			<label for="pos3">3</label>
			<label for="pos4">4</label>
		</p>
	</div>
	
	<!-- 메뉴 리스트 -->
	<h1 class="text-center">메뉴 리스트</h1>
	<div class="d-flex align-items-center justify-content-center">
		<div class="md">
			<div class="mdList">1</div>
			<div class="mdList">2</div>
			<div class="mdList">3</div>
			<div class="mdList">4</div>
			<div class="mdList">5</div>
			<div class="mdList">6</div>
			<div class="mdList">7</div>
			<div class="mdList">8</div>
			<div class="mdList">9</div>
		</div>
	</div>

	<!-- 메뉴 리스트 -->
	<h1 class="text-center">메뉴 리스트</h1>
	<div class="d-flex align-items-center justify-content-center">
		<div class="md">
			<div class="mdList">1</div>
			<div class="mdList">2</div>
			<div class="mdList">3</div>
			<div class="mdList">4</div>
			<div class="mdList">5</div>
			<div class="mdList">6</div>
			<div class="mdList">7</div>
			<div class="mdList">8</div>
			<div class="mdList">9</div>
		</div>
	</div>
	
	<!-- 메뉴 리스트 -->
	<h1 class="text-center">메뉴 리스트</h1>
	<div class="d-flex align-items-center justify-content-center">
		<div class="md">
			<div class="mdList">1</div>
			<div class="mdList">2</div>
			<div class="mdList">3</div>
			<div class="mdList">4</div>
			<div class="mdList">5</div>
			<div class="mdList">6</div>
			<div class="mdList">7</div>
			<div class="mdList">8</div>
			<div class="mdList">9</div>
		</div>
	</div>
		
	</div>
	<!-- 메인 컨텐츠 끝 -->
	
	<!-- 하단 시작 -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>하단 메뉴</span>
			</div>
		</div>
	</footer>
	<!-- 하단 끝 -->
	
	</div>
	<!-- 컨텐츠 Wrapper 끝 -->
	
	</div>
    <!-- 페이지 Wrapper 끝 -->
    
    <!-- 상단으로 이동 버튼 -->
    <a class="scroll-to-top rounded" href="#page-top">
    	<i class="fas fa-angle-up"></i>
    </a>
    
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
</body>
</html>