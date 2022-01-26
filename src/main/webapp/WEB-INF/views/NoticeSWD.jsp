<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script src="js/NoticeSWD.js"></script>
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
  
<form name="paging">
<H4>공지사항</H4>
	<table border="1">
		<tr>
			<td width=40>번호</td>
			<td width=350 height=40>제목</td>
			<td width=100>관리자</td>
			<td width=250>작성날짜</td>
			<td width=50>수정</td>
			<td width=50>삭제</td>
			
		</tr>
		<c:forEach var="list" items="${listpage}">
			<tr>
				<td><c:out value="${list.noticeCode}" /></td>
				<td><a href="javascript:view2('${ list.adminCode }','${list.noticeCode}')"><c:out value="${ list.noticeTitle }" /></a></td>
				<td><c:out value="${list.adminCode }"></c:out>
				<td><c:out value="${list.noticeDate}" /></td>	
				<td><a href="javascript:Noticeupdatelist('${ list.adminCode }','${list.noticeCode}' )">수정</a></td>
				<td><a href="javascript:Noticedelete('${ list.adminCode }','${list.noticeCode}')">삭제</a></td>
			</tr>
		</c:forEach>
	</table>	
	<br>
	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<a href="Notice?page=${idx}">${idx}</a>
    </c:forEach>
    
	<hr>
	<input type="button" value="작성" onClick="insert('${ noticecode.adminCode }')">
	
	<input type="hidden" name="adminCode" />
	<input type="hidden" name="noticeCode" />
	</form>
</body>
</html>