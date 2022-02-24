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
	
	<!-- 사이드바 시작 -->
	<ul class="navbar-nav bg-gradient-warning sidebar sidebar-dark accordion" id="accordionSidebar">
		<div class="sticky-left">
			<!-- 사이드바 : 메인 페이지 -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="main">
				<img src="images/etc/hplogo.png" width="50">
			<div class="sidebar-brand-text mx-3">메인 페이지</div>
			</a>

			<c:choose>
				<c:when test="${loginBool eq true}">
					<c:choose>
						<c:when test="${not empty adminDTO}">
							<li class="nav-item">
								<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Admin" aria-expanded="true" aria-controls="collapseTwo">
									<i class="fas fa-user fa-sm fa-fw"></i> <span>관리자</span>
								</a>					
								<div id="Admin" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
									<div class="bg-white py-2 collapse-inner rounded">
										<a class="collapse-item" href="adminPage">관리자 페이지</a>									
										<a class="collapse-item" href="userMyInfo">나의 정보</a>
										<a class="collapse-item" href="userLogout">로그아웃</a>
									</div>
								</div>
							</li>						
						</c:when>
						
						<c:otherwise>
							<li class="nav-item">
								<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Mbr" aria-expanded="true" aria-controls="collapseTwo">
									<i class="fas fa-user fa-sm fa-fw"></i> <span>${memberDTO.memberName}</span>
								</a>					
								<div id="Mbr" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
									<div class="bg-white py-2 collapse-inner rounded">
										<a class="collapse-item" href="userMyInfo">나의 정보</a>
										<a class="collapse-item" href="userLogout">로그아웃</a>
									</div>
								</div>
							</li>						
						</c:otherwise>
					</c:choose>
				</c:when>
				
				<c:otherwise>
					<li class="nav-item">
						<a class="nav-link collapsed" href="userLogin">
							<i class="fas fa-solid fa-right-to-bracket"></i><span class="align-middle"> 로그인</span>
						</a>
						<a class="nav-link collapsed" href="userSignUp">
							<i class="fas fa-user fa-sm fa-fw"></i><span>회원가입</span>					
						</a>
					</li>
				</c:otherwise>
			</c:choose>
				
			<!-- 구분선 -->
			<hr class="sidebar-divider my-0">
			
			<!-- 사이드바 : 메뉴 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Menu" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-solid fa-burger"></i><span> 메뉴</span>
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
					<i class="fas fa-solid fa-copyright"></i><span> 브랜드</span>
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
					<i class="fas fa-solid fa-circle-exclamation"></i><span> 공지사항</span>
				</a>
				<div id="Notice" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="Notice">공지사항 조회</a>
					</div>
				</div>
			</li>
			
			<!-- 사이드바 : 질문과 답변 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#QnA" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-solid fa-circle-question"></i><span> 질문과 답변</span>
				</a>
				<div id="QnA" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">

						<a class="collapse-item" href="Questionlist">질문과 답변</a>

					</div>
				</div>
			</li>
			
			<!--사이드바 : 이달의 기프티콘 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Gifticon" aria-expanded="true" aria-controls="collapseTwo">
					<i class="fas fa-solid fa-gift"></i> <span>이달의 기프티콘</span>
				</a>
				<div id="Gifticon" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="gifticonList">기프티콘 조회</a>
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
	
</body>
</html>