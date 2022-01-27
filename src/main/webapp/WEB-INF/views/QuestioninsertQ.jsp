<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
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
</script>
<script type="text/javascript">
	//이미지 미리보기
	var sel_file;

	$(document).ready(function() {
		$("#file1").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

		filesArr.forEach(function(f) {
			if (!f.type.match(reg)) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
<script type="text/javascript">
	//파일 업로드
	function fn_submit() {

		var form = new FormData();
		form.append("file1", $("#file1")[0].files[0]);

		jQuery.ajax({
			url : "result",
			type : "POST",
			processData : false,
			contentType : false,
			data : form,
			success : function(response) {
				alert("성공하였습니다.");
				console.log(response);
			},
			error : function(jqXHR) {
				alert(jqXHR.responseText);
			}
		});
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
			<form role="form" method="post" action="Questioninsert" encType ="multipart/form-data">
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
						<td><label for="qstnContent">내용</label> <textarea
								id="qstnContent" name="qstnContent"></textarea></td>
					</tr>
					<tr>
						<td><label for="qstnDate" id="qstnDate">작성날짜 : ${ date }</label>
							<input type="hidden" id="qstnDate" name="qstnDate"
							value="${date }"></td>	
					</tr>
					<tr>
						<td>
								<input type="file" id="qstnImg">
							</td>
						</tr>			
					<tr>
						<td>
							<button type="submit" id="submit">작성</button>
						</td>
					</tr>
					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>