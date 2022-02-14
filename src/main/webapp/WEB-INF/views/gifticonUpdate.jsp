<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 수정</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="<c:url value="/resources/css/adminMenu.css"/>" rel="stylesheet" />
<script>
	$(document).ready(function() {
		
		$(".btn").click(function() {
			
			var code = $(this).attr("id").substring(3);
			
			$("#form"+code).submit();
		});

	});
</script>
</head>
<body>


	<!---------------------------------- HEADER ---------------------------------->
	<div id="header">
		<h1>관리 페이지</h1>
	</div>

	<!---------------------------------- NAV ---------------------------------->
	<div id="nav">
		<ul>
			<li>메뉴</li>
			<li>메뉴 등록</li>
			<li>메뉴 수정</li>
			<li>메뉴 삭제</li>
		</ul>

		<ul>
			<li>회원 조회</li>
		</ul>

		<ul>
			<li>브랜드</li>
			<li>브랜드 등록</li>
			<li>브랜드 수정</li>
			<li>브랜드 삭제</li>
		</ul>

		<ul>
			<li>공지사항 조회</li>
			<li>공지사항 등록</li>
		</ul>

		<ul>
			<li>질문과 답변</li>
		</ul>

		<ul>
			<li><a href="gifticonList">기프티콘 조회</a></li>
			<li><a href="gifticonInsert">기프티콘 등록</a></li>
			<li><a href="gifticonUpdate">기프티콘 수정</a></li>
			<li><a href="gifticonDelete">기프티콘 삭제</a></li>
		</ul>
	</div>

	<!---------------------------------- CONTENT ---------------------------------->
	<div id="content">
		<c:choose>
			<c:when test="${not empty gifticonList}">	
				<c:forEach var="gift" items="${gifticonList}">
			<form id="form${gift.gifticonCode}" action="gifticonUpdatePage" method="post">
				<input type="hidden" value="${gift.gifticonCode}" name="gifticonCode">
				<c:out value="${gift.gifticonCode}" /><br>
				
				<input type="hidden" value="${gift.gifticonImg}" name="gifticonImg">
				<img src="<c:url value='${gift.gifticonImg}' />" alt="${gift.gifticonImg}" height="270" width="270"/><br>
				
				<input type="hidden" value="${gift.gifticonName}" name="gifticonName">
				<c:out value="${gift.gifticonName}" /> <br>
				
				<input type="hidden" value="${gift.gifticonPrice}" name="gifticonPrice">
				<c:out value="${gift.gifticonPrice}" /> <br>
					
				<input type="hidden" value="${gift.brandCode}" name="brandCode">
				<c:out value="${gift.brandCode}" /><br>
				
				<input type="hidden" value="${gift.menuCode}" name="menuCode">
				<c:out value="${gift.menuCode}" /><br> 
			</form>
				<input type="button" class="btn" id="btn${gift.gifticonCode}" value="수정">
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