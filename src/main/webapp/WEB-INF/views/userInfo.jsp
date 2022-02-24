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
			<table border="1">
				<tr>
					<td width=50>회원 코드</td>
					<td width=50>아이디</td>
					<td width=50>비밀번호</td>
					<td width=50>이름</td>
					<td width=50>닉네임</td>
					<td width=50>이메일</td>
					<td width=50>전화번호</td>
					<td width=50>가입일자</td>
					<td width=50>보유 포인트</td>
				</tr>
				<c:forEach var="list" items="${LIST}">
					<tr>
						<td><c:out value="${list.memberCode}" /></td>
						<td><c:out value="${list.memberId}" /></td>
						<td><c:out value="${list.memberPw}" /></td>
						<td><c:out value="${list.memberName}" /></td>
						<td><c:out value="${list.memberNickname}" /></td>
						<td><c:out value="${list.memberEmail}" /></td>
						<td><c:out value="${list.memberNumber}" /></td>
						<td><c:out value="${list.memberDate}" /></td>
						<td><c:out value="${list.holdPoint}" /></td>
					</tr>
				</c:forEach>
			</table>
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