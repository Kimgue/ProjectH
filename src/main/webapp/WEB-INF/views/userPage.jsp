<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		var hideEditBtn = true;
		var bool = true;
		$(".userEditGroup").hide();
		$(".editGroup").hide();
		$(".editInputGroup").hide();

		$("#userEdit").click(function() {
			if (hideEditBtn == true) {
				hideEditBtn = false;
				$("#userEditText").text("비밀번호를 입력해주세요").css("color", "black");
				$("#userEditInput").val("");
				$(".userEditGroup").show();
			} else {
				hideEditBtn = true;
				$(".userEditGroup").hide();
			}
		});

		$("#userEditBtn").click(function() {
			var checkPw = $("#userEditInput").val();
			if (checkPw == "") {
				$("#userEditText").text("잘못된 비밀번호입니다").css("color", "red");
				$("#userEditInput").focus();
				return false;
			}
			var url = "pwChkCtrl.do"

			// get 방식 ajax 연동
			$.getJSON(url, {
				"inputPw" : checkPw
			}, function(json) {
				var result_text = json.result;
				var result = eval(result_text);

				if (result == true) {
					$(".userEditGroup").hide();
					$("#userEdit").hide();
					$(".editGroup").show();
				} else {
					$("#userEditText").text("잘못된 비밀번호입니다").css("color", "red");
					$("#userEditInput").val("");
				}
			});
		});
	});
</script>

</head>
<body>
	<h2>마이페이지</h2>
	<table border="1" bordercolor="blue" width ="500" height="300">
		<tr>
			<td>ID
			<td>${memberDTO.memberId}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${memberDTO.memberName}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
			${memberDTO.memberNickname}<button type="button" class="editGroup" id="editNicknameBtn">수정</button>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${memberDTO.memberEmail}
				<button type="button" class="editGroup" id="editEmailBtn">수정</button>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${memberDTO.memberNumber}
				<button type="button" class="editGroup" id="editTelBtn">수정</button>
			</td>
		</tr>
		<tr>
			<td>가입날짜</td>
			<td>${memberDTO.memberDate}</td>
		</tr>
		<tr>
			<td>보유포인트</td>
			<td>${memberDTO.holdPoint}</td>
		</tr>
	</table>

	<button type="button" id="userEdit">정보편집</button>
	<br>
	<p class="userEditGroup" id="userEditText"></p>
	<input type="password" class="userEditGroup" id="userEditInput">
	<button type="button" class="userEditGroup" id="userEditBtn">확인</button>
	<br>
	<a href="userLogout">로그아웃</a>
	<br>
</body>
</html>