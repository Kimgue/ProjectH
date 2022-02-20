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
			<form id="insertForm" action="brandInsert" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td class="align-middle">브랜드 이름</td>
						<td class="align-middle"><input type="text" id="brandName" name="brandName"></td>
					</tr>
					<tr>
						<td class="align-middle">브랜드 설명</td>
						<td class="align-middle"><input type="text" id="brandDescription" name="brandDescription"></td>
					</tr>
					<tr>
						<td class="align-middle">브랜드 링크</td>
						<td class="align-middle"><input type="text" id="brandLink" name="brandLink"></td>
					</tr>
					<tr>
						<td class="align-middle">브랜드 이미지</td>
						<td class="align-middle">
						<img style="width: 150px;" class="img img-fluid img-thumbnail" id="preview-image" src="">
						<input type="hidden" id="brandImg" name="brandImg">
						<input type="file" class="form-control-file" id="input-image" name="uploadfile" required="required">
						</td>
					</tr>
					<tr>
						<td class="align-middle"><input type="button" class="btn btn-primary" value="작성" onclick="insert()"> </td>
					</tr>								
				</table>
			</form>
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