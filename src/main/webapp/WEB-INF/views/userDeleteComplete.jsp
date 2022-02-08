<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴완료</title>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<form id="deleteUser" action="userDeleteSubmit" method="post">
		<h2>회원탈퇴완료</h2><br>
		회원탈퇴가 완료되었습니다
		
		<input type="button" value="로그인" onClick="location.href='userLogin'">
		<input type="button" value="회원가입" onClick="location.href='userRegist'">
	</form>
</body>
</html>