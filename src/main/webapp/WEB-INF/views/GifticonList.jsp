<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.head{
		text-align: center;
		color:tomato;
	}
	
</style>
</head>
<body>
	<header class="head">
		<h1> 기프티콘 페이지</h1>
	</header>
		<div class="container">
		  <div class="heading_container heading_center">
			<h2>
			  Our Gifticon
			</h2>
		  </div>
		  <hr>
	<c:forEach var="gift" items="${ gifticonlist }">			
			<p>
			<img src="<c:out value="resources/${gift.gifticonImg }" />" alt="제품 이미지" height="150" width="150" />
			</p>
			<p>
			<c:out value="${gift.gifticonName}" /> 
			</p>
			<p>
			<c:out value="${gift.gifticonPrice}" />
			</p>
			<a href="#">
				<input type="button" value="교환">
			</a>	
		</c:forEach>
	</div>
</body>
</html>