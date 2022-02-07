<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	var checkId = false;
	var checkPw = false;
	var checkNickname = false;
	var checkEmail = false;
	var checkNumber = false;
	
	var userIdCheck = RegExp(/^[A-Za-z0-9]{5,20}$/);
	var passwdCheck = RegExp(/^[A-Za-z0-9]{8,16}$/);
	var nameCheck = RegExp(/^[A-Za-z가-힣]{2,17}$/);
	var nickNameCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var phonNumberCheck = RegExp(/^01[0179][0-9]{7,8}$/);
	
	

	function go_join(){
		var id = $("#memberId").val();
		var pw = $("#memberPw").val();
		var name = $("#memberName").val();
		var nickname = $("#memberNickname").val();
		var mail = $(".mail").val();
		var number = $("#memberNumber").val();		
		
		
		if(id == "") {
			$("#memberId").focus();
			$("#resultId").text("아이디를 입력해주세요").css("color", "red");
			return;
		}
		if(pw == "") {
			$("#memberPw").focus();
			$("#resultPw").text("비밀번호를 입력해주세요").css("color", "red");
			return;
		}
		if(name == "") {
			$("#memberName").focus();
			$("#resultName").text("이름을 입력해주세요").css("color", "red");
			return;
		}
		if(nickname == "") {
			$("#memberNickname").focus();
			$("#resultNickname").text("닉네임을 입력해주세요").css("color", "red");
			return;
		}
		if(mail == "") {
			$("#memberEmail").focus();
			$("#resultEmail").text("이메일을 입력해주세요").css("color", "red");
			return;
		}
		if(number == "") {
			$("#memberNumber").focus();
			$("#resultNumber").text("전화번호를 입력해주세요").css("color", "red");
			return;
		}
		
		if(checkId == true && checkNickname == true && checkEmail == true && checkNumber == true) {
			$("#go_join").submit();
		} else {
			return;
		}
	}


	

	$(document).ready(function() {
		$(".mailNum").hide();
		/* --------------- 이메일 검사 --------------- */
		$(".sendMail").click(function() {
			var mail = $(".mail").val();
			if (mail == "") {
				$("#resultEmail").text("이메일을 입력해주세요").css("color", "red");
			} else if(emailCheck.test($('#memberEmail').val())) {
				checkEmail = true;
				var url = "CheckMail.do";
				$.getJSON(url, {
					"mail" : mail
				}, function(json) {
					if(json.result == true) {
						$("#resultEmail").text("인증번호가 전송되었습니다").css("color", "blue");
						$(".mailNum").show();
						/* $(".mail").prop("readonly",true); */
						isCertification=true;
						
						$(".mailOk").click(function() {
							var mailCertifyiInput = $(".mailCertifyiInput").val();
							if(mailCertifyiInput == "") {
								$("#resultEmailOk").text("인증 번호를 입력해주세요").css("color", "red");
							} else if(mailCertifyiInput == json.key) {
								$("#resultEmailOk").text("인증 완료되었습니다").css("color", "blue");
								$("#resultEmail").hide();
								$(".mailNum").hide();
								$(".sendMail").hide();
								checkEmail = true;
							} else {
								$("#resultEmailOk").text("잘못된 인증번호입니다").css("color", "red");
							}
						});
					} else {
						$("#resultEmail").text("이미 존재하는 이메일입니다").css("color", "red");
						checkEmail = false;
					}
				});
			} else {
				$("#resultEmail").text("형식에 맞지 않는 이메일입니다").css("color", "red");
				return false;
			}
		});

		/* --------------- ID 검사 --------------- */
		$("#memberId").blur(function() {

			// 입력값 얻어오기
			var id = $("#memberId").val();

			// 입력여부 검사
			if (id == "") {
				$("#resultId").text("아이디를 입력해주세요").css("color", "red");
				return false;
			} 
			
			if(userIdCheck.test($('#memberId').val())) {
				
				var url = "idChkCtrl.do";

				$.getJSON(url, {
					"id" : id
				}, function(json) {
					var result_text = json.result;
					var result = eval(result_text);
					
					if (result) {
						$("#resultId").text("사용 가능한 아이디입니다").css("color", "blue");
						checkId = true;
					} else {
						$("#resultId").text("이미 존재하는 아이디입니다").css("color", "red");
						checkId = false;
					}
				});
				
			} else {
				$("#resultId").text("사용할 수 없는 아이디입니다").css("color", "red");
				checkId = false;
			}
		});
		
		/* --------------- 비밀번호 검사 --------------- */
		$("#memberPw").blur(function() {

			// 입력값 얻어오기
			var pw = $("#memberPw").val();

			// 입력여부 검사
			if (pw == "") {
				$("#resultPw").text("비밀번호를 입력해주세요").css("color", "red");
				return false;
			} 
			
			if(passwdCheck.test($('#memberPw').val())) {
				$("#resultPw").text("사용 가능한 비밀번호입니다").css("color", "blue");
				checkPw = true;
			} else {
				$("#resultPw").text("사용할 수 없는 비밀번호입니다").css("color", "red");
				checkPw = false;
			}
		});
		
		/* --------------- 이름 검사 --------------- */
		$("#memberName").blur(function() {

			// 입력값 얻어오기
			var name = $("#memberName").val();

			// 입력여부 검사
			if (name == "") {
				$("#resultName").text("이름을 입력해주세요").css("color", "red");
				return false;
			} 
			
			if(nameCheck.test($('#memberName').val())) {
				$("#resultName").text("");
				checkName = true;
			} else {
				$("#resultName").text("올바른 이름을 입력해주세요").css("color", "red");
				checkName = false;
			}
		});
		
		/* --------------- 닉네임 검사 --------------- */
		$("#memberNickname").blur(function() {
			var nickname = $("#memberNickname").val();

			// 입력여부 검사
			if (nickname == "") {
				return false;
			}
			
			if(nickNameCheck.test($('#memberNickname').val())) {
				
				var url = "chkNickname.do";

				// get 방식 ajax 연동
				$.getJSON(url, {
					"nickname" : nickname
				}, function(json) {
					var result_text = json.result;
					var result = eval(result_text);

					if (result) {
						$("#resultNickname").text("사용 가능한 닉네임입니다").css("color", "blue");
						checkNickname = true;
					} else {
						$("#resultNickname").text("이미 존재하는 닉네임입니다").css("color", "red");
						checkNickname = false;
					}
				});
				
			} else {
				$("#resultNickname").text("사용할 수 없는 닉네임입니다").css("color", "red");
				checkNickname = false;
			}
		});
		
		/* --------------- 전화번호 검사 --------------- */
		$("#memberNumber").blur(function() {
			var number = $( "#memberNumber").val();

			// 입력여부 검사
			if (number == "") {
				return false;
			} else if(phonNumberCheck.test($('#memberNumber').val())) {
				
				var url = "chkNumber.do";

				// get 방식 ajax 연동
				$.getJSON(url, {
					"number" : number
				}, function(json) {
					var result_text = json.result;
					var result = eval(result_text);

					if (result) {
						$("#resultNumber").text("사용 가능한 전화번호입니다").css("color", "blue");
						checkNumber = true;
					} else {
						$("#resultNumber").text("이미 존재하는 전화번호입니다").css("color", "red");
						checkNumber = false;
					}
				});
				
			} else {
				$("#resultNumber").text("사용할 수 없는 전화번호입니다").css("color", "red");
				checkNumber = false;
			}
		});
	});
