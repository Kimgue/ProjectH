<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div align="center">

<form name="paging">


<!-- 로그인 상태 체크 -->
<!-- c:choose 구문 사이에 주석을 넣으면 에러뜸(이유는 모르겠네) --> 
<c:choose> 
	<c:when test="${loginBool eq true}"> 
		<c:choose>
			<c:when test="${not empty adminDTO}">
				<h1>관리자 계정입니다. ${adminDTO.adminName}</h1>
				<a href="adminPage">관리 페이지</a><br>
			</c:when>
			
			<c:otherwise>
				<h1>환영합니다. ${memberDTO.memberName}</h1>
			</c:otherwise>
		</c:choose>
		<a href="userMyInfo">마이페이지</a>
		<br>
		<a href="userLogout">로그아웃</a>
		<br>
	
	</c:when>
	
	<c:otherwise>
		<a href="userLogin">로그인</a>
		<br>
		<a href="userSignUp">회원가입</a>
		<br>
	</c:otherwise>
</c:choose>

<a href='Notice'>공지사항</a> <br>	

<a href="Questionlist">Q . A</a> 
<input type="hidden" id="memberCode" />
<br>
<a href="gifticonList">기프티콘</a>
<br>
</form>
		<a href="menu">메뉴</a><br> <a href="brand">브랜드</a><br>
	</div>
</body>
</html>