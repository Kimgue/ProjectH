<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		const inputImage = document.getElementById("qstnImg");
		inputImage.addEventListener("change", e => {readImage(e.target)});
		
		$("#submit").click(function() {
			
			if ($("#qstnTitle").val().length == 0) {
				alert("제목을 입력해주세요");
				$("#qstnTitle").focus();
				return false;
			}

			if ($("#qstnContent").val().length == 0) {
				alert("내용을 입력해주세요");
				$("#qstnContent").focus();
				return false;
			}
		});
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
	

	// 파일 업로드
	function insert() {
							
		var result = confirm("등록하시겠습니까?");
		if(result) {
			alert("등록되었습니다");
			
			const uploadPath = "G:/rbtjd/WebProject/src/main/webapp/resources/images/Q&AImg";
			
			const imageInput = $("#qstnImg")[0];
			if(imageInput.files.length == 0){
			   $("#qstnInsert").submit();
			} else {
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
						$("#testabc").attr("value","images/Q&AImg/"+response);
						$("#qstnInsert").submit();
					},
					error : function(jqXHR) {
						alert(jqXHR.responseText); 
					}
				});
			}	
		} else {
			return false;
		}
	}
</script>
<style>
input {
	vertical-align: top;
	width: 500px;
}

#qstnContent {
	width: 500px;
	height: 50px;
	resize: none;
	vertical-align: -20px;
}
</style>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />
		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container" >
			<form id="qstnInsert" role="form" method="post" action="Questioninsert" encType ="multipart/form-data">
				<table>
					<tbody>
					<thead>
						<tr>
							<th style="background-color: #eeeee; text-align: center;">게시판글쓰기 양식</th>
						</tr>
					</thead>
					<tr>
						<td><label for="memberCode" id="memberCode">작성자 번호 :${ member }</label> 
						<input type="hidden" id="memberCode" name="memberCode" value="${ member }"> 
						<input type="hidden" id="qstnCode" name="qstnCode" value="qstnCode">
						<input type="hidden" id="qstnConfirm" name="qstnConfirm" value="n"/>
					</tr>
					<tr>
						<td><label for="qstnTitle">제목</label><input type="text"
							id="qstnTitle" name="qstnTitle" /></td>
					</tr>
					<tr>
						<td><label for="qstnContent">내용</label>
						<textarea id="qstnContent" name="qstnContent"></textarea> 
						</td>
					</tr>
					<tr>
						<td><label for="qstnDate" id="qstnDate">작성날짜 : ${ date }</label>
							<input type="hidden" id="qstnDate" name="qstnDate"
							value="${date }"></td>	
					</tr>
					<tr>
						<td>	
							
							<input type="hidden" id="testabc" name="qstnImg">
							<input type="file" id="qstnImg" name="uploadfile">
							<img style="width: 100px;" id="preview-image" src="">
							<div class="img"></div>
							</td>
						</tr>			
					<tr>
						<td>
						<!-- <button type="submit" id="submit">작성</button> -->						
							 <input type="button" value="작성" onclick="insert()"> 
						</td>
					</tr>
					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>
	<!-- <textarea id="qstnContent" name="qstnContent"></textarea> -->
</body>
</html>