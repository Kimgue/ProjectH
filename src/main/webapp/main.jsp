<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/javascriptPagemain.js"></script>
<title>메인화면</title>
</head>
<body>
<div align="center">
<h1>환영합니다. ${userId}</h1>
<form name="paging">

<!-- 김혜성 수정함 -->
<a href="userView">회원조회</a><br>
<c:if test="${empty userId}">
	<a href="userLogin">로그인</a><br>    
</c:if>
<c:if test="${not empty userId}">
	<a href="userLogout">로그아웃</a><br>
</c:if>
<c:if test="${empty userId}">
	<a href="userRegist">회원가입</a><br> 
</c:if>


<input type="hidden" name="adminCode" />
<input type="hidden" name="noticeCode" />
	
<a href='javascript:Notice("1")'>공지사항</a>

<br>
	

<a href='javascript:QnA("00002")'>Q . A</a>
<input type="hidden" name="memberCode" />

<br>
</form>
<a href="menu">메뉴</a><br>
<a href="brand">브랜드</a><br>
</div>
</body>
</html>