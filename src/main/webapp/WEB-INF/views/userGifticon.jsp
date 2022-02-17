<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<h2>기프티콘페이지</h2>

<c:forEach var="userVo" items="${userVo}">
	<img src="<c:url value="${userVo.gifticonDto.gifticonImg}" />" alt="${userVo.gifticonDto.gifticonImg}" height="270" width="270"/> <br>
	기프티콘명 : <c:url value="${userVo.gifticonDto.gifticonName}" /> <br>
	기프티콘 번호 : <c:out value="${userVo.gifticonExchangeDto.gifticonNumber}" /> <br>
	기프티콘 교환 날짜 : <c:out value="${userVo.gifticonExchangeDto.gifticonExdate}" /> <br>
</c:forEach>

</body>
</html>