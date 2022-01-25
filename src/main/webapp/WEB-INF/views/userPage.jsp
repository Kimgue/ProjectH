<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h2>마이페이지</h2>
	<form action="userLoginConfirm" method="post">
		<table border="1">
			<tr>
				<td>코드 : ${memberDTO.memberCode}</td>
			</tr>
			<tr>
				<td>ID : ${memberDTO.memberId}</td>
			</tr>
			<tr>
				<td>비밀번호 : ${memberDTO.memberPw}</td>
			</tr>
			<tr>
				<td>이름 : ${memberDTO.memberName}</td>
			</tr>
			<tr>
				<td>닉네임 : ${memberDTO.memberNickname}</td>
			</tr>
			<tr>
				<td>이메일 : ${memberDTO.memberEmail}</td>
			</tr>
			<tr>
				<td>전화번호 : ${memberDTO.memberNumber}</td>
			</tr>
			<tr>
				<td>가입날짜 : ${memberDTO.memberDate}</td>
			</tr>
			<tr>
				<td>보유포인트 : ${memberDTO.holdPoint}</td>
			</tr>
		</table>
		<a href="userLogout">로그아웃</a><br>
	</form>
</body>
</html>