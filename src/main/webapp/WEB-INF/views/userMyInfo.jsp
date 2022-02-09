<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	var validateNickname = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	var validateEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var validateNumber = RegExp(/^01[0179][0-9]{7,8}$/);

	$(document).ready(function() {
		
		/* 닉네임, 이메일, 전화번호 변경하는 곳 안보이게 */
		$("#Nickname,#Email,#Number").hide();
		var checkEmail = false;

		/* --------------- 닉네임 수정 --------------- */

		/* 닉네임 수정 버튼 눌렀을 때 */
		$("#Nick_Btn").click(function() {
			$("#Nick_Btn").hide();
			$("#Nickname").show();
		});

		/* 닉네임 수정 취소 버튼 눌렀을 때 */
		$("#Nick_Cancle").click(function() {
			$("#Nickname").hide();
			$("#Nick_Btn").show();
			location.reload();
		});

		/* 닉네임 수정 완료 버튼 눌렀을 때 */
		$("#Nick_Submit").click(function() {
			var val_Nickname = $("#Nick_Txt").val();

			if (val_Nickname == "") {
				alert("닉네임을 입력해주세요");
				return false;
			} else if (validateNickname.test($('#Nick_Txt').val())) {
				var url = "chkNickname.do";

				$.getJSON(url, {
					"nickname" : val_Nickname
				}, function(json) {
					var result_text = json.result;
					var result = eval(result_text);

					if (result) {
						$("#Nick_Txt").val("");
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

		/* 이메일 수정 버튼 눌렀을 때 */
		$("#Email_Btn").click(function() {
			$("#Email").show();
			$("#Email_Btn").hide();		
			$("#Email_Number").attr("value", "인증 번호를 전송해주세요");
			$("#Email_Number").prop("readonly", true);

		});

		/* 이메일 수정 취소 버튼 눌렀을 때 */
		$("#Email_Cancle").click(function() {
			$("#Email").hide();
			$("#Email_Btn").show();
			location.reload();
		});

		/* 이메일 인증번호 전송 버튼 눌렀을 때 */
		$("#Email_Transmit").click(function() {
			var val_Email = $("#Email_Txt").val();

			// 입력여부 검사
			if (val_Email == "") {
				$("#resultEmail").text("이메일을 입력해주세요").css("color","red");
				return false;
			} else if (validateEmail.test($('#Email_Txt').val())) {
				var url = "CheckMail.do";
				
				$.getJSON(url,{"mail" : val_Email},function(json) {
					if (json.result == true) {
						$("#resultEmail").text("인증번호가 전송되었습니다").css("color","blue");
						$("#Email_Txt").prop("readonly", true);
						$("#Email_Number").prop("readonly", false);
						$("#Email_Number").attr("value", "");
						alert(json.key);
						$("#Email_Check").click(function() {
							var Email_Number = $("#Email_Number").val();
							if (Email_Number == "") {
								$("#resultEmail").text("인증 번호를 입력해주세요").css("color","red");
							} else if (Email_Number == json.key) {
								$("#resultEmail").text("인증 완료되었습니다").css("color","blue");
								$("#Email_Number,#Email_Check,#Email_Transmit").hide();
								checkEmail = true;
							} else {
								$("#resultEmail").text("잘못된 인증번호입니다").css("color","red");
								checkEmail = false;
								return false;
							}
						});
						} else {
							$("#resultEmail").text("이미 존재하는 이메일입니다").css("color","red");
							checkEmail = false;
							return false;
						}
				});
			} else {
				$("#resultEmail").text("형식에 맞지 않는 이메일입니다").css("color","red");
			}
		});
		
		/* 이메일 수정완료 버튼 눌렀을 때 */
		$("#Email_Submit").click(function() {
			if(checkEmail == true) {
				var val_Email = $("#Email_Txt").val();
				
				var url = "updateEmail.do";
				
				$.getJSON(url,{"email":val_Email}, function(json) {
					$("#Email_Txt").val("");
					$("#resultEmail").text("이메일 변경이 완료되었습니다").css("color","blue");
					location.reload();
				});
			} else {
				$("#resultEmail").text("인증이 완료되지 않았습니다").css("color","red");
			}
		});

		/* --------------- 전화번호 수정 --------------- */
		$("#").click(function() {
			$("#").hide();
			$("#").show();
		});
		$("#").click(function() {
			$("#").hide();
			$("#").show();
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
				<div id="Nickname">
					변경할 닉네임<br> 
					<input type="text" 		id="Nick_Txt">
					<input type="button" 	id="Nick_Cancle" value="수정취소"> 
					<input type="button" 	id="Nick_Submit" value="수정완료">
				</div> 
					<input type="button" 	id="Nick_Btn" value="수정">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${memberDTO.memberEmail}
				<div id="Email">
					변경할 이메일<br>
					<input type="text" 		id="Email_Txt" name="memberEmail">
					<input type="button" 	id="Email_Transmit" value="인증번호 전송">
					<br>
					<input type="text" 		id="Email_Number">
					<input type="button" 	id="Email_Check" value="인증번호 확인">
					<br>
					<input type="button" 	id="Email_Cancle" value="수정취소">
					<input type="button" 	id="Email_Submit" value="수정완료">
					<div id="resultEmail"></div>
				</div> 
					<input type="button" 	id="Email_Btn" value="수정">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${memberDTO.memberNumber}
				<div id="Number">
					변경할 전화번호<br> 
					<input type="text"		id="Number_Txt">
					<input type="button"	id="Number_Cancle" value="수정취소">
					<input type="button"	id="Number_Submit" value="수정완료">
				</div> 
					<input type="button" 	id="Number_Btn" value="수정">
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

	<input type="button" value="회원탈퇴" onClick="location.href='userDelete'">
	<a href="userLogout">로그아웃</a>
	<br>
</body>
</html>