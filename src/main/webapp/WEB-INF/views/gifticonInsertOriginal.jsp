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
<script>
var menuSltBool = false;

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
		const imageInput = $("#input-image")[0];
		const nameInput = $("#gifticonName").val();
		const priceInput = $("#gifticonPrice").val();
		
		if(imageInput.files.length === 0 || imageInput=="" || nameInput=="" || priceInput=="" || menuSltBool == false){
		    alert("입력되지 않은 항목이 있습니다");
		    return;
		}
		
		var result = confirm("등록하시겠습니까?");
		if(result) {
			alert("등록되었습니다");
			const filePath = "gifticon";
			
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
	
	function brandSelect() {
		var brandCode = $("#brandCode").val();
		
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
		
	</div>

	<!---------------------------------- FOOTER ---------------------------------->
	<div id="footer"></div>

</body>
</html>