	var validateNickname 	= RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	var validateEmail		= RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var validateNumber 		= RegExp(/^01[0179][0-9]{7,8}$/);
	var validatePw 			= RegExp(/^[A-Za-z0-9]{8,16}$/);

	$(document).ready(function() {
				
		/* 닉네임, 이메일, 전화번호 변경하는 곳 안보이게 */
		$("#Nickname,#Email,#Number,#Pw").hide();
		var checkEmail = false;
		var checkNumber = false;
		var checkPw = false;

		/* --------------- 닉네임 수정 --------------- */

		/* 닉네임 수정 버튼 눌렀을 때 */
		$("#Nick_Btn").click(function() {
			$("#Nickname").addClass("animated--translateYIn");
			
			$("#Nick_Btn").hide();
			$("#Nickname").show();
		});

		/* 닉네임 수정 취소 버튼 눌렀을 때 */
		$("#Nick_Cancle").click(function() {
			$("#Nickname").removeClass("animated--translateYIn");
			$("#Nick_Btn").addClass("animated--grow-in");
			
			$("#Nickname").hide();
			$("#Nick_Txt").val("");
			$("#Nick_Btn").show();	
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
			$("#Email").addClass("animated--translateYIn");
			
			$("#Email").show();
			$("#Email_Txt").prop("readonly", false);
			$("#Email_Number").prop("readonly", true);
			$("#Email_Number").val("");
			$("#Email_Number").hide();
			$("#Email_Check").hide();
			$("#Email_Btn").hide();
			$("#resultEmail").text("");
			
		});

		/* 이메일 수정 취소 버튼 눌렀을 때 */
		$("#Email_Cancle").click(function() {
			$("#Email").removeClass("animated--translateYIn");
			$("#Email_Btn").addClass("animated--grow-in");
			
			$("#Email").hide();
			$("#Email_Btn").show();
			$("#Email_Txt").val("");
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
						
						var url = "sendEmail.do";
						$.getJSON(url,{"mail" : val_Email},function(json) {
							$("#Email_Check").show();
							$("#Email_Number").show();
							$("#resultEmail").text("인증번호가 전송되었습니다").css("color","blue");
							$("#Email_Txt").prop("readonly", true);
							$("#Email_Number").prop("readonly", false);
							$("#Email_Number").attr("value", "");
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
			$("#Number").addClass("animated--translateYIn");
			
			$("#Number").show();
			$("#Number_Btn").hide();		
			$("#Number_Check").hide();
			$("#Number_Number").prop("readonly", true);
			$("#Number_Number").val("");
			$("#Number_Number").hide();
			$("#resultNumber").text("");

		});

		/* 전화번호  수정 취소 버튼 눌렀을 때 */
		$("#Number_Cancle").click(function() {
			$("#Number").removeClass("animated--translateYIn");
			$("#Number_Btn").addClass("animated--grow-in");
			
			$("#Number").hide();
			$("#Number_Btn").show();
			$("#Number_Txt").val("");
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
						var code2 = ""; 
						var phone = $("#Number_Txt").val(); 
						$.ajax({ 
						type:"GET", 
						url:"phoneCheck?phone=" + phone, 
						cache : false, 
						success:function(data) {
							$("#resultNumber").text("인증번호가 전송되었습니다").css("color","blue");
							$("#Number_Check").show();
							$("#Number_Number").show();
							$("#Number_Txt").prop("readonly", true);
							$("#Number_Number").prop("readonly", false);
							$("#Number_Number").attr("value", "");
							code2 = data;
							emailData = data;
							
							$("#Number_Check").click(function() {
								var numberChk = $("Number_Number").val();
								if(numberChk == data) {
									$("#resultNumber").text("인증 완료되었습니다").css("color", "blue");
									$("#Number_Transmit").hide();
									$("#Number_Number").hide();
									$("#Number_Check").hide();
									checkNumber = true;
								} else {
									$("#resultNumber").text("잘못된 인증번호입니다").css("color", "red");
								}
							});
						}});
					} else {
						$("#resultNumber").text("이미 사용중인 전화번호입니다").css("color", "red");
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
			$("#Pw").addClass("animated--grow-in");
			
			$("#Pw").show();
			$("#Pw_Btn").hide();
			
			checkPw = false;
		});
		
		/* 비밀번호 변경 취소 눌렀을 때*/
		$("#Pw_Cancle").click(function() {
			$("#Pw").removeClass("animated--grow-in");
			
			$("#Pw").hide();
			$("#Pw_Btn").show();
			$("#Pw_Current").val("");
			$("#Pw_Change").val("");
			$("#Pw_Chk").val("");
			$("#resultPwCurrent").text("");
			$("#resultPwChange").text("");
			$("#resultPwChk").text("");
			
		});
			
		/* 비밀번호 변경 확인 */
		$("#Pw_Current, #Pw_Change, #Pw_Chk").blur(function() {
			var memberPw = $("#memberPw").val();
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
			} else {
				alert("비밀번호를 입력해주세요");
			}
		});
		
	});
	
	function userGifticon() {
		$("#userGifticon").submit();
	}