	function login() {
		var idChk = $("#Id").val();
		var pwChk = $("#Pw").val();

		if (idChk == "HungPick1" && pwChk == "12341234") {
			$("#login").attr("action", "adminLoginTry");
			$("#login").submit();
			
		} else {
			$("#login").attr("action", "userLoginTry");
			$("#login").submit();
		}

	}