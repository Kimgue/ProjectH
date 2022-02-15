<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 소개</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>

function inputCheck(){
	
	if(
		 $("input:checkbox[name='brandCode']").is(":checked") == false &&
		 $("input:checkbox[name='menuIngredients']").is(":checked") == false &&
		 $("input[name='menuPrice']").val().trim() == '' &&
		 $("input[name='menuName']").val().trim() == ''
	)
			{
				 alert("검색 조건을 입력해주세요");
				 return false;
			};
	
}

var menuPriceHigh = function(url){
	
	
	$.ajax({
			type: 'get',
			url: 'menuPriceHigh.do',
			data: "",
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data){
				$('#menu_list').html(data)
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	});
};

var menuPriceLow = function(url){
	
	
	$.ajax({
			type: 'get',
			url: 'menuPriceLow.do',
			data: "",
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data){
				$('#menu_list').html(data)
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	});
};


	$(document).ready(function(){
		$("form").submit(function() {		
			inputCheck();
		
		});
		$("#menuHighPrice").click(function(){
			menuHighPrice();
		});
		$("#menuLowPrice").click(function(){
			menuLowPrice();
		});
});
	

</script>
<style>
hr {  
  width: 400px;
}
</style>
</head>
<body>
	<div align="center">
		<h1>메뉴</h1>
		<br> <a href="">메인 페이지로</a><br> 검색하고 싶은 메뉴 조건을 입력해주세요.<br>
		<form action="menuResult" id="menuSearch">
			<%-- 체크박스일 경우 값들을 배열로 받아서 처리해야함 --%>
			<br> 브랜드<br> 
			<c:forEach var="brand" items="${brand}">
			<input type='checkbox' name='brandCode' value='${brand.brandCode}' />${brand.brandName}
			</c:forEach>
			<br> 좋아하는 패티<br> 
			<c:forEach var="menuIng" items="${menuIng}">
			<input type='checkbox' name='menuIngredients' value='${menuIng.menuIngredients}' />${menuIng.menuIngredients}
			</c:forEach>
			<br> 최대가격<br>
			<input type='number' name='menuPrice' min='0' max='100000' /> <br>
			<br> 이름<br>
			<input type="text" name="menuName">
			
			<input type="submit" value="검색" />
		</form>
		<hr>
		<h4>메뉴 리뷰 점수순위</h4>
		<c:forEach var="rank" items="${ reviewRanking }">
			<c:set var="i" value="${i+1}"/>
			<tr>
				<td><c:out value="${i}" />등</td>
				<td><c:out value="${rank.brandDto.brandName}" /></td>
				<td><c:out value="${rank.menuDto.menuName}" /></td>
				<td><c:out value="${rank.reviewDto.reviewScore}"></c:out>
			</tr>
			<br>
		</c:forEach>
		<hr>
		<a href="javascript:menuPriceHigh();">높은가격순</a>
		<br>
		<a href="javascript:menuPriceLow();">낮은가격순</a>
		<div id="menu_list">
		<c:forEach var="menu" items="${menu}">
			<c:url value="menuDetail" var="menuDetail">
					<c:param name="brandCode" value="${menu.brandCode}"/>
					<c:param name="menuCode" value="${menu.menuCode}"/>
					<c:param name="menuName" value="${menu.menuName}" />
			</c:url>
			<a href="${menuDetail}">
			<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="270" width="270" />
			</a>
			<p style="font-size: 15pt">
			<a href="${menuDetail}">
				<c:out value="메뉴명: ${menu.menuName}" />
			</a>
			</p>		
			<p style="font-size: 15pt">
				<c:out value="메뉴가격: ${menu.menuPrice}" />
			</p>		
			<hr>
		</c:forEach>
		</div>
	</div>
</body>
</html>