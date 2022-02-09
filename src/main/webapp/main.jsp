<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	
function notice1( adminCode )
{
	var a = document.paging;
	a.adminCode.value = adminCode;
	
	a.action ="./Notice"
	
	a.method="post"
	a.submit();

}; 

</script>
</head>
<body>
<div align="center">
		<h1>환영합니다. ${memberDTO.memberName}</h1>
<form name="paging">

			<a href="userInfo">회원조회</a><br>
			<c:if test="${empty memberDTO}">
				<a href="userLogin">로그인</a>
				<br>
			</c:if>
			<c:if test="${not empty memberDTO}">
				<a href="userMyInfo">마이페이지</a>
				<br>
			</c:if>
			<c:if test="${not empty memberDTO}">
				<a href="userLogout">로그아웃</a>
				<br>
			</c:if>
			<c:if test="${empty memberDTO}">
				<a href="userSignUp">회원가입</a>
				<br>
			</c:if>

<input type="hidden" name="adminCode" /> 
<a href='javascript:notice1("1")'>공지사항</a> <br>	

<a href="Questionlist">Q . A</a> 
<input type="hidden" id="memberCode" />
<br>
<a href="GifticonList">기프티콘</a>
<br>
<a href="Nconfirm">Q.A 답변확인</a>
</form>
		<a href="menu">메뉴</a><br> <a href="brand">브랜드</a><br>
	</div>
</body>
</html>