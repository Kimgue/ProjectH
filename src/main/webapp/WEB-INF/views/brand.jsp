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

    <title>헝픽 브랜드</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
   	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/brand/brand.js"></script>
    
</head>

<body id="page-top">
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	<!-- 사이드바 -->
	<jsp:include page="PageSide.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
	<!-- 상단 -->
	<jsp:include page="PageHeader.jsp" flush="false"/>
					
		<!-- 메인 -->
		<div id="content">
			<div class="w-25 float-left">
				<c:forEach var="brand" items="${brand}">
					<div style="width:380px;" class="card shadow h-100 py-2 m-3 text-center">
						<div class="card-body">
								<div class="h3 font-weight-bold m-3">
									<c:out value="${brand.brandName}" />
								</div>
								
								<div class="m-3">
									<c:out value="${brand.brandDescription}" />
								</div>

								<div class="img-thumbnail m-3">
									<a href="${brand.brandLink}">
									<img src="<c:out value="resources/${brand.brandImg}" />" alt="브랜드 이미지" height="150" width="150" />
									</a>
								</div>
								
								<div class="h4 font-weight-bold text-gray-800 m-3">
									<input type="hidden" id="val${brand.brandCode}" value="https://map.kakao.com/link/search/${brand.brandName}">
									<%-- <a href="https://map.kakao.com/link/search/${brand.brandName}" target="_blank">가까운 매장찾기</a> --%>
									<a class="store" id="brand${brand.brandCode}" href="#" onclick="return false;">
										근처 매장 검색
									</a>
								</div>

								<div class="h4 font-weight-bold text-gray-800 m-3">
									<input type="hidden" id="menuVal${brand.brandCode}" value="menuResultTest?brandCode=${brand.brandCode}&menuPrice=&menuName=">										
									<a class="menu" id="menu${brand.brandCode}" href="#" onclick="return false;">
										메뉴 보기
									</a>
								</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="brand-fix">
				<div class="w-100">
					<div id="store" class="h-auto m-3 ml-n1">
					<div class="card shadow h-100 py-2 m-3">
						<div class="card-body">
						<input type="button" id="storeClose" class="btn-primary border-0 rounded-top" value="닫기">
							<div class="col text-center">
							<fieldset>
								<iframe class="border-0 embed-responsive" id="nearStore" src="" height="340"></iframe>
							</fieldset>
							</div>
						</div>
					</div>
					</div>
				</div>
				
				<div class="w-100">
					<div id="menu" class="h-auto m-3 ml-n1">
					<div class="card shadow h-100 py-2 m-3">
						<div class="card-body">
						<input type="button" id="menuClose" class="btn-primary border-0 rounded-top" value="닫기">
							<div class="col text-center">
							<fieldset>
								<iframe class="border-0 embed-responsive" id="brandMenu" src="" height="340"></iframe>
							</fieldset>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 메인 컨텐츠 끝 -->
			
	<!-- 하단 -->
	<jsp:include page="PageFooter.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 끝 -->
	</div>
	<!-- 페이지 Wrapper 끝 -->
	</div>
	<!-- 페이지 상단 버튼 -->
	<jsp:include page="PageTopBtn.jsp" flush="false"/>
	
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
    
</body>
</html>