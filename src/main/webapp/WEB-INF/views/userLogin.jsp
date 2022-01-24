<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transactional//EN" "http://www.w3.org/TR/html4/losee.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<title>회원가입</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#userLogin").click(function() {
			
			// 입력값 얻어오기
			var id = $("#memberId").val();
			var pw = $("#memberPw").val();
			
			// 입력여부 검사
			if(id=="" || pw=="") {
				$("#fail_result").text("아이디 혹은 비밀번호를 입력해주세요").css("color","red");
				$("#memberId").focus();
				return false;
			}
			var url = "userLoginConfirm.do";
				
			// get 방식 ajax 연동
			$.getJSON(url, {
				"id" : id, "pw" : pw
			}, function(json) {
				var result_text = json.result;
				var result = eval(result_text);
				
				if(result) {
					$("#fail_result").text("사용 가능").css("color","blue");
				} else {
					$("#fail_result").text("사용 불가능").css("color","red");
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>로그인</h2>
	<form id="userLoginConfirm">
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
		<input type="button" id="userLogin" value="로그인">
		<input type="button" value="회원가입" onClick="location.href='userRegist'">
		<div id="fail_result"></div>
	</form>
</body>
</html>