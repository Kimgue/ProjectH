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
			<td width=50>회원 코드</td>
			<td width=50>아이디</td>
			<td width=50>비밀번호</td>
			<td width=50>이름</td>
			<td width=50>닉네임</td>
			<td width=50>이메일</td>
			<td width=50>전화번호</td>
			<td width=50>가입일자</td>
			<td width=50>보유 포인트</td>
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
</body>
</html>