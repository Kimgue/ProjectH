	function login() {
		var idChk = $("#Id").val();
		var pwChk = $("#Pw").val();

		if (idChk == "admin1" && pwChk == "12341234") {
			$("#login").attr("action", "adminLoginTry");
			$("#login").submit();
			
		} else if(idChk == "admin2" && pwChk == "12341234") {
			$("#login").attr("action", "adminLoginTry");			
			$("#login").submit();			
		} else {
			$("#login").attr("action", "userLoginTry");
			$("#login").submit();
		}

	}