<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		$(".mailNum").hide();
		
		/* --------------- 이메일 인증 보내기 --------------- */
		$(".sendMail").click(function() {
			var mail = $(".mail").val(); 
			
			if (mail == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			} else {
				mail = mail+"@"+$(".domain").val();
				
				var url = "CheckMail.do";
				
				$.getJSON(url, {
					"mail" : mail
				}, function(json) {
					alert("인증번호가 전송되었습니다");
					alert("인증번호 : " + json.key);
					$(".mailNum").show();
					isCertification=true;
				});
			}
		});
		
		
		/* --------------- ID 중복검사 --------------- */
		$("#checkId").click(function() {

			// 입력값 얻어오기
			var id = $("#memberId").val();

			// 입력여부 검사
			if (id == "") {
				$("#fail_result").text("아이디를 입력해주세요").css("color", "red");
				$("#memberId").focus();
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
					$("#fail_result").text("사용 가능").css("color", "blue");
				} else {
					$("#fail_result").text("사용 불가능").css("color", "red");
				}
			});
		});
	});
</script>

</head>
<body>
	<h2>회원가입 정보 입력</h2>
	<form action="userRegistSubmit" method="post">
		<table border="1">
			<tr>
				<td width=50>ID</td>
				<td><input type="text" name="memberId" id="memberId">
					<button type="button" id="checkId">중복확인</button></td>

			</tr>
			<tr>
				<td><div id="fail_result"></div></td>
			</tr>
			<tr>
				<td width=50>비밀번호</td>
				<td><input type="text" name="memberPw"></td>
			</tr>
			<tr>
				<td width=50>이름</td>
				<td><input type="text" name="memberName"></td>
			</tr>
			<tr>
				<td width=50>닉네임</td>
				<td><input type="text" name="memberNickname"></td>
			</tr>
			<tr>
				<td width=50>이메일</td>
				<td>
					<input type="text" name="memberEmail" class="mail">
					@<input type="text" class="domain">
					<button type="button" class="sendMail">인증</button><br>
					<p class="mailNum">인증 번호를 입력해주세요 <input type="text"></p>
				</td>

			</tr>
			<tr>
				<td width=50>전화번호</td>
				<td><input type="text" name="memberNumber"></td>
			</tr>

		</table>

		<input type="submit" value="등록"> <input type="reset"
			value="다시작성"> <input type="button" value="회원조회"
			onClick="location.href='userView'">
	</form>
</body>
</html>