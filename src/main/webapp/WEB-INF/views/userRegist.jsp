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
	var checkNickname = false;
	var checkEmail = false;
	var checkNumber = false;

	function go_join(){
		var id = $("#memberId").val();
		var pw = $("#memberPw").val();
		var name = $("#memberName").val();
		var nickname = $("#memberNickname").val();
		var mail = $(".mail").val(); 
		var domain = $(".domain").val(); 
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
		if(domain == "") {
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
			$("#memberEmail").val(mail+"@"+domain); 
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
			var domain = $(".domain").val();
			
			if (mail == "" || domain == "") {
				$("#resultEmail").text("이메일을 입력해주세요").css("color", "red");
			} else {
				mail = mail+"@"+$(".domain").val();
				
				var url = "CheckMail.do";
				
				$.getJSON(url, {
					"mail" : mail
				}, function(json) {
					if(json.result == true) {
						$("#resultEmail").text("인증번호가 전송되었습니다").css("color", "blue");
						$(".mailNum").show();
						$(".domain").prop("readonly",true);
						$(".mail").prop("readonly",true);
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
			}
		});

		/* --------------- ID 검사 --------------- */
		$("#memberId").blur(function() {

			// 입력값 얻어오기
			var id = $("#memberId").val();

			// 입력여부 검사
			if (id == "") {
				return false;
			}
			var url = "idChkCtrl.do";

			// get 방식 ajax 연동
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
		});
		
		/* --------------- 닉네임 검사 --------------- */
		$("#memberNickname").blur(function() {
			var nickname = $("#memberNickname").val();

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
					$("#resultNickname").text("사용 가능한 닉네임입니다").css("color", "blue");
					checkNickname = true;
				} else {
					$("#resultNickname").text("이미 존재하는 닉네임입니다").css("color", "red");
					checkNickname = false;
				}
			});
		});
		
		/* --------------- 전화번호 검사 --------------- */
		$("#memberNumber").blur(function() {
			var number = $("#memberNumber").val();

			// 입력여부 검사
			if (number == "") {
				return false;
			}
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
					<div id="resultId"></div>
				</td>
			</tr>
			<tr>
				<td width=100>비밀번호</td>
				<td>
				<input type="text" name="memberPw" id="memberPw">
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
				<div id="resultNickname"></div>
				</td>
			</tr>
			<tr>
				<td width=100>이메일</td>
				<td><input type="text" name="memberEmail" class="mail" id="memberEmail">
					@<input type="text" class="domain">
					<button type="button" class="sendMail">인증</button>
					<div id="resultEmail"></div>
					<div class="mailNum">
						인증 번호를 입력해주세요 <input type="text" class="mailCertifyiInput">
						<button type="button" class="mailOk">확인</button>
						<div id="resultEmailOk"></div>
					</div>
				</td>

			</tr>
			<tr>
				<td width=100>전화번호</td>
				<td>
					<input type="text" name="memberNumber" id="memberNumber">
					<div id="resultNumber"></div>
				</td>
			</tr>

		</table>

		<input type="button" value="회원가입" onclick="go_join()">
		<input type="button" value="회원조회" onClick="location.href='userView'">	
	</form>
</body>
</html>