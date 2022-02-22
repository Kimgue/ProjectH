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
   	<link href="resources/css/fileBtnHidden.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/gifticon/gifticonInsert.js"></script>
    
</head>

<body>
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
			<div class="card shadow m-3">
				<div class="card-body">
					<div class="text-center">
						<form id="insertForm" action="gifticonInsertSubmit" method="post" enctype="multipart/form-data">
							<div class="gifticon-insert-grid align-items-center justify-content-center">
								<div class="gifticonName">
									<input type="text" class="form-control" id="gifticonName" name="gifticonName" placeholder="기프티콘 이름">
								</div>
								
								<div class="gifticonPrice">
								<input type="text" class="form-control" id="gifticonPrice" name="gifticonPrice" placeholder="기프티콘 가격">
								</div>
								
								<div class="gifticonBrand">
									<select class="custom-select" id="brandCode" name="brandCode" onchange="brandSelect()">
									<option value="" selected disabled>브랜드 선택</option>
									<option value="1">맥도날드</option>
									<option value="2">롯데리아</option>
									</select>
								</div>
								
								<div class="gifticonMenu">
									<select class="custom-select" id="menuCode" name="menuCode" onchange="menuSelect()">
									<option value="" selected disabled>-- 브랜드를 먼저 선택해주세요 --</option>
									</select>
								</div>
								
								<div class="gifticonImg">
									<img style="width: 294px;" class="img img-fluid img-thumbnail" id="preview-image" src="">
									<input type="hidden" id="gifticonImg" name="gifticonImg">
									<div class="h4 font-weight-bold text-primary m-3">
										<label for="input-image">
											<i class="fas fa-solid fa-file-image btn btn-warning"> 파일 첨부</i> 
										</label>
									</div>
								</div>
								
								<div class="gifticonBtn">
									<input type="button" class="btn btn-warning" value="등록" onclick="insert()">
									<input type="file" id="input-image" name="uploadfile" required="required">
								</div>
							</div>
						</form>
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
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>	
</body>
</html>