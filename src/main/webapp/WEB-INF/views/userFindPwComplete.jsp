<%@ page language="java" session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	var passwdCheck = RegExp(/^[A-Za-z0-9]{8,16}$/);
	
	$(document).ready(function(){
	
		$("#memberPwChk,#memberPw").blur(function(){
			var pw = $("#memberPw").val();
			var pwchk = $("#memberPwChk").val();
			
			if(pw == pwchk) {
				$("#text").text("");
			} else {
				$("#text").text("비밀번호가 다릅니다. 올바른 비밀번호를 입력해주세요").css("color", "red");
			}
		});
	});
	
	function FindPw() {
		var pw = $("#memberPw").val();
		var pwchk = $("#memberPwChk").val();
		
		if(pw == "" || pwchk == "") {
			alert("변경할 비밀번호를 입력해주세요");
			return;
		} else if(pw == pwchk){
			if(passwdCheck.test($('#memberPw').val())) {
				$("#FindPw").submit();
			} else {
				$("#text").text("형식에 맞지않는 비밀번호입니다").css("color", "red");
			}
	
		} else {
			alert("변경할 비밀번호가 다릅니다");
			return;
		}
	}
</script>
</head>
<body>
	<h2>비밀번호 변경</h2><br>
	비밀번호를 변경해주세요
	<form id="FindPw" action="userFindPwUpdate" method="post">
		<table>
			<tr>
				<td width=50>변경할 비밀번호 <input type="password" id="memberPw" name="memberPw"></td>
				<td width=50>변경할 비밀번호 확인 <input type="password" id="memberPwChk"></td>

			</tr>
		</table>
		<div id="text"></div>
		<input type="button" value="비밀번호 변경" onclick="FindPw()">
		<input type="button" value="아이디 찾기" onClick="location.href='userFindId'">
	</form>
</body>
</html>