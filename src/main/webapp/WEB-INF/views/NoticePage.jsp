<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transactional//EN" "http://www.w3.org/TR/html4/losee.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<style>

table, td, th {
  border : 1px solid black;
  border-collapse : collapse;
};
table {
  width : 300px;
  height : 200px;
};
</style>
</head>
<body>
	<H4>공지사항</H4>
	<table border="1">
		<tr>
			<td width=40>번호</td>
			<td width=200 height=40>제목</td>
			<td width=200>관리자</td>
			<td width=150>작성날짜</td>
			
		</tr>
		<c:forEach var="lis" items="${ list }">
			<tr>
				<td><c:out value="${ lis.noticeCode}" /></td>
				<td><a href="view2?adminCode=${ lis.adminCode }&noticeCode=${lis.noticeCode}"><c:out value="${lis.noticeTitle}" /></a></td>
				<td><c:out value="${lis.adminCode }"></c:out>
				<td><c:out value="${lis.noticeDate}" /></td>	
			</tr>
		</c:forEach>
	</table>	
	<br>
	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<a href="Notice?page=${idx}">${idx}</a>
    </c:forEach>
	<hr>
	
</body>
</html>