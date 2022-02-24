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
	<script src="resources/js/gifticon/gifticonUpdatePage.js"></script>
    
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
			<form id="updateGifticon" action="gifticonUpdateSubmit" method="post">
				<input type="hidden" value="${gifticonList.gifticonCode}" name="gifticonCode">
				<input type="hidden" value="${gifticonList.brandCode}" name="brandCode">
				<input type="hidden" value="${gifticonList.menuCode}" name="menuCode">
				<input type="hidden" id="gifticonImg" value="${gifticonList.gifticonImg}" name="gifticonImg">
				현재 이미지<br>
				<img src="<c:url value='${gifticonList.gifticonImg}' />" alt="${gifticonList.gifticonImg}" height="270" width="270"/><br>
				수정할 이미지<br>
				<img style="width: 100px;" id="preview-image" src="">
				<input type="file" id="input-image" name="uploadfile" required="required">
				<input type="text" value="${gifticonList.gifticonName}" name="gifticonName">
				<input type="text" value="${gifticonList.gifticonPrice}" name="gifticonPrice">
			</form>
			<input type="button" value="수정" onclick="update()">
			<input type="button" value="취소" onClick="location.href='gifticonUpdate'">			
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