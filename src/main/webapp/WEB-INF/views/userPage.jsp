<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(
			function() {
				/* --------------- 초기설정 --------------- */
				var hideDeleteBtn = true;
				$(".userDeleteGroup").hide();
				$(".editNickname").hide();

				/* --------------- 회원탈퇴 --------------- */
				$("#userDelete").click(
						function() {
							if (hideDeleteBtn == true) {
								hideDeleteBtn = false;
								$("#userDeleteText").text("비밀번호를 입력해주세요").css(
										"color", "black");
								$("#userDeleteInput").val("");
								$(".userDeleteGroup").show();
							} else {
								hideDeleteBtn = true;
								$(".userDeleteGroup").hide();
							}
						});

				/* --------------- 회원탈퇴 버튼 클릭 --------------- */
				$("#userDeleteBtn").click(
						function() {
							var checkPw = $("#userDeleteInput").val();
							if (checkPw == "") {
								$("#userDeleteText").text("잘못된 비밀번호입니다").css(
										"color", "red");
								$("#userDeleteInput").focus();
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
									/* DELETE 했을 떄 */
									$(".userDeleteGroup").hide();
									$("#userDelete").hide();

								} else {
									$("#userDeleteText").text("잘못된 비밀번호입니다")
											.css("color", "red");
									$("#userDeleteInput").val("");
								}
							});
						});

				
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
						return false;
					}
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
				});

				/* --------------- 이메일 수정 --------------- */
				$("#editEmailBtn").click(function() {
					alert("수정2");
				});

				/* --------------- 전화번호 수정 --------------- */
				$("#editTelBtn").click(function() {
					alert("수정3");
				});
			});
</script>

</head>
<body>
	<h2>마이페이지</h2>
	<table border="1" bordercolor="blue" width="500" height="300">
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
			<td>${memberDTO.memberNickname}</p>
				<div class="editNickname">
					변경할 닉네임<br> <input type="text" id="editNicknameInput"><br>
					<button type="button" id="editNicknameCancleBtn">수정취소</button>
					<button type="button" id="editNicknameSubmitBtn">수정완료</button>
					<br>
				</div>
				<button type="button" class="editGroup" id="editNicknameBtn">수정</button>
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

	<button type="button" id="userDelete">회원탈퇴</button>
	<br>
	<p class="userDeleteGroup" id="userDeleteText"></p>
	<input type="password" class="userDeleteGroup" id="userDeleteInput">
	<button type="button" class="userDeleteGroup" id="userDeleteBtn">확인</button>
	<br>
	<a href="userLogout">로그아웃</a>
	<br>
</body>
</html>