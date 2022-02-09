<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	function FindPw() {
		var val_Id = $("#memberId").val();
		if (val_Id == "") {
			$("#memberId").focus();
			alert("아이디를 입력해주세요");
			return;
		} else {
			var url = "idChkCtrl.do";

			$.getJSON(url, {
				"id" : val_Id
			}, function(json) {
				var result_text = json.result;
				var result = eval(result_text);

				if (result) {
					alert("입력한 아이디를 찾을 수 없습니다");
					$("#memberId").attr("value", "");
					$("#memberId").focus();
				} else {
					$("#FindPw").submit();
				}
			});
		}
	}
</script>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	비밀번호를 찾고자 하는 아이디를 입력해주세요
	<h1>${wrongNotice}</h1>
	<form id="FindPw" action="userFindPwSubmit" method="post">
		<input type="text" id="memberId" name="memberId"> 
		<input type="button" value="확인" onclick="FindPw()"> 
		<input type="button" value="아이디 찾기" onClick="location.href='userFindId'">
	</form>
</body>
</html>