<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	var validateNickname 	= RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	var validateEmail		= RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var validateNumber 		= RegExp(/^01[0179][0-9]{7,8}$/);
	var validatePw 			= RegExp(/^[A-Za-z0-9]{8,16}$/);

	$(document).ready(function() {
		
		/* 닉네임, 이메일, 전화번호 변경하는 곳 안보이게 */
		$("#Nickname,#Email,#Number,#Pw,#memberPw").hide();
		var checkEmail = false;
		var checkNumber = false;
		var checkPw = false;

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

				$.getJSON(url, {"nickname" : val_Nickname}, function(json) {
					var result_text = json.result;
					var result = eval(result_text);

					if (result) {
						var url = "updateNickname.do";
						$.getJSON(url, {"nickname" : val_Nickname}, function(json) {
							$("#Nick_Txt").val("");
							location.reload();
						});
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
				var url = "chkEmail.do";
				
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
					alert("이메일이 변경되었습니다");
					location.reload();
				});
			} else {
				$("#resultEmail").text("인증이 완료되지 않았습니다").css("color","red");
			}
		});

		/* --------------- 전화번호 수정 --------------- */
		/* 전화번호 수정 버튼 눌렀을 때 */
		$("#Number_Btn").click(function() {
			$("#Number").show();
			$("#Number_Btn").hide();		
			$("#Number_Number").attr("value", "인증 번호를 전송해주세요");
			$("#Number_Number").prop("readonly", true);

		});

		/* 전화번호  수정 취소 버튼 눌렀을 때 */
		$("#Number_Cancle").click(function() {
			$("#Number").hide();
			$("#Number_Btn").show();
			location.reload();
		});
		
		/* 전화번호 인증번호 전송 버튼 눌렀을 때 */
		$("#Number_Transmit").click(function() {
			var val_Number = $("#Number_Txt").val();

			// 입력여부 검사
			if (val_Number == "") {
				$("#resultNumber").text("전화번호를 입력해주세요").css("color","red");
				return false;
			} else if (validateNumber.test($('#Number_Txt').val())) {
				var url = "chkNumber.do";
				$.getJSON(url, {"number" : val_Number}, function(json) {
					var result_text = json.result;
					var result = eval(result_text);
					if (result) {
						checkNumber = true;
						$("#resultNumber").text("사용 가능한 전화번호입니다").css("color", "blue");
						alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오");
						var code2 = ""; 
						var phone = $("#Number_Txt").val(); 
						$.ajax({ 
						type:"GET", 
						url:"phoneCheck?phone=" + phone, 
						cache : false, 
						success:function(data) { 
							$("#Number_Txt").prop("readonly", true);
							$("#Number_Number").prop("readonly", false);
							$("#Number_Number").attr("value", "");
							code2 = data;
							emailData = data;
						}});
					} else {
						$("#resultNumber").text("사용할 수 없는 전화번호입니다").css("color", "red");
						checkNumber = false;
					}
				});	
			} else {
				$("#resultNumber").text("사용할 수 없는 전화번호입니다").css("color","red");
			}
		});
		
		/* 전화번호 수정완료 버튼 눌렀을 때 */
		$("#Number_Submit").click(function() {
			if(checkNumber == true) {
				var val_Number = $("#Number_Txt").val();
				
				var url = "updateNumber.do";
				
				$.getJSON(url,{"number":val_Number}, function(json) {
					$("#Number_Txt").val("");
					alert("전화번호가 변경되었습니다");
					location.reload();
				});
			} else {
				$("#resultNumber").text("인증이 완료되지 않았습니다").css("color","red");
			}
		});
		
		/* --------------- 비밀번호 수정 --------------- */
		/* 비밀번호 변경 눌렀을 때*/
		$("#Pw_Btn").click(function() {
			$("#Pw").show();
			$("#Pw_Btn").hide();
			checkPw = false;
		});
		
		/* 비밀번호 변경 취소 눌렀을 때*/
		$("#Pw_Cancle").click(function() {
			$("#Pw").hide();
			$("#Pw_Btn").show();
			location.reload();
		});
			
		/* 비밀번호 변경 확인 */
		$("#Pw_Current, #Pw_Change, #Pw_Chk").blur(function() {
			var memberPw = $("#memberPw").text();
			var val_Current = $("#Pw_Current").val();
			var val_Change = $("#Pw_Change").val();
			var val_Chk = $("#Pw_Chk").val();
			
			if(val_Current == "") {
				$("#resultPwCurrent").text("현재 비밀번호를 입력해주세요").css("color","red");
				checkPw = false;
				return false;
			} else if(val_Current != memberPw) {
				$("#resultPwCurrent").text("현재 비밀번호가 다릅니다").css("color","red");
				checkPw = false;
				return false;
			} else {
				$("#resultPwCurrent").text("비밀번호가 확인되었습니다").css("color","blue");
			}
			
			if(val_Change == "") {
				$("#resultPwChange").text("변경할 비밀번호를 입력해주세요").css("color","red");
				checkPw = false;
				return false;
			} else if(val_Change == memberPw) {
				$("#resultPwChange").text("변경하려는 비밀번호가 현재 비밀번호와 같습니다").css("color","red");
				checkPw = false;
				return false;
			} else if (validatePw.test($('#Pw_Change').val())) {
				$("#resultPwChange").text("");
			} else {
				$("#resultPwChange").text("변경할 비밀번호가 형식에 맞지 않습니다").css("color","red");
				checkPw = false;
				return false;
			}
			
			if(val_Chk == "") {
				$("#resultPwChk").text("변경할 비밀번호를 한번 더 입력해주세요").css("color","red");
				checkPw = false;
				return false;
			} else if(val_Chk != val_Change){
				$("#resultPwChk").text("비밀번호가 일치하지 않습니다").css("color","red");
				checkPw = false;
				return false;
			} else {
				$("#resultPwChk").text("");
				checkPw = true;
			}
		});
		
		/* 비밀번호 변경 완료 눌렀을 때*/
		$("#Pw_Submit").click(function() {
			if(checkPw == true) {
				var val_Change = $("#Pw_Change").val();
				var url = "updatePw.do";
				$.getJSON(url,{"pw":val_Change}, function(json) {
					alert("비밀번호가 변경되었습니다");
					location.reload();	
				});	
			}
		});
		
	});
