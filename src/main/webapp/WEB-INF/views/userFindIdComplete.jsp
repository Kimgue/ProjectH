<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h2>${userFindId}</h2>
	
	<input type="button" value="로그인" onClick="location.href='userLogin'">
	<input type="button" value="비밀번호 찾기" onClick="location.href='userFindPw'">
</body>
</html>