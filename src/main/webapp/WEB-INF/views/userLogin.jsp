<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	function login() {
		var idChk = $("#Id").val();
		var pwChk = $("#Pw").val();
		
		if(idChk == "HungPick1" && pwChk == "12341234") {
			$("#login").attr("action", "adminLoginTry");
			$("#login").submit();
		} else {
			$("#login").attr("action", "userLoginTry");
			$("#login").submit();			
		}
		
	}
</script>
</head>
<body>
	<h2>로그인</h2>
	<form id="login" method="post">
		<table border="1">
			<tr>
				<td width=50>ID</td>
				<td width=50>비밀번호</td>
			</tr>
			<tr>
				<td><input type="text" id="Id" name="memberId"></td>
				<td><input type="password" id="Pw" name="memberPw"></td>
			</tr>
		</table>
		<p>${loginNotice}<p>
		<input type="button" value="로그인" onclick="login()">
		<input type="button" value="회원가입" onClick="location.href='userSignUp'"><br><br>
		<input type="button" value="아이디 찾기" onClick="location.href='userFindId'">
		<input type="button" value="비밀번호 찾기" onClick="location.href='userFindPw'">
	</form>
</body>
</html>