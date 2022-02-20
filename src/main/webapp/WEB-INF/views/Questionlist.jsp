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
	<script src="resources/js/qna/Questionlist.js"></script>
    
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
			<HR>
			<form name="paging">
				<H4>Q.A</H4>
				<table style="text-align: center; border: 1px solid #ddddd">
				<thead>
					<tr>
						<th style="background-color:#fafafa; text-align:center;">번호</th>
						<th style="background-color:#fafafa; text-align:center;">제목</th>
						<th style="background-color:#fafafa; text-align:center;">작성자</th>
						<th style="background-color:#fafafa; text-align:center;">작성일</th>
					</tr>
					</thead>
					<c:forEach var="list" items="${ listpage }">
						<tr>
							<td id="code"><c:out value="${list.qesDto.qstnCode}" /></td>
							<td><a href="javascript:view('${list.qesDto.memberCode }','${list.qesDto.qstnCode }')"><c:out value="${list.qesDto.qstnTitle}" /></a></td>
							<td id="name"><c:out value="${list.memberDto.memberName }"></c:out>
							<td><c:out value="${list.qesDto.qstnDate}" /></td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<div id="pagingDiv">
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<a href="Questionlist?page=${idx}">${idx}</a>
				</c:forEach>
				</div>
				<hr>
				<input type="button" value="작성" onClick="insert()"> 
				<input type="button" value="메인페이지" onClick="location.href='main.jsp'">
				<input type="hidden" name="memberCode" /> 
				<input type="hidden"name="qstnCode" />
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