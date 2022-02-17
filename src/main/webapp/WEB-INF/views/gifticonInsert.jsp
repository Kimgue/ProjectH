<<<<<<< HEAD
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
<link href="<c:url value="/resources/css/adminMenu.css"/>"
	rel="stylesheet" />
<script>
	$(document).ready(function() {
		const inputImage = document.getElementById("input-image");
		inputImage.addEventListener("change", e => {readImage(e.target)});
	});
	
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image");
	            previewImage.src = e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	function insert() {
		var result = confirm("등록하시겠습니까?");
		if(result) {
			alert("등록되었습니다");
			
			const uploadPath = "C:/2108KHS/Git/WebProject/src/main/webapp/resources/images/gifticon";
			
			const imageInput = $("#input-image")[0];
			if(imageInput.files.length === 0){
			    alert("파일은 선택해주세요");
			    return;
			}
			
			const formData = new FormData();
			formData.append("uploadFile", imageInput.files[0]);
			formData.append("uploadPath", uploadPath);
			
			$.ajax({
				type : "POST",
				url : "fileUpload.do",
				processData : false,
				contentType : false,
				data : formData,						
				success : function(response) {
					$("#gifticonImg").attr("value","images/gifticon/"+response);
					$("#insertForm").submit();
				},
				error : function(jqXHR) {
					alert(jqXHR.responseText); 
				}
			});			
		} else {
			return false;
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
		<form id="insertForm" action="gifticonInsertSubmit" method="post"
			enctype="multipart/form-data">
			<ul>
				<li>기프티콘 이름 <input type="text" name="gifticonName"></li>
				<li>기프티콘 가격 <input type="text" name="gifticonPrice"></li>
				<li>메뉴 <input type="text" name="menuCode"></li>
				<li>브랜드 <select name="brandCode" id="testslt">
						<option value="">브랜드 선택</option>
						<option value="H1">맥도날드</option>
						<option value="H2">롯데리아</option>
				</select>
				</li>
				<li><img style="width: 100px;" id="preview-image" src="">
					<input type="hidden" id="gifticonImg" name="gifticonImg"> 
					<input type="file" id="input-image" name="uploadfile" required="required">
				</li>
			</ul>
		</form>
		<input type="button" value="작성" onclick="insert()"> 
		<input type="reset" value="취소">
	</div>

	<!---------------------------------- FOOTER ---------------------------------->
	<div id="footer"></div>

</body>
=======
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
<link href="<c:url value="/resources/css/adminMenu.css"/>"
	rel="stylesheet" />
<script>
	$(document).ready(function() {
		const inputImage = document.getElementById("input-image");
		inputImage.addEventListener("change", e => {readImage(e.target)});
	});
	
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image");
	            previewImage.src = e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	function insert() {
		var result = confirm("등록하시겠습니까?");
		if(result) {
			alert("등록되었습니다");
			
			const filePath = "gifticon";
			
			const imageInput = $("#input-image")[0];
			if(imageInput.files.length === 0){
			    alert("파일은 선택해주세요");
			    return;
			}
			
			const formData = new FormData();
			formData.append("uploadFile", imageInput.files[0]);
			formData.append("filePath", filePath);
			
			$.ajax({
				type : "POST",
				url : "fileUpload.do",
				processData : false,
				contentType : false,
				data : formData,						
				success : function(response) {
					$("#gifticonImg").attr("value","images/gifticon/"+response);
					$("#insertForm").submit();
				},
				error : function(jqXHR) {
					alert(jqXHR.responseText); 
				}
			});			
		} else {
			return false;
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
		<form id="insertForm" action="gifticonInsertSubmit" method="post"
			enctype="multipart/form-data">
			<ul>
				<li>기프티콘 이름 <input type="text" name="gifticonName"></li>
				<li>기프티콘 가격 <input type="text" name="gifticonPrice"></li>
				<li>브랜드<select name="brandCode" id="testslt">
						<option value="">브랜드 선택</option>
						<option value="H1">맥도날드</option>
						<option value="H2">롯데리아</option>
						</select>
				</li>
				
				<li>메뉴<select name="menuCode" id="testslt">
						<option value="">메뉴 선택</option>
						<option value="01">01</option>
						<option value="02">02</option>
						</select>
				</li>
				<li><img style="width: 100px;" id="preview-image" src="">
					<input type="hidden" id="gifticonImg" name="gifticonImg"> 
					<input type="file" id="input-image" name="uploadfile" required="required">
				</li>
			</ul>
		</form>
		<input type="button" value="작성" onclick="insert()"> 
		<input type="button" value="취소" onClick="location.href='gifticonList'">
	</div>

	<!---------------------------------- FOOTER ---------------------------------->
	<div id="footer"></div>

</body>
>>>>>>> branch 'master' of https://github.com/Kimgue/WebProject.git
</html>