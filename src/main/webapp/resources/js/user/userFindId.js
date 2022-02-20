		var key;
		var validateEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
		function FindId() {
			var val_Name = $("#memberName").val();
			var val_Email = $("#memberEmail").val();
			var val_EmailNumber = $("#Email_Number").val();
			if(val_Name == "") {
				$("#memberName").focus();
				$("#resultEmail").text("");
				$("#resultName").text("이름을 입력해주세요").css("color", "red");
				return;
			}
			if(val_Email == "") {
				$("#memberEmail").focus();
				$("#resultName").text("");
				$("#resultEmail").text("이메일을 입력해주세요").css("color", "red");
				return;
			}
			
			if(val_EmailNumber == "") {
				$("#Email_Number").focus();
				$("#resultEmailChk").text("인증번호를 입력해주세요").css("color", "red");
				return;
			} else if(val_EmailNumber == key) {
				$("#FindId").submit();
			} else {
				$("#resultEmailChk").text("잘못된 인증번호입니다").css("color", "red");
				return;
			}
		}
		
		$(document).ready(function() {
			$("#Email_Number").prop("readonly",true);
			$("#Email_Transmit").click(function() {
				var val_Email = $("#memberEmail").val();
				if (val_Email == "") {
					$("#resultEmail").text("이메일을 입력해주세요").css("color", "red");
				} else if (validateEmail.test($('#memberEmail').val())) {
					var url = "sendEmail.do";
					
					$.getJSON(url, {
						"mail" : val_Email
					}, function(json) {
						$("#resultEmail").text("인증 번호가 발송되었습니다").css("color", "blue");
						$("#memberEmail").prop("readonly",true);
						$("#Email_Number").prop("readonly",false);
						$("#Email_Number").attr("value","");
						key = json.key;
					});
				} else {
					$("#resultEmail").text("형식에 맞지 않는 이메일입니다").css("color", "red");
				}
			})
		});