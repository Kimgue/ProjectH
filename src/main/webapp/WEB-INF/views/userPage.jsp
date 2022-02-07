<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
	
	$(document).ready(
			function() {
				/* --------------- 초기설정 --------------- */
				$(".editNickname").hide();
				$(".editEmail").hide();
				$(".editNumber").hide();

				/* --------------- 닉네임 수정 --------------- */
				$("#editNicknameBtn").click(function() {
					$("#editNicknameBtn").hide();
					$(".editNickname").show();
				});
				$("#editNicknameCancleBtn").click(function() {
					$(".editNickname").hide();
					$("#editNicknameBtn").show();
				});
				
				$("#editNicknameSubmitBtn").click(function() {
					var nickname = $("#editNicknameInput").val();

					// 입력여부 검사
					if (nickname == "") {
						alert("닉네임을 입력해주세요");
						return false;
					} else if(nickNameCheck.test($('#editNicknameInput').val())) {
						var url = "chkNickname.do";

						// get 방식 ajax 연동
						$.getJSON(url, {
							"nickname" : nickname
						}, function(json) {
							var result_text = json.result;
							var result = eval(result_text);

							if (result) {
								$("#editNicknameInput").val("");
								location.reload();
							} else {
								alert("이미 존재하는 닉네임입니다");
							}
						});
					} else {
						alert("형식에 맞지 않는 닉네임입니다");
					}

				});

				/* --------------- 이메일 수정 --------------- */
				$("#editEmailBtn").click(function() {
					$("#editEmailBtn").hide();
					$(".editEmail").show();
				});
				$("#editEmailCancleBtn").click(function() {
					$(".editEmail").hide();
					$("#editEmailBtn").show();
				});
				
				$("#editEmailSubmitBtn").click(function() {
					var email = $("#editNicknameInput").val();

					// 입력여부 검사
					if (email == "") {
						alert("이메일을 입력해주세요");
						return false;
					} else if(nickNameCheck.test($('#editNicknameInput').val())) {
						var url = "chkNickname.do";

						// get 방식 ajax 연동
						$.getJSON(url, {
							"nickname" : nickname
						}, function(json) {
							var result_text = json.result;
							var result = eval(result_text);

							if (result) {
								$("#editNicknameInput").val("");
								location.reload();
							} else {
								alert("이미 존재하는 닉네임입니다");
							}
						});
					} else {
						alert("형식에 맞지 않는 닉네임입니다");
					}

				});

				/* --------------- 전화번호 수정 --------------- */
				$("#editNumberBtn").click(function() {
					$("#editNumberBtn").hide();
					$(".editNumber").show();
				});
				$("#editNumberCancleBtn").click(function() {
					$(".editNumber").hide();
					$("#editNumberBtn").show();
				});
			});
</script>

</head>
<body>
	<h2>마이페이지</h2>
	<table border="1">
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
			<td>${memberDTO.memberNickname}
				<div class="editNickname">
					변경할 닉네임<br> <input type="text" id="editNicknameInput"><br>
					<button id="editNicknameCancleBtn">수정취소</button>
					<button id="editNicknameSubmitBtn">수정완료</button>
					<br>
				</div>
				<button type="button" class="editGroup" id="editNicknameBtn">수정</button>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${memberDTO.memberEmail}
				<div class="editEmail">
					변경할 이메일<br> <input type="text" id="editEmailInput">
					<button class="sendMail">인증번호 전송</button>
					<br>
					<input type="text" id="editEmailNumberInput">
					<button class="mailNumberBtn">인증번호 확인</button>		
					<br>
					<button id="editEmailCancleBtn">수정취소</button>
					<button id="editEmailSubmitBtn">수정완료</button>
					<br>
				</div>
				<button type="button" class="editGroup" id="editEmailBtn">수정</button>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${memberDTO.memberNumber}
				<div class="editNumber">
					변경할 전화번호<br> <input type="text" id="editNumberInput"><br>
					<button id="editNumberCancleBtn">수정취소</button>
					<button id="editNumberSubmitBtn">수정완료</button>
					<br>
				</div>
				<button type="button" class="editGroup" id="editNumberBtn">수정</button>
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

	<input type="button" value="회원탈퇴"  onClick="location.href='userDelete'">
	<a href="userLogout">로그아웃</a>
	<br>
</body>
</html>