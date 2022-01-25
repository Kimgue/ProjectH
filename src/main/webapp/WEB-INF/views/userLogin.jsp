<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<h1>${loginNotice}</h1>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onClick="location.href='userRegist'">
	</form>
</body>
</html>