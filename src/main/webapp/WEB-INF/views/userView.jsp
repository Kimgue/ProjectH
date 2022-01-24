<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 보기</title>
</head>
<body>
	<table border="1">
		<tr>
			<td width=50>code</td>
			<td width=50>id</td>
			<td width=50>pw</td>
			<td width=50>name</td>
			<td width=50>nickname</td>
			<td width=50>email</td>
			<td width=50>number</td>
			<td width=50>date</td>
			<td width=50>point</td>
		</tr>
		
		<c:forEach var="list" items="${LIST}">
			<tr>
				<td><c:out value="${list.memberCode}" /></td>
				<td><c:out value="${list.memberId}" /></td>
				<td><c:out value="${list.memberPw}" /></td>
				<td><c:out value="${list.memberName}" /></td>
				<td><c:out value="${list.memberNickname}" /></td>
				<td><c:out value="${list.memberEmail}" /></td>
				<td><c:out value="${list.memberNumber}" /></td>
				<td><c:out value="${list.memberDate}" /></td>
				<td><c:out value="${list.holdPoint}" /></td>
			</tr>
		</c:forEach> 
		
	</table>
	<input type="button" value="회원등록" onClick="location.href='userRegist'">
	<input type="button" value="로그인" onClick="location.href='userLogin'">
</body>
</html>