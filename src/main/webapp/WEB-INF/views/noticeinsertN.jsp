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
	<script src="resources/js/notice/noticeinsertN.js"></script>
    
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
			<div id="root">
				<header>
					<h1> 공지사항</h1>
				</header>
				<hr />	 
				<nav>
				  홈 - 공지사항 작성
				</nav>
				<hr />
				
				<section id="container">
					<form id="noticeInsert" role="form" method="post" action="Noticeinsert" encType="multipart/form-data">
						<table>
							<tbody>
							<thead>
							<tr>
							<th style="background-color: #eeeee; text-align: center;">공지사항 글쓰기 </th>
								</tr>
							</thead>		
								<tr>
									<td>
										<label for="adminCode" id="adminCode">작성자 번호 :${ adminCode }</label>
										<input type="hidden" id="adminCode" name="adminCode" value="${ adminCode }">
										<input type="hidden" id="noticeCode" name="noticeCode" value="noticeCode">
								</tr>	
								<tr>
									<td>
										<label for="noticeTitle">제목 : </label><input type="text" id="noticeTitle" name="noticeTitle" />
									</td>
								</tr>	
								<tr>
									<td>
										<label for="noticeContent">내용 : </label><textarea id="noticeContent" name="noticeContent" ></textarea>
									</td>
								</tr>
								<tr>
									<td> 
										<label for="noticeDate" id="noticeDate">작성날짜 : ${ date }</label>
										<input type="hidden" id="noticeDate" name="noticeDate" value="${ date }">  
									</td>
									</tr>
									<tr>
									<td>
										<input type="hidden" id="noticeImg" name="noticeImg">
										<input type="file" id="input-image" name="uploadfile">
										<img style="width: 100px;" id="preview-image" src="">
										<div class="img"></div>
									</td>
									</tr>
								<tr>
									<td>						
										<!-- <button type="submit" id="submit">작성</button> -->
											<input type="button" value="작성" onclick="insert()">								
									</td>
								</tr>			
							</tbody>			
						</table>
					</form>
				</section>
				<hr />
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