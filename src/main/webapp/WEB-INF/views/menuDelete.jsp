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

    <title>헝픽 메뉴 삭제</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
   	<link href="resources/css/fileBtnHidden.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/menu/menuDelete.js"></script>
	<script src="resources/js/textareaHeight.js"></script>
    
</head>

<body id="page-top">
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	<!-- 사이드바 -->
	<jsp:include page="AdminPageSide.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
	<!-- 상단 -->
	<jsp:include page="PageHeader.jsp" flush="false"/>
					
		<!-- 메인 -->
		<div id="content">
			<div class="container-fluid">
				<div class="row">
					<div class="card d-inline-block h-100 shadow mt-3 mb-3 overflow-hidden">
						<div class="card-body">
							<div class="h1 mb-3">
								메뉴 삭제
							</div>
							<form id="deleteForm" action="deleteMenu" method="post">
								<div class="insertGrid">
									<div class="one">
										<select class="custom-select mb-3 gifticonInputWidth" id="brandCode" name="brandCode" onchange="brandSelect(this.value);">
											<option value="" selected disabled>브랜드 선택</option>
											<c:forEach var="brand" items="${brand}">
											<option value="${brand.brandCode}">${brand.brandName}</option>
											</c:forEach>
										</select>
										
										<select class="custom-select mb-3 gifticonInputWidth" id="menuCode" name="menuCode">
											<option value="">메뉴 선택</option>
										</select>
									</div>
									<div class="five">
										<div class="float-right">
											<input class="btn btn-warning" id="deleteBtn" type="button" value="삭제">
										</div>
									</div>
								</div>
							</form>
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