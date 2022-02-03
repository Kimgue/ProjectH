<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	var key;

	function find_pw() {
		
		var name = $("#memberName").val();
		var email = $("#memberEmail").val();
		var emailInput = $("#memberEmailInput").val();
		if(name == "") {
			$("#memberName").focus();
			alert("이름을 입력해주세요");
			return;
		}
		if(email == "") {
			$("#memberEmail").focus();
			alert("이메일을 입력해주세요");
			return;
		}
		
		if(emailInput == "") {
			$("#memberEmailInput").focus();
			alert("인증번호를 입력해주세요");
			return;
		} else if(emailInput == key) {
			$("#find_pw").submit();
		} else {
			alert("잘못된 인증번호입니다");
			return;
		}
	}
	
	$(document).ready(function() {
		$("#memberEmailInput").attr("value","인증 번호를 입력해주세요");
		$("#memberEmailInput").prop("readonly",true);
		
		
		$("#sendEmail").click(function() {
			var mail = $("#memberEmail").val();
			if (mail == "") {
				alert("이메일 주소를 정확하게 입력해주세요");
			} else {
				$("#memberEmailInput").prop("readonly",false);
				var url = "FindIdSendMail.do";
				
				$.getJSON(url, {
					"mail" : mail
				}, function(json) {
					alert("인증번호가 전송되었습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요");
					$("#memberEmail").prop("readonly",true);
					$("#memberEmailInput").attr("value","");
					key = json.key;
					isCertification=true;
				});
			}
			
		})
	})
</script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	비밀번호를 찾기 위해서는 본인 확인이 필요합니다
	<form id="find_pw" action="FindPwSubmit" method="post">
		<table>
			<tr>
				<td width=50>이름 <input type="text" id="memberName" name="memberName"></td>
			</tr>
			
			<tr>
				<td width=50>이메일 
				<input type="text" id="memberEmail" name="memberEmail">
				<button type="button" id="sendEmail">인증번호 받기</button>
				<input type="text" id="memberEmailInput" name="memberEmailInput">
				
				</td>
			</tr>
		</table>
		<input type="button" value="확인" onclick="find_pw()">
		<input type="button" value="아이디 찾기" onClick="location.href='userFindId'">

		
	</form>
</body>
</html>