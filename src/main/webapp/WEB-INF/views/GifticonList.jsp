<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	li{
		list-style: none;
	}
	h2{
		text-align: center;
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
	<c:forEach var="gift" items="${gifticonlist}">
			<p>
			<c:out value="${gift.name}" /> 
			</p>
			<p style="font-size: 15pt">
				<c:out value="${gift.gifticonImg}" />
			</p>
			<p style="font-size: 15pt">
				<c:out value="${gift.gifticonPrice}" />
			</p>
			
			<hr>
		</c:forEach>
	</div>
</body>
</html>