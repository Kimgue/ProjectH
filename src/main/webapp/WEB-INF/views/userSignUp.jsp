<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	var checkId 	= false;
	var checkPw 	= false;
	var checkName 	= false;
	var checkNick 	= false;
	var checkEmail 	= false;
	var checkNumber = false;

	var validateId 		= RegExp(/^[A-Za-z0-9]{5,20}$/);
	var validatePw 		= RegExp(/^[A-Za-z0-9]{8,16}$/);
	var validateName 	= RegExp(/^[A-Za-z가-힣]{2,17}$/);
	var validateNick 	= RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	var validateEmail 	= RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var validateNumber 	= RegExp(/^01[0179][0-9]{7,8}$/);

	function UserSignUp() {
		var val_Id 			= $("#memberId").val();
		var val_Pw 			= $("#memberPw").val();
		var val_Name 		= $("#memberName").val();
		var val_Nickname	= $("#memberNickname").val();
		var val_Email 		= $("#memberEmail").val();
		var val_Number 		= $("#memberNumber").val();

		if (val_Id == "") {
			$("#memberId").focus();
			$("#resultId").text("아이디를 입력해주세요").css("color", "red");
			return;
		}
		if (val_Pw == "") {
			$("#memberPw").focus();
			$("#resultPw").text("비밀번호를 입력해주세요").css("color", "red");
			return;
		}
		if (val_Name == "") {
			$("#memberName").focus();
			$("#resultName").text("이름을 입력해주세요").css("color", "red");
			return;
		}
		if (val_Nickname == "") {
			$("#memberNickname").focus();
			$("#resultNickname").text("닉네임을 입력해주세요").css("color", "red");
			return;
		}
		if (val_Email == "") {
			$("#memberEmail").focus();
			$("#resultEmail").text("이메일을 입력해주세요").css("color", "red");
			return;
		} else if (checkEmail == false) {
			$("#memberEmail").focus();
			$("#resultEmail").text("이메일 인증을 진행해주세요").css("color", "red");
			return;
		}
		if (val_Number == "") {
			$("#memberNumber").focus();
			$("#resultNumber").text("전화번호를 입력해주세요").css("color", "red");
			return;
		}

		if (
		checkId == true &&
		checkPw == true &&
		checkName == true &&
		checkNick == true && 
		checkEmail == true && 
		checkNumber == true
		) {
			$("#UserSignUp").submit();
		} else {
			return;
		}
	}

