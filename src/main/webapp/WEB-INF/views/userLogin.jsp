<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transactional//EN" "http://www.w3.org/TR/html4/losee.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<title>회원가입</title>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h2>로그인</h2>
	<form action="userLoginConfirm" method="post">
		<table border="1">
			<tr>
				<td width=50>ID</td>
				<td width=50>비밀번호</td>
			</tr>
			<tr>
				<td><input type="text" id="memberId" name="memberId"></td>
				<td><input type="password" id="memberPw" name="memberPw"></td>
			</tr>
		</table>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onClick="location.href='userRegist'">
	</form>
</body>
</html>