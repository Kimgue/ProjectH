<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 Q.A</title>
<script>

	function view(  memberCode ,   qstnCode )
	{
		var f = document.paging;
		
		f.memberCode.value = memberCode;
		f.qstnCode.value = qstnCode;
		f.action = "./view1"
		
		f.method= "post"
		f.submit();
	};
	function insert(  memberCode )
	{
		var f = document.paging;
		
		f.memberCode.value = memberCode;
		
		f.action = "./insertQnA"
		
		f.method= "post"
		f.submit();
	};
	
</script>
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
<H4>Q.A</H4>	
	<table border="1">
	
		<tr>
			<td width=40>번호</td>
			<td width=500 height=40 >제목</td>
			<td width=250>작성자</td>
			<td width=250>작성날짜</td>
			
		</tr>
		<c:forEach var="list"  items="${ listpage }">
			<tr>
				<td><c:out value="${list.qstnCode}" /></td>
				<td><a href="javascript:view( '${list.memberCode }' , '${list.qstnCode}' )"><c:out value="${list.qstnTitle}" /></a></td>
				<td><c:out value="${list.memberCode }"></c:out>
				<td id="ri"><c:out value="${list.qstnDate}" /></td>	
			</tr>
		</c:forEach>
	</table>	
	<br>
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<a href="Question?page=${idx}">${idx}</a>
    </c:forEach>
<hr>	
	<input type="button" value="작성" onClick="insert('${member.memberCode}')">
	<input type="button" value="메인페이지" onClick="location.href='/'">
	<input type="hidden" name="memberCode" />
	<input type="hidden" name="qstnCode" />
	
</form>
</body>
</html>