$(document).ready(function() {
	$("#EmailChk").hide();
	/* --------------- 이메일 검사 --------------- */
	$("#Email_Transmit").click(function() {
		var val_Email = $("memberEmail").val();
		if (val_Email == "") {
			$("#resultEmail").text("이메일을 입력해주세요").css("color", "red");
			checkEmail = false;
			return false;
		} else if (validateEmail.test($('#memberEmail').val())) {
			var url = "CheckMail.do";
			
			$.getJSON(url,{"mail" : val_Email},function(json) {
				if (json.result == true) {
					$("#resultEmail").text("인증번호가 전송되었습니다").css("color","blue");
					$("#EmailChk").show();
					
					$("#Email_Check").click(function() {
						var Email_Number = $("#Email_Number").val();
						if (Email_Number == "") {
							$("#resultEmailChk").text("인증 번호를 입력해주세요").css("color","red");
						} else if (Email_Number == json.key) {
							$("#resultEmailChk").text("인증 완료되었습니다").css("color","blue");
							$("#resultEmail").hide();
							$("EmailChk").hide();
							$("Email_Transmit").hide();
							checkEmail = true;
						} else {
							$("#resultEmailChk").text("잘못된 인증번호입니다").css("color","red");
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
			$("#resultEmail").text("형식에 맞지 않는 이메일입니다").css("color", "red");
			checkEmail = false;
			return false;
		}
	});

	/* --------------- ID 검사 --------------- */
	$("#memberId").blur(function() {
		var val_Id = $("#memberId").val();
		
		if (val_Id == "") {
			$("#resultId").text("아이디를 입력해주세요").css("color", "red");
			checkId = false;
			return false;
		}

		if (validateId.test($('#memberId').val())) {
			var url = "idChkCtrl.do";
			$.getJSON(url,{"id" : val_Id},function(json) {
				var result_text = json.result;
				var result = eval(result_text);

				if (result) {
					$("#resultId").text("사용 가능한 아이디입니다").css("color","blue");
					checkId = true;
					} else {
						$("#resultId").text("이미 존재하는 아이디입니다").css("color","red");
						checkId = false;
						return false;
					}
			});
		} else {
			$("#resultId").text("사용할 수 없는 아이디입니다").css("color", "red");		
			checkId = false;
			return false;
		}
	});

	/* --------------- 비밀번호 검사 --------------- */
	$("#memberPw").blur(function() {
		var val_Pw = $("#memberPw").val();
		if (val_Pw == "") {
			$("#resultPw").text("비밀번호를 입력해주세요").css("color", "red");
			checkPw = false;
			return false;
		}
		if (validatePw.test($('#memberPw').val())) {
			$("#resultPw").text("사용 가능한 비밀번호입니다").css("color", "blue");
			checkPw = true;
		} else {
			$("#resultPw").text("사용할 수 없는 비밀번호입니다").css("color", "red");
			
			checkPw = false;
		}
	});

	/* --------------- 이름 검사 --------------- */
	$("#memberName").blur(function() {
		var val_Name = $("#memberName").val();
		if (val_Name == "") {
			$("#resultName").text("이름을 입력해주세요").css("color", "red");
			return false;
		}
		if (validateName.test($('#memberName').val())) {
			$("#resultName").text("");
			checkName = true;
		} else {
			$("#resultName").text("올바른 이름을 입력해주세요").css("color", "red");
			checkName = false;
			return false;
		}
	});

	/* --------------- 닉네임 검사 --------------- */
	$("#memberNickname").blur(function() {
		var val_Namename = $("#memberNickname").val();
		if (val_Namename == "") {
			checkNick = false;
			return false;
		}
		if (validateNick.test($('#memberNickname').val())) {
			var url = "chkNickname.do";

			$.getJSON(url, {"nickname" : val_Namename}, function(json) {
				var result_text = json.result;
				var result = eval(result_text);
				if (result) {
					$("#resultNickname").text("사용 가능한 닉네임입니다").css("color", "blue");
					checkNick = true;
				} else {
					$("#resultNickname").text("이미 존재하는 닉네임입니다").css("color", "red");
					checkNick = false;
					return false;
				}
			});
		} else {
			$("#resultNickname").text("사용할 수 없는 닉네임입니다").css("color","red");
			checkNick = false;
			return false;
		}
	});

	/* --------------- 전화번호 검사 --------------- */
	$("#memberNumber").blur(function() {
		var val_Number = $("#memberNumber").val();
		if (val_Number == "") {
			checkNumber = false;
			return false;
		} else if (validateNumber.test($('#memberNumber').val())) {
			var url = "chkNumber.do";
			$.getJSON(url, {"number" : val_Number}, function(json) {
				var result_text = json.result;
				var result = eval(result_text);
				if (result) {
					$("#resultNumber").text("사용 가능한 전화번호입니다").css("color", "blue");
					checkNumber = true;
				} else {
					$("#resultNumber").text("이미 존재하는 전화번호입니다").css("color", "red");
					checkNumber = false;
					return false;
				}
			});	
		} else {
			$("#resultNumber").text("사용할 수 없는 전화번호입니다").css("color", "red");
			checkNumber = false;
			return false;
		}
	});
});
</script>

</head>
<body>
	<h2>회원가입 정보 입력</h2>
	<form id="UserSignUp" action="userSignUpSubmit" method="post">
		<table border="1">
			<tr>
				<td width=100>ID</td>
				<td>
				<input type="text" name="memberId" id="memberId">
				<div id="resultId"></div>
				</td>
			</tr>
			<tr>
				<td width=100>비밀번호</td>
				<td>
				<input type="password" name="memberPw" id="memberPw">
				<div id="resultPw"></div>
				</td>
			</tr>
			<tr>
				<td width=100>이름</td>
				<td>
				<input type="text" name="memberName" id="memberName">
				<div id="resultName"></div>
				</td>
			</tr>
			<tr>
				<td width=100>닉네임</td>
				<td>
				<input type="text" name="memberNickname" id="memberNickname">
				<div id="resultNick"></div>
				</td>
			</tr>
			<tr>
				<td width=100>이메일</td>
				<td>
				<input type="text" name="memberEmail" id="memberEmail">
				<input type="button" id="Email_Transmit" value="인증번호 전송">
				<div id="resultEmail"></div>
				
				<div id="EmailChk">
				인증 번호를 입력해주세요 
				<input type="text" id="Email_Number">
				<input type="button" id="Email_Check" value="인증번호 확인">
				<div id="resultEmailChk"></div>
				</div></td>
			</tr>
			<tr>
				<td width=100>전화번호</td>
				<td>
				<input type="text" name="memberNumber" id="memberNumber">
				<div id="resultNumber"></div>
				</td>
			</tr>
		</table>
		<input type="button" value="회원가입" onclick="UserSignUp()"> 
		<input type="button" value="회원조회" onClick="location.href='userInfo'">
	</form>
</body>
</html>