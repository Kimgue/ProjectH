<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 소개</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>
jQuery.fn.serializeObject = function() {
    var obj = null;
    try {
        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            var arr = this.serializeArray();
            if (arr) {
                obj = {};
                jQuery.each(arr, function() {
                    obj[this.name] = this.value;
                });
            }//if ( arr ) {
        }
    } catch (e) {
        alert(e.message);
    } finally {
    }
    return obj;
};

function inputCheck(){
	
	if(
			 $("input:checkbox[name='brandName']").is(":checked") == false &&
			 $("input:checkbox[name='menuIngredients']").is(":checked") == false &&
			 $("input[name='menuPrice']").val().trim() == '' &&
			 $("input[name='menuName']").val().trim() == ''
			 )
			{
				 alert("검색 조건을 입력해주세요");
				 return false;
			};
	
}

function getMenuResult(){
    
    var formData = $("#menuSearch").serializeObject();
    
    $.ajax({
    	  type: "POST",
    	  url: "menuResult.do",
    	  data: JSON.stringify(formData),
    	  dataType: "json",
    	  contentType : "application/json; charset=UTF-8",
   		  error: function(){
                 alert("code = "+request.status + "message = " 
                		 + request.responseText +
               		   "error = " + error);
             },
       	  success: function(){
       		  alert(fomData);
       		  }
    	});
}

function output(){
	// Contents 영역 삭제
    $('#container').children().remove();
    // Contents 영역 교체
    $('#container').load('menuResult.jsp #menuResult');
}


$(document).ready(function(){
	alert("ready");
	$("form").submit(function() {
		alert("submit");
		inputCheck();
		getMenuResult();
		output();
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
		<form id="menuSearch">
			<%-- 체크박스일 경우 값들을 배열로 받아서 처리해야함 --%>
			<br> 브랜드<br> 
			<input type='checkbox' name='brandName' value='맥도날드' />맥도날드
			<input type='checkbox' name='brandName' value='롯데리아' />롯데리아 <br>
			<br> 좋아하는 패티<br> 
			<input type='checkbox' name='menuIngredients' value='고기' />고기 
			<input type='checkbox' name='menuIngredients' value='새우' />새우 <br>	
			<br> 최대가격<br>
			<input type='number' name='menuPrice' min='0' max='100000' /> <br>
			<br> 이름<br>
			<input type="text" name="menuName">
			
			<input type="submit" value="검색" />
		</form>
		<hr>
		<div id=container>
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
		<c:forEach var="menu" items="${menu}">
			<a href="#"> 
				<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="270" width="270" />
			</a>
			<p style="font-size: 15pt">
				<c:out value="메뉴명: ${menu.menuName}" />
			</p>
			<p style="font-size: 15pt">
				<c:out value="메뉴가격: ${menu.menuPrice}" />
			</p>
			<p style="font-size: 12pt">
				<c:out value="메뉴설명: ${menu.menuDescription}" />
			</p>
			<p style="font-size: 12pt">
				<c:out value="메뉴재료: ${menu.menuIngredients}" />
			</p>
			<hr>
		</c:forEach>
		</div>
	</div>
</body>
</html>