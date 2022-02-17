<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>

	function dateFormat(date) {
	    let month = date.getMonth() + 1;
	    let day = date.getDate();
	    let hour = date.getHours();
	    let minute = date.getMinutes();
	    let second = date.getSeconds();
	
	    month = month >= 10 ? month : '0' + month;
	    day = day >= 10 ? day : '0' + day;
	    hour = hour >= 10 ? hour : '0' + hour;
	    minute = minute >= 10 ? minute : '0' + minute;
	    second = second >= 10 ? second : '0' + second;
	
	    return date.getFullYear() + '년 ' + month + '월 ' + day + '일 ';
	}
	
	$(document).ready(function() {
		var abc = $("#gifticonDate:first").val();
		var month = new Date(abc);
		
		var currentMonth = dateFormat(month);
		month.setMonth(month.getMonth() +1);
		var nextMonth = dateFormat(month);
		
		$("#currentMonth").text(currentMonth);
		$("#nextMonth").text(nextMonth);
		
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
			이달의 기프티콘<br>
			<span id="currentMonth"></span> ~ <span id="nextMonth"></span>
				<c:forEach var="gift" items="${gifticonList}">
					<form id="formbtn${gift.gifticonCode}" action="gifticonExchange" method="post">
						<div align="center">
							<input type="hidden" name="gifticonCode" value="${gift.gifticonCode}" />
							<input type="hidden" id="gifticonDate" value="${gift.gifticonDate}" />
							<img src="<c:url value='${gift.gifticonImg}' />" alt="${gift.gifticonImg}" height="270" width="270"/><br>
							상품명 : <c:out value="${gift.gifticonName}" /> <br>
							필요 포인트 : <c:out value="${gift.gifticonPrice}" /> <br>
							<input type="button" class="btn" id="btn${gift.gifticonCode}" value="교환"> <hr>
							
						</div>
					</form>
					
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