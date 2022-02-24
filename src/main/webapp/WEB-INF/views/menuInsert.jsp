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

    <title>헝픽 메뉴 등록</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
   	<link href="resources/css/fileBtnHidden.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/menu/menuInsert.js"></script>
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
								메뉴 등록
							</div>
							<form id="insertForm" action="insertMenu" method="post" enctype="multipart/form-data">
								<div class="insertGrid">
									<div class="one">
										<input type="text" class="form-control mb-3" id="menuName" name="menuName" placeholder="메뉴 이름">
										<input type="text" class="form-control mb-3" id="menuPrice" name="menuPrice" placeholder="메뉴 가격">
										<input type="text" class="form-control mb-3" id="menuIngredients" name="menuIngredients" placeholder="메뉴 재료">
										<select class="custom-select mb-3 gifticonInputWidth" id="brandCode" name="brandCode" onchange="brandSelect()">
											<option value="" selected disabled>브랜드 선택</option>
											<c:forEach var="brand" items="${brand}">
											<option value="${brand.brandCode}">${brand.brandName}</option>
											</c:forEach>
										</select>
									</div>
									<div class="two">
										<textarea onkeydown="resize(this)" onkeyup="resize(this)" style="width:665px; min-height:180px;" class="form-control" id="menuDescription" name="menuDescription" placeholder="메뉴 설명"></textarea>
									</div>
									<input type="file" id="input-image" name="uploadfile" required="required">
									<div class="three">
										<img style="width: 350px; height:200px;" class="img img-fluid img-thumbnail mb-3" id="preview-image" src="">
										<input type="hidden" id="menuImg" name="menuImg">
									</div>
									<div class="four">
										<div class="float-left">
											<label for="input-image">
												<i style="width:150px; height:38px;" class="fas fa-solid fa-file-image btn btn-warning"> 파일 첨부</i>
											</label>
										</div>
									</div>
									<div class="five">
										<div class="float-right">
											<input style="width:150px;" type="button" class="btn btn-warning" value="등록" onclick="insert()">
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