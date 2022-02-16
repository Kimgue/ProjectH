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
	function rand(min, max) {
		return Math.floor(Math.random() * (max - min +1)) + min;
	}


	function insertGifticonExchange() {
		var currentPoint = $("#holdPoint").val();
		var gifticonPoint = $("#gifticonPrice").val();
		var gifticonName = $("#gifticonName").val();

		if(currentPoint < gifticonPoint) {
			alert("보유 포인트가 부족합니다");
			return false;
		} else {
			var result = confirm(gifticonName + " 상품을 교환하시겠습니까?");
			if(result) {
				alert("교환");
				
				var gifticonNumber = rand(1,899999999)+100000000;
				alert(gifticonNumber);
				$("#gifticonNumber").attr("value",gifticonNumber);
				
				
				var usePoint = $("#gifticonPrice").val();
				alert(usePoint);
				$("#usePoint").attr("value",usePoint);
				
				
				var gifticonExdate = new Date();
				alert(gifticonExdate);
				$("#gifticonExdate").attr("value",gifticonExdate);
				
				$("#insertGifticonExchange").submit();
			} else {
				return false;
			}
		}
	}
</script>
</head>
<body>
	<!---------------------------------- HEADER ---------------------------------->
	<div id="header">
		<h1>교환 페이지</h1>
	</div>

	<!---------------------------------- NAV ---------------------------------->
	<div id="nav">
		
	</div>

	<!---------------------------------- CONTENT ---------------------------------->
	<div id="content">
		<c:choose>
			<c:when test="${not empty gifticonList}">
				<form id="insertGifticonExchange" action="insertGifticonExchange" method="post">
					
					<input type="hidden" id="gifticonCode" name="gifticonCode" value="${gifticonList.gifticonCode}" />
					<input type="hidden" id="memberCode" name="memberCode" value="${memberDTO.memberCode}" />
					<input type="hidden" id="holdPoint" name="holdPoint" value="${memberDTO.holdPoint}" />
					
					<input type="hidden" id="gifticonImg" name="gifticonImg" value="${gifticonList.gifticonImg}" />
					<input type="hidden" id="gifticonName" name="gifticonName" value="${gifticonList.gifticonName}" />
					<input type="hidden" id="gifticonPrice" name="gifticonPrice" value="${gifticonList.gifticonPrice}" />
					<input type="hidden" id="brandCode" name="brandCode" value="${gifticonList.brandCode}" />
					<input type="hidden" id="menuCode" name="menuCode" value="${gifticonList.menuCode}" />
					
					<input type="hidden" id="gifticonExcode" name="gifticonExcode" />
					<input type="hidden" id="gifticonNumber" name="gifticonNumber" />
					<input type="hidden" id="gifticonExdate" name="gifticonExdate" />
					<input type="hidden" id="usePoint" name="usePoint" />
					
					<img src="<c:url value='${gifticonList.gifticonImg}' />" alt="${gifticonList.gifticonImg}" height="270" width="270"/><br>
					<c:out value="${gifticonList.gifticonCode}" /><br> 
					<c:out value="${gifticonList.gifticonImg}" /><br>
					
					기프티콘명<br>
					<c:out value="${gifticonList.gifticonName}" /><br> 
					필요 포인트<br> 
					<c:out value="${gifticonList.gifticonPrice}" /><br>
					교환처<br> 
					<c:out value="${gifticonList.brandCode}" /><br> 
					<c:out value="${gifticonList.menuCode}" /><br>
					
					<br><br><br>
					<c:out value="${memberDTO.memberName}" />님의 현재 보유 포인트 : <c:out value="${memberDTO.holdPoint}" /><br>
				</form>
				<input type="button" value="교환" onclick="insertGifticonExchange()">
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