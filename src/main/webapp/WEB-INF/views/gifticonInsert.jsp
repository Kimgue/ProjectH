<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 등록</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="<c:url value="/resources/css/adminMenu.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/css/gifticonInsert.css"/>" rel="stylesheet" />
<script>
	$(document).ready(function() {

	});
	
	document.getElementById('bizFile').addEventListener('change', function(){
		var filename = document.getElementById('fileName');
		if(this.files[0] == undefined){
			filename.innerText = '선택된 파일없음';
			return;
		}
		filename.innerText = this.files[0].name;
	});
	
	function test() {
		var testslt = $("#testslt").val();
		
		if(testslt == "") {
			return false;
		} else {
			$("#test").submit();
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
		<form id="test" action="gifticonInsertSubmit" method="post" enctype="multipart/form-data">
			<ul>
				<li>기프티콘 이름 <input type="text" name="gifticonName"></li>
				<li>기프티콘 가격 <input type="text" name="gifticonPrice"></li>
				<li>메뉴 <input type="text" name="menuCode"></li>
				<li>브랜드
					<select name="brandCode" id="testslt">
	    				<option value="">브랜드 선택</option>
	    				<option value="H1">맥도날드</option>
	    				<option value="H2">롯데리아</option>
					</select>
				</li>
				<li>이미지 첨부 <input type="file" name="uploadfile" required="required"></li>
			</ul>
			<input type="button" value="작성" onclick="test()"> 
			<input type="reset" value="취소">
		</form>
	</div>

	<!---------------------------------- FOOTER ---------------------------------->
	<div id="footer"></div>

</body>
</html>