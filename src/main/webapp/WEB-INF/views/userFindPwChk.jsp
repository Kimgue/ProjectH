<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	var key;
	var validateEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

	function FindPw() {
		var val_Name = $("#memberName").val();
		var val_Email = $("#memberEmail").val();
		var val_EmailNumber = $("#Email_Number").val();
		if(val_Name == "") {
			$("#memberName").focus();
			alert("이름을 입력해주세요");
			return;
		}
		if(val_Email == "") {
			$("#memberEmail").focus();
			alert("이메일을 입력해주세요");
			return;
		}
		
		if(val_EmailNumber == "") {
			$("#Email_Number").focus();
			alert("인증번호를 입력해주세요");
			return;
		} else if(val_EmailNumber == key) {
			$("#FindPw").submit();
		} else {
			alert("잘못된 인증번호입니다");
			return;
		}
	}
	
	$(document).ready(function() {
		$("#Email_Number").attr("value","인증 번호를 입력해주세요");
		$("#Email_Number").prop("readonly",true);
		$("#Email_Transmit").click(function() {
			var val_Email = $("#memberEmail").val();
			if (val_Email == "") {
				alert("이메일 주소를 정확하게 입력해주세요");
			} else if (validateEmail.test($('#memberEmail').val())) {
				var url = "FindIdSendMail.do";
				
				$.getJSON(url, {
					"mail" : val_Email
				}, function(json) {
					alert("인증번호가 전송되었습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요");
					$("#memberEmail").prop("readonly",true);
					$("#Email_Number").prop("readonly",false);
					$("#Email_Number").attr("value","");
					key = json.key;
				});
			} else {
				alert("형식에 맞지 않는 이메일입니다");
			}
		})
	})
</script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	비밀번호를 찾기 위해서는 본인 확인이 필요합니다
	<form id="FindPw" action="userFindPwChk" method="post">
		<table>
			<tr>
				<td width=50>이름 <input type="text" id="memberName" name="memberName"></td>
			</tr>
			
			<tr>
				<td width=50>이메일 
				<input type="text" id="memberEmail" name="memberEmail">
				<input type="button" id="Email_Transmit" value="인증번호 전송">
				<input type="text" id="Email_Number">
				
				</td>
			</tr>
		</table>
		<input type="button" value="확인" onclick="FindPw()">
		<input type="button" value="아이디 찾기" onClick="location.href='userFindId'">

		
	</form>
</body>
</html>