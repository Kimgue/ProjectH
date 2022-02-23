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
			<H4>공지사항</H4>ㅎㅇㅎㅇ
			<form>
				<table border="1">
					<tr>
						<td width=40>번호</td>
						<td width=200 height=40>제목</td>
						<td width=200>관리자</td>
						<td width=150>작성날짜</td>	
					</tr>
					<c:forEach var="list" items="${ listpage }">
						<tr>
							<td><c:out value="${ list.noticeCode}" /></td>
							<td><a href="view2?adminCode=${ list.adminCode }&noticeCode=${list.noticeCode}"><c:out value="${list.noticeTitle}" /></a></td>
							<td><c:out value="${list.adminCode }"></c:out>
							<td><c:out value="${list.noticeDate}" /></td>
						</tr>
					</c:forEach>
				</table>	
				<input type="hidden" name="adminCode" /> 
				<input type="hidden"name="noticeCode" />
			</form>
			<br>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<a href="Notice?page=${idx}">${idx}</a>
			</c:forEach>
			<hr>
			
			<div class="board"></div>
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