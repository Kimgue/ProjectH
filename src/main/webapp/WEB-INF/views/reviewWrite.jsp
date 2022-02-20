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
	<script src="resources/js/review/reviewWrite.js"></script>
    
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
				<button onclick="history.back()">돌아가기</button>	
				<form action="reviewWriteSubmit" name="dataForm"  id="dataForm">
					<br> 
					<input type='hidden' name='brandCode' value='${brandCode}' readonly/>
					<br> 
					<input type='hidden' name='menuCode' value='${menuCode}' readonly/>
					<br> 
					메뉴명:
					<input type='text' name='menuName' value='${menuName}' readonly/>
					<br> 
					리뷰점수: 
					<input type='number' name='reviewScore' min='1' max='5' step='0.1' required/>
					<br> 
					리뷰내용:
					<input type='text' name='reviewContent' style="width:300px;height:200px;" required/>
					<br> 
		  			<h3>리뷰 이미지</h3>
		  			<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
		  			<input type="hidden" id="reviewImg" name="reviewImg">
		  			<input id="input_file" multiple="multiple" type="file" accept="image/*" style="display:none; ">
		  			<span style="font-size:10px; color: gray;">※첨부파일은 최대 2개까지 등록이 가능합니다.</span>
		  			<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
					<span>첨부 파일</span>
					<br />
					<div id="articlefileChange">
					</div>
					</div>
		  			<button type="submit" onclick="return registerAction()" >전송</button>
				</form>
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