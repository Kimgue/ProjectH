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
	<%-- 
	<script src="resources/js/review/reviewLookup.js"></script>
    --%>
</head>

<body>
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
			<div align="center">
				<img id="reviewImg1" alt="리뷰 이미지" onerror="this.style.display='none'" height="270" width="270" />
				<img id="reviewImg2" alt="리뷰 이미지" onerror="this.style.display='none'" height="270" width="270" />
				<div class="caption">
				<button onclick="history.back()">상품 리뷰로</button>	
				<p style="font-size: 10pt">
					<c:out value="${Lookup.memberDto.memberNickname}" />
				</p>
				<p style="font-size: 10pt">
					<c:out value="${Lookup.reviewDto.reviewScore}" />
				</p>
				<p style="font-size: 10pt">
					<c:out value="${Lookup.reviewDto.reviewDate}" />
				</p>
				<p style="font-size: 10pt">
					<c:out value="${Lookup.reviewDto.reviewContent}" />
				</p>
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