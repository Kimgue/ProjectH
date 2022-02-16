<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 삭제</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="<c:url value="/resources/css/adminMenu.css"/>" rel="stylesheet" />
<script>
	$(document).ready(function() {
		
		$(".btn").click(function() {
			
			var result = confirm("삭제하시겠습니까?");
			if(result) {
				alert("삭제되었습니다");
				
				var a = $(this).attr("id");
				
				const filePath = "gifticon";
				const fileName = $(".img"+a).attr("value");
				
				const formData = new FormData();
				formData.append("filePath", filePath);
				formData.append("fileName", fileName);
				
				$.ajax({
					type : "POST",
					url : "fileDelete.do",
					processData : false,
					contentType : false,
					data : formData,						
					success : function(response) {
						
						$("#form"+a).submit();
					},
					error : function(jqXHR) {
						alert(jqXHR.responseText); 
					}
				});
			} else {
				return false;
			}	
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
					<form id="formbtn${gift.gifticonCode}" action="gifticonDeleteSubmit" method="post">
						<input type="hidden" value="${gift.gifticonCode}" name="gifticonCode">
						<c:out value="${gift.gifticonCode}" /><br>
						
						<input type="hidden" class="imgbtn${gift.gifticonCode}" value="${gift.gifticonImg}" name="gifticonImg">
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
					<input type="button" class="btn" id="btn${gift.gifticonCode}" value="삭제">
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