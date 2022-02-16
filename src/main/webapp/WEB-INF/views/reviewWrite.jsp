<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 작성</title>
<style>
input[type=text]::-ms-clear{
	display: none;
}
</style>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${url}'/>";
	
	if(msg != null && msg !=''){
	alert(msg);
	location.href = url;
	}
	
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
			
			const filePath = "review";
			
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
					$("#reviewImg1").attr("value","images/review/"+response);
					$("form").submit();
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

<div align="center">
		<button onclick="history.back()">돌아가기</button>	
		<form action="reviewWriteSubmit" method="post" enctype="multipart/form-data">
			<br> 
			<input type='hidden' name='brandCode' value='${brandCode}' readonly/>
			<br> 
			<input type='hidden' name='menuCode' value='${menuCode}' readonly/>
			<br> 
			메뉴명:
			<input type='text' name='menuName' value='${menuName}' readonly/>
			<br> 
			리뷰점수: 
			<input type='number' name='reviewScore' min='1' max='5' step='0.1' required/>
			<br> 
			리뷰내용:
			<input type='text' name='reviewContent' style="width:300px;height:200px;" required/>
			<br> 
			리뷰이미지:
			<img style="width: 100px;" id="preview-image" src="" />
			<input type="hidden" id="reviewImg1" name="reviewImg1" /> 
			<input type="file" id="input-image" name="uploadfile" required />
			<br> 
			<input type="submit" value="전송">
			<input type="reset" value="취소">
		</form>
</div>
</body>
</html>