</script>
</head>
<body>
<h2>마이페이지</h2>
<c:choose>
	<c:when test="${not empty adminDTO}">
		<table border="1">
		<tr>
			<td>아이디
			<td>${adminDTO.adminId}</td>
		</tr>
		<tr>
			<td>비밀번호
			<td>${adminDTO.adminPw}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${adminDTO.adminName}</td>
		</tr>
		</table>
	</c:when>
			
	<c:otherwise>
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
					<input type="text" 		id="Number_Txt" name="memberNumber">
					<input type="button" 	id="Number_Transmit" value="인증번호 전송">
					<br>
					<input type="text" 		id="Number_Number">
					<input type="button" 	id="Number_Check" value="인증번호 확인">
					<br>
					<input type="button" 	id="Number_Cancle" value="수정취소">
					<input type="button" 	id="Number_Submit" value="수정완료">
					<div id="resultNumber"></div>
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
		<input type="button" id="Pw_Btn" value="비밀번호 변경">
		<div id="Pw">
			<p id="memberPw">${memberDTO.memberPw}</p>
			<p>현재 비밀번호</p>
			<input type="password" id="Pw_Current">
			<div id="resultPwCurrent"></div>
			<p>변경 비밀번호</p>
			<input type="password" id="Pw_Change">
			<div id="resultPwChange"></div>
			<p>변경 비밀번호 확인</p>
			<input type="password" id="Pw_Chk">
			<div id="resultPwChk"></div>
			<br>
			<input type="button" id="Pw_Submit" value="변경 완료">
			<input type="button" id="Pw_Cancle" value="변경 취소">
		</div>
		<br>
		<input type="button" value="회원탈퇴" onClick="location.href='userDelete'">
	</c:otherwise>
</c:choose>

<input type="button" value="로그아웃" onClick="location.href='userLogout'">
</body>
</html>