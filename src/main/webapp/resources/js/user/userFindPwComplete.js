var passwdCheck = RegExp(/^[A-Za-z0-9]{8,16}$/);
	
	function FindPw() {
		var pw = $("#memberPw").val();
		var pwchk = $("#memberPwChk").val();
		
		if(pw == "" || pwchk == "") {
			$("#resultPw").text("비밀번호를 입력해주세요").css("color", "red");
			return;
		} else if(pw == pwchk){
			
			if(passwdCheck.test($('#memberPw').val())) {
				alert("비밀번호가 변경되었습니다");
				$("#FindPw").submit();
			} else {
				$("#resultPw").text("");
				$("#resultPwChk").text("형식에 맞지 않는 이메일입니다").css("color", "red");
			}
	
		} else {
			$("#resultPw").text("");
			$("#resultPwChk").text("변경할 비밀번호가 다릅니다").css("color", "red");
			return;
		} 
	}