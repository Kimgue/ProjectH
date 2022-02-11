<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 Q.A</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
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
	function insert(   )
	{
		var f = document.paging;
		
		f.action = "./insertQnA"
		
		f.method= "post"
		f.submit();
	}; 
</script>
<style>
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}

;
table {
	width: 300px;
	height: 200px;
}
;


</style>
</head>
<body>

안녕하세이모미ㅓㄹ
ㄴ이ㅏㅓㄹ민ㅇㄻ
<HR>
	<form name="paging">
		<H4>Q.A</H4>
		<table style="text-align: center; border: 1px solid #ddddd">

			<thead>
				<tr>
					<th style="background-color:#fafafa; text-align:center;">번호</th>
					<th style="background-color:#fafafa; text-align:center;">제목</th>
					<th style="background-color:#fafafa; text-align:center;">작성자</th>
					<th style="background-color:#fafafa; text-align:center;">작성일</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${ listpage }">
				<tr>
					<td id="code"><c:out value="${list.qesDto.qstnCode}" /></td>
					<td><a href="javascript:view('${list.qesDto.memberCode }','${list.qesDto.qstnCode }')"><c:out value="${list.qesDto.qstnTitle}" /></a></td>
					<td id="name"><c:out value="${list.memberDto.memberName }"></c:out>
					<td><c:out value="${list.qesDto.qstnDate}" /></td>
				</tr>
			</c:forEach>
		</table>
		
	
		<br>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="idx">
			<a href="Questionlist?page=${idx}">${idx}</a>
		</c:forEach>
		<hr>
		<input type="button" value="작성" onClick="insert()"> 
		<input type="button" value="메인페이지" onClick="location.href='main.jsp'">
		<input type="hidden" name="memberCode" /> 
		<input type="hidden"name="qstnCode" />

	</form>
		

</body>
</html>