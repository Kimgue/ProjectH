<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 function reply1(  memberCode ,   qstnCode )
	{
		var f = document.paging;
		
		f.memberCode.value = memberCode;
		f.qstnCode.value = qstnCode;
		f.action = "./reply"
		
		f.method= "post"
		f.submit();
	};
</script>
</head>
<body>
<form name="paging">
<table border="1">
			<thead>
				<tr>
					<td width=100 >회원 번호</td>
					<td width=100>글 번호</td>
					<td width=350 height=40>제목</td>
					<td width=250>작성일</td>
					<td width=100>답변여부</td>
				</tr>
			</thead>
			<c:forEach var="list" items="${ list }">
				<tr>
					<td><c:out value="${ list.memberCode }" /></td>
					<td><c:out value="${ list.qstnCode }" /></td> 
					<td><a href="javascript:reply1('${list.memberCode }','${list.qstnCode }')"><c:out value="${ list.qstnTitle }" /></a></td> 
					<td><c:out value="${ list.qstnDate }" /></td>
					<td><c:out value="${ list.qstnConfirm }" /></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<a href="Nconfirm?page=${idx}">${idx}</a>
		</c:forEach>
		<hr>
		<input type="button" value="메인페이지" onClick="location.href='main.jsp'">
		<input type="hidden" name="memberCode" /> 
		<input type="hidden"name="qstnCode" />
		</form>
</body>
</html>