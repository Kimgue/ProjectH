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
	
	function update() {
		var result = confirm("수정하시겠습니까?");
		if(result) {
			alert("수정되었습니다");
			
			const uploadPath = "gifticon";
			
			const imageInput = $("#input-image")[0];
			if(imageInput.files.length === 0){
			    alert("파일은 선택해주세요");
			    return;
			}
			
			const formData = new FormData();
			const fileName = $("#gifticonImg").val();
			
			formData.append("uploadFile", imageInput.files[0]);
			formData.append("filePath", uploadPath);
			formData.append("fileName", fileName);
			
			
			
			$.ajax({
				type : "POST",
				url : "fileDelete.do",
				processData : false,
				contentType : false,
				data : formData,						
				success : function(response) {
					$.ajax({
						type : "POST",
						url : "fileUpload.do",
						processData : false,
						contentType : false,
						data : formData,						
						success : function(response) {
							$("#gifticonImg").attr("value","images/gifticon/"+response);
							$("#updateGifticon").submit();
						},
						error : function(jqXHR) {
							alert(jqXHR.responseText); 
						}
					});	
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
		<form id="updateGifticon" action="gifticonUpdateSubmit" method="post">
			<table>
				<tr>
					<td>
					<input type="text" value="${gifticonList.gifticonCode}" name="gifticonCode">
					</td>
				</tr>
			
				<tr>
					<td>
					현재 이미지<br>
					<img src="<c:url value='${gifticonList.gifticonImg}' />" alt="${gifticonList.gifticonImg}" height="270" width="270"/><br>
					수정할 이미지<br>
					<img style="width: 100px;" id="preview-image" src="">
					<input type="hidden" id="gifticonImg" value="${gifticonList.gifticonImg}" name="gifticonImg"> 
					<input type="file" id="input-image" name="uploadfile" required="required">
					</td>
				</tr>
			
				<tr>
					<td>
					<input type="text" value="${gifticonList.gifticonName}" name="gifticonName">
					</td>
				</tr>
			
				<tr>
					<td>
					<input type="text" value="${gifticonList.gifticonPrice}" name="gifticonPrice">
					</td>
				</tr>			
			
				<tr>
					<td>
					<input type="text" value="${gifticonList.brandCode}" name="brandCode">
					</td>
				</tr>
				
				<tr>
					<td>
					<input type="text" value="${gifticonList.menuCode}" name="menuCode">
					</td>
				</tr>
			</table>
		</form>
		<input type="button" value="수정" onclick="update()">
		<input type="button" value="취소" onClick="location.href='gifticonUpdate'">
	</div>

	<!---------------------------------- FOOTER ---------------------------------->
	<div id="footer"></div>

</body>
</html>