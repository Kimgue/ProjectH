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
	<script src="resources/js/notice/Noticeupdatelist.js"></script>
    
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
			<header>
				<h1> 공지사항 작성내용</h1>
			</header>
			<hr />	 
			<nav>
				홈 - 공지사항 수정
			</nav>
			<hr />
			<section id="container">
				<form role="form" method="post" action="Noticeupdate">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="adminCode" id="adminCode">작성자 번호 :${ person.adminCode }</label>
									<input type="hidden" id="adminCode" name="adminCode" value="${person.adminCode }">
									<input type="hidden" id="noticeCode" name="noticeCode" value="${ person.noticeCode }">
							</tr>	
							<tr>
								<td>
									<label for="noticeTitle">제목 : </label><input type="text" id="noticeTitle" name="noticeTitle"  value=${person.noticeTitle } >
								</td>
							</tr>	
							<tr>
								<td>
									<label for="noticeContent">내용 : </label><textarea id="noticeContent" name="noticeContent">${person.noticeContent }</textarea>
								</td>
							</tr>
							<tr>
								<td> 
									<label for="noticeDate" id="noticeDate">작성날짜 : ${ person.noticeDate }</label>
									<input type="hidden" id="noticeDate" name="noticeDate" value="${ date }">  
								</td>
								</tr>
							<tr>
								<td>						
									<button type="submit" id="submit">수정</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
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