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
</head>
<body>
	<form action="gifticonInsertSubmit" method="post" enctype="multipart/form-data">
		<fieldset>
			<table>
				<tr>
					<th>기프티콘 이름</th>
					<td>
						<input type="text" name="gifticonName">
					</td>				
					<th>기프티콘 가격</th>
					<td>
						<input type="text" name="gifticonPrice">
					</td>				
					<th>메뉴</th>
					<td>
						<input type="text" name="menuCode">
					</td>
					<th>브랜드</th>
					<td>
						<input type="text" name="brandCode">
					</td>
					<th>파일</th>
					<td>
						<input type="file" name="uploadfile" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="작성">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>