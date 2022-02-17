<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 작성</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
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
			리뷰이미지1:
			<img style="width: 100px;" id="preview-image" src="" />
			<input type="hidden" id="reviewImg1" name="reviewImg1" /> 
			<input type="file" id="input-image" name="uploadfile" required />
			<br> 
			리뷰이미지2:
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