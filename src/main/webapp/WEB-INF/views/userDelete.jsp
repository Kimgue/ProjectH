<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	function userDelete() {
		var chk = $("#userDelChk").val();
		if(chk != "회원탈퇴") {
			alert("잘못된 입력입니다")
		} else {
			var chkFinal = confirm("정말 탈퇴하시겠습니까?");
			alert(chkFinal);
			
			if(chkFinal == true) {
				$("#userDelete").submit();
			}
		}
	}
</script>
</head>
<body>
	<form id="userDelete" action="userDeleteSubmit" method="post">
		<h2>회원탈퇴</h2><br>
		회원탈퇴를 진행하시려면 '회원탈퇴' 를 입력하고 탈퇴 버튼을 클릭해주세요

		<input type="text" id="userDelChk">
		<input type="button" value="회원탈퇴" onclick="userDelete()">
	</form>
</body>
</html>