<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 소개</title>
<style>
hr {  
  width: 400px;
}
</style>
</head>
<body>
	<div align="center">
		<h1>메뉴</h1>
		<br> <a href="">메인 페이지로</a><br> 검색하고 싶은 메뉴 이름을 써주세요 <br>
		<form action="menuResult" method="post">
			<%-- 체크박스일 경우 값들을 배열로 받아서 처리해야함 --%>
			<br> 브랜드<br> <input type='radio' name='brandName'
				value='맥도날드' />맥도날드 <input type='radio' name='brandName'
				value='롯데리아' />롯데리아 <br>
			<br> 최대가격<br> <input type='number' name='menuPrice' min='0'
				max='100000' /> <br>
			<br> 좋아하는 패티<br> <input type='radio' name='menuIngredients'
				value='고기' />고기 <input type='radio' name='menuIngredients'
				value='새우' />새우 <br>
			<br> 이름<br> <input type="text" name="menuName"> <input
				type="submit" value="검색">
		</form>
		<div class="container">
			<c:forEach var="menu" items="${menu}">
				<a href="#"> 
					<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="270" width="270" />
				</a>
				<p style="font-size: 15pt">
					<c:out value="${menu.menuName}" />
				</p>
				<p style="font-size: 15pt">
					<c:out value="${menu.menuPrice}" />
				</p>
				<p style="font-size: 12pt">
					<c:out value="${menu.menuDescription}" />
				</p>
				<p style="font-size: 12pt">
					<c:out value="${menu.menuIngredients}" />
				</p>
				<hr>
			</c:forEach>
		</div>
	</div>
</body>
</html>