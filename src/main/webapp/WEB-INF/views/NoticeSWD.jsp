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
	<script src="resources/js/notice/NoticeSWD.js"></script>
    
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
			<div class="container-fluid">
				<div class="row">
					<div class="card d-inline-block w-100 h-100 shadow mt-3 mb-3">
						<div class="card-body">
							<div class="h1 mb-3">
								공지사항 조회
							</div>
						<form name="paging">
							<table class="table">
								<tr>
									<td width=60>번호</td>
									<td width=350 height=40>제목</td>
									<td width=100>관리자</td>
									<td width=250>작성날짜</td>
									<td width=150>수정</td>
									<td width=100>삭제</td>
									
								</tr>
								<c:forEach var="list" items="${listpage}">
									<tr>
										<td><c:out value="${list.noticeCode}" /></td>
										<td><a href="javascript:view2('${ list.adminCode }','${list.noticeCode}')"><c:out value="${ list.noticeTitle }" /></a></td>
										<td><c:out value="${list.adminCode }"></c:out>
										<td><c:out value="${list.noticeDate}" /></td>	
										<td><a href="javascript:Noticeupdatelist('${ list.adminCode }','${list.noticeCode}' )">수정</a></td>
										<td><a href="javascript:Noticedelete('${ list.adminCode }','${list.noticeCode}')">삭제</a></td>
									</tr>
								</c:forEach>
							</table>	
							<br>
							<div class="text-center">
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<a class="mr-1" href="AdminNoticelist?page=${idx}">${idx}</a>
							    </c:forEach>
						    </div>
							<hr>
							<input type="hidden" name="adminCode" />
							<input type="hidden" name="noticeCode" />
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
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>	
</body>
</html>