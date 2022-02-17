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
var brandSltBool = false;
var menuSltBool = false;

	function brandSelect() {
		var brandCode = $("#brandCode").val();
		brandSltBool = true;
		
		switch(brandCode) {
		case 'H1':
			$("#menuCode option").remove();
			$("#menuCode").append("<option selected disabled>메뉴를 선택해주세요</option>");
			$("#menuCode").append("<option value=01>빅맥</option>");
			$("#menuCode").append("<option value=02>1955버거</option>");
			break;
		case 'H2':
			$("#menuCode option").remove();
			$("#menuCode").append("<option selected disabled>메뉴를 선택해주세요</option>");
			$("#menuCode").append("<option value=01>새우버거</option>");
			$("#menuCode").append("<option value=02>불고기버거</option>");
			break;
		}
	}
	
	function menuSelect() {
		menuSltBool = true;
	}

	function conditionSearch() {

		if(brandSltBool == false) {
			$("#conditionSearch").attr("action","gifticonList");
			$("#conditionSearch").submit();
		} else if(menuSltBool == false) {
			$("#conditionSearch").attr("action","sltGifticonBrand");
			$("#conditionSearch").submit();
		} else {
			$("#conditionSearch").attr("action","sltGifticonBrandMenu");
			$("#conditionSearch").submit();
		}
		
		
	}
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
				<form id="conditionSearch" method="POST">
					<select id="brandCode" name="brandCode" onchange="brandSelect()">
							<option value="" selected disabled>브랜드 선택</option>
							<option value="H1">맥도날드</option>
							<option value="H2">롯데리아</option>
					</select>
					
					<select id="menuCode" name="menuCode" onchange="menuSelect()">
							<option value="" selected disabled>-- 브랜드를 먼저 선택해주세요 --</option>
					</select>
				</form>
				
				<input type="button" value="조회" onClick="conditionSearch()">
				<hr>
				
				<c:forEach var="gift" items="${gifticonList}">
						<div align="center">
						<img src="<c:url value='${gift.gifticonImg}' />" alt="${gift.gifticonImg}" height="270" width="270"/><br>
						<c:out value="${gift.gifticonName}" /><br>
						<c:out value="${gift.gifticonPrice}" /><br>
						<c:out value="${gift.gifticonDate}" />
						</div>
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