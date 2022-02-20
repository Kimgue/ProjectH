	function userDelete() {
		var chk = $("#userDelChk").val();
		if(chk != "회원탈퇴") {
			alert("잘못된 입력입니다")
		} else {
			var chkFinal = confirm("정말 탈퇴하시겠습니까?");
			
			if(chkFinal == true) {
				$("#userDelete").submit();
			}
		}
	}