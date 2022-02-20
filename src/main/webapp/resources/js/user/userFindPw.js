	function FindPw() {
		var val_Id = $("#memberId").val();
		if (val_Id == "") {
			$("#memberId").focus();
			$("#resultId").text("아이디를 입력해주세요").css("color", "red");
			return;
		} else {
			var url = "chkId.do";

			$.getJSON(url, {
				"id" : val_Id
			}, function(json) {
				var result_text = json.result;
				var result = eval(result_text);

				if (result) {
					$("#resultId").text("아이디를 찾을 수 없습니다").css("color", "red");
					$("#memberId").val("");
					$("#memberId").focus();
				} else {
					$("#FindPw").submit();
				}
			});
		}
	}