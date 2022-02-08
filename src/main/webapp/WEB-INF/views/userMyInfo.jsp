<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
var validateNick = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
var validateEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
var validateNumber = RegExp(/^01[0179][0-9]{7,8}$/);
	
$(document).ready(function() {
	
	/* 닉네임, 이메일, 전화번호 변경하는 곳 안보이게 */
	$("#edNick,#edEmail,#edNumber").hide();

	/* --------------- 닉네임 수정 --------------- */
	
	/* 닉네임 수정 버튼 눌렀을 때 */
	$("#edNick_Btn").click(function() {
		$("#edNick_Btn").hide();
		$("#edNick").show();
	});
	
	/* 닉네임 수정 취소 버튼 눌렀을 때 */
	$("#edNick_BtnCancle").click(function() {
		$("#edNick").hide();
		$("#edNick_Btn").show();
	});
	
	/* 닉네임 수정 완료 버튼 눌렀을 때 */
	$("#edNick_BtnSubmit").click(function() {
		var Nick = $("#edNick_InputNickTxt").val();

		if (Nick == "") {
			alert("닉네임을 입력해주세요");
			return false;
		} else if(validateNick.test($('#edNick_InputNickTxt').val())) {
			var url = "chkNickname.do";

			$.getJSON(url, {
				"nickname" : nickname
			}, function(json) {
				var result_text = json.result;
				var result = eval(result_text);

				if (result) {
					$("#edNick_InputNickTxt").val("");
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
	$("#edEmail_Btn").click(function() {
		$("#edEmail_Btn").hide();
		$("#edEmail").show();
		$("#edEmail_InputNumberTxt").prop("readonly",true);
		$("#edEmail_InputNumberTxt").attr("value","인증 번호를 전송해주세요");
	});
	
	/* 이메일 수정 취소 버튼 눌렀을 때 */
	$("#edEmail_BtnCancle").click(function() {
		$("#edEmail").hide();
		$("#edEmail_Btn").show();
	});
	
	/* 이메일 수정 완료 버튼 눌렀을 때 */
	$("#edEmail_BtnSubmit").click(function() {
		var Email = $("#edEmail_InputEmailTxt").val();

		// 입력여부 검사
		if (Email == "") {
			alert("이메일을 입력해주세요");
			return false;
		} else if(validateEmail.test($('#edEmail_InputEmailTxt').val())) {
			
		} else {
			
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
				<div id="edNick">
					변경할 닉네임<br>
					<input type="text" id="edNick_InputNickTxt">
					<input type="button" id="edNick_BtnCancle" value="수정취소">
					<input type="button" id="edNick_BtnSubmit" value="수정완료">
				</div>
				<input type="button" id="edNick_Btn" value="수정">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${memberDTO.memberEmail}
				<div id="edEmail">
					변경할 이메일<br> 
					<input type="text" id="edEmail_InputEmailTxt">					
					<input type="button" id="edEmail_InputEmailBtn" value="인증번호 전송">
					
					<input type="text" id="edEmail_InputNumberTxt">
					<input type="button" id="edEmail_InputNumberBtn" value="인증번호 확인">

					<input type="button" id="edEmail_BtnCancle" value="수정취소">
					<input type="button" id="edEmail_BtnSubmit" value="수정완료">
					
				</div>
				<input type="button" id="edEmail_Btn" value="수정">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${memberDTO.memberNumber}
				<div id="edNumber">
					변경할 전화번호<br> 
					<input type="text" id="edNumber_InputNumberTxt"><br>
					<input type="button" id="edNumber_BtnCancle" value="수정취소">
					<input type="button" id="edNumber_BtnSubmit" value="수정완료">
				</div>
				<input type="button" id="edNumber_Btn" value="수정">
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