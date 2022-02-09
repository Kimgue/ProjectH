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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${url}'/>";
	if(msg != null && msg !=''){
	alert(msg);
	location.href = url;
	}
</script>
</head>
<body>

<div align="center">
		<form action="reviewWriteSubmit" method="post">
			<br> 
			<input type='hidden' name='brandCode' value='${brandCode}' readonly/>
			<br> 
			<input type='hidden' name='menuCode' value='${menuCode}' readonly/>
			<br> 
			메뉴명:
			<input type='text' name='menuName' value='${menuName}' readonly/>
			<br> 
			리뷰점수: 
			<input type='text' name='reviewScore' />
			<br> 
			리뷰내용:
			<input type='text' name='reviewContent' style="width:300px;height:200px;" />
			<br> 
			리뷰이미지1:
			<input type='text' name='reviewImg1' />
			<br> 
			리뷰이미지2:
			<input type='text' name='reviewImg2'/>
			<br> 
			<input type="submit" value="전송">
		</form>
</div>
</body>
</html>