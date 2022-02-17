<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="<c:url value="/resources/css/adminMenu.css"/>" rel="stylesheet" />
<script>
	$(document).ready(function() {
		$(".btn").click(function() {
			var a = $(this).attr("id");
			
			<c:choose>
			<c:when test="${loginBool eq true}">
				$("#form"+a).submit();
			</c:when>
			
			<c:otherwise>
				alert("로그인이 필요합니다");
				document.location.href = "userLogin";
			</c:otherwise>
		</c:choose>
		});
	});
</script>
</head>
<body>
	<!---------------------------------- HEADER ---------------------------------->
	<div id="header">
		<h1>이달의 기프티콘</h1>
	</div>

	<!---------------------------------- NAV ---------------------------------->
	<div id="nav">
		
	</div>

	<!---------------------------------- CONTENT ---------------------------------->
	<div id="content">
		<c:choose>
			<c:when test="${not empty gifticonList}">			
				<c:forEach var="gift" items="${gifticonList}">
					<form id="formbtn${gift.gifticonCode}" action="gifticonExchange" method="post">
						<input type="hidden" name="gifticonCode" value="${gift.gifticonCode}" />
						<img src="<c:url value='${gift.gifticonImg}' />" alt="${gift.gifticonImg}" height="270" width="270"/>
						<c:out value="${gift.gifticonName}" /> 
						<c:out value="${gift.gifticonPrice}" />
					</form>
					<input type="button" class="btn" id="btn${gift.gifticonCode}" value="교환">
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<h1>기프티콘이 없네요</h1>
			</c:otherwise>
		</c:choose>
	</div>

	<!---------------------------------- FOOTER ---------------------------------->
	<div id="footer"></div>


</body>
</html>