</script>

</head>
<body>
	<h2>회원가입 정보 입력</h2>
	<form id="go_join" action="userRegistSubmit" method="post">
		<table border="1">
			<tr>
				<td width=100>ID</td>
				<td><input type="text" name="memberId" id="memberId">
					<div id="resultId"></div></td>
			</tr>
			<tr>
				<td width=100>비밀번호</td>
				<td><input type="password" name="memberPw" id="memberPw">
					<div id="resultPw"></div></td>
			</tr>
			<tr>
				<td width=100>이름</td>
				<td><input type="text" name="memberName" id="memberName">
					<div id="resultName"></div></td>
			</tr>
			<tr>
				<td width=100>닉네임</td>
				<td><input type="text" name="memberNickname"
					id="memberNickname">
					<div id="resultNickname"></div></td>
			</tr>
			<tr>
				<td width=100>이메일</td>
				<td><input type="text" name="memberEmail" class="mail"
					id="memberEmail">
					<button type="button" class="sendMail">인증</button>
					<div id="resultEmail"></div>
					<div class="mailNum">
						인증 번호를 입력해주세요 <input type="text" class="mailCertifyiInput">
						<button type="button" class="mailOk">확인</button>
						<div id="resultEmailOk"></div>
					</div></td>

			</tr>
			<tr>
				<td width=100>전화번호</td>
				<td><input type="text" name="memberNumber" id="memberNumber">
					<div id="resultNumber"></div></td>
			</tr>

		</table>

		<input type="button" value="회원가입" onclick="go_join()"> <input
			type="button" value="회원조회" onClick="location.href='userView'">
	</form>
</body>
</html>