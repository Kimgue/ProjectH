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

    <title>헝픽 상세 리뷰</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
   	<link href="resources/css/fileBtnHidden.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/textareaHeight.js"></script>
	<script>
	var reviewImg = '<c:out value= "${Lookup.reviewDto.reviewImg}"/>';
	var imgFile = reviewImg.split(',');
	var filePath = "images/review/"
	var reviewImg1 = filePath + imgFile[0];
	var reviewImg2 = filePath + imgFile[1];
	
	function ImgAttr(){
		$("#reviewImg1").attr("src", reviewImg1);
		$("#reviewImg2").attr("src", reviewImg2);
	}

	$(document).ready(function()
			{
				ImgAttr();
			});
	</script>
   	
</head>

<body id="page-top">
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	<!-- 사이드바 -->
	<c:choose>
		<c:when test="${not empty adminDTO}">
			<jsp:include page="AdminPageSide.jsp" flush="false"/>
		</c:when>
		
		<c:otherwise>
			<jsp:include page="PageSide.jsp" flush="false"/>
		</c:otherwise>
	</c:choose>
	
	<!-- 컨텐츠 Wrapper 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
	<!-- 상단 -->
	<jsp:include page="PageHeader.jsp" flush="false"/>
					
		<!-- 메인 -->
		<div id="content">
			<div class="container-fluid">
				<div class="row">
					<div style="width:700px;" class="card d-inline-block h-100 shadow mt-3 mb-3 text-center">
						<div class="card-body">
							<div class="d-flex align-items-center justify-content-between mb-3">
								<div class="h3">
									상세 리뷰
								</div>
								<div>
									<input type="button" class="btn btn-warning" value="이전" onclick="history.back()">
								</div>
							</div>
							<div class="d-flex align-items-center justify-content-between mb-3">
								<div>작성자<br><c:out value="${Lookup.memberDto.memberNickname}" /></div>
								<div>리뷰일자<br><c:out value="${Lookup.reviewDto.reviewDate}" /></div>
							</div>
							<hr>
							<div>
								<img class="img img-thumbnail" id="reviewImg1" alt="리뷰 이미지" onerror="this.style.display='none'" height="270" width="270" />
								<img class="img img-thumbnail" id="reviewImg2" alt="리뷰 이미지" onerror="this.style.display='none'" height="270" width="270" />			
							</div>
							
							<div class="h3"><c:out value="${Lookup.reviewDto.reviewScore}" /></div>
							
							<div><c:out value="${Lookup.reviewDto.reviewContent}" /></div>
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