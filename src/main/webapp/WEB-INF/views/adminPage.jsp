<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="resources/css/adminPage.css" rel="stylesheet"/> 	
<script>
	$(document).ready(function() {
	    $(".btn").click(function() {
	    	var menuId = $(this).attr("id");
	    	 $.ajax({
               url : menuId,
               success : function(result) {
                   $("#Info").html(result);
               }
            });
	    });
	});
</script>
</head>
<body>
<div id="header">
	<h1>관리 페이지</h1>
</div>

<div id="sidebar">
	<div>
		- 회원<br>
		<input type="button" class="btn" id="userInfo" value="회원조회">

		</div>
		<div>
		- 메뉴<br>
		메뉴 등록<br>
		메뉴 수정<br>
		메뉴 삭제
		</div>
		<div>
		- 브랜드<br>
		브랜드 등록<br>
		브랜드 수정<br>
		브랜드 삭제
		</div>
		<div>
		- 공지사항<br>
		<input type="button" class="btn" id="AdminNoticelist" value="공지사항 리스트"><br>
		<input type="button" class="btn" id="noticeinsertN" value="공지사항 등록"><br>
		</div>
		<div>
		-Q&A 답변확인<br>
		<input type="button" class="btn" id="Nconfirm" value="Q.A 답변확인"><br>
		</div>
		<div>
		- 기프티콘<br>
		<input type="button" class="btn" id="gifticonInsert" value="기프티콘 등록"><br>
		기프티콘 수정<br>
		기프티콘 삭제
		</div>
</div>

<div id="maincontent">
		<span id="Info"></span>
</div>

<div id="footer">
	
</div>
</body>
</html>