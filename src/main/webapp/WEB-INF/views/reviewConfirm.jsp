<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>헝픽</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
    <script>
			function confirm(){
					
			 var brandCode = $("input[name='brandCode']").val();
			 var menuCode = $("input[name='menuCode']").val();	
			 var reviewCode = $("input[name='reviewCode']").val();
			 var memberCode = $("input[name='memberCode']").val();
			 
			 console.log(brandCode);
			 console.log(menuCode);
			 console.log(reviewCode);
			 console.log(memberCode);
			
			$.ajax({
				type: 'POST',
				url: 'confirmReview.do',
				async: false,
				data: {"brandCode" : brandCode,"menuCode" : menuCode,"reviewCode" : reviewCode,"memberCode" : memberCode },
				dataType: "json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(jdata){
						alert("승인되었습니다.")
					}, 
				error: function(request, status, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("지금은 시스템 사정으로 요청하신 작업을 처리할 수 없습니다.");
					return;
				}
			});
		};				
 </script>
</head>

<body>
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	<!-- 사이드바 -->
	<jsp:include page="PageSide.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
	<!-- 상단 -->
	<jsp:include page="PageHeader.jsp" flush="false"/>
					
		<!-- 메인 -->
		<div id="content">
			<div align="center">
			
				<table border="1">
					<tr>
						<td width=80>회원코드</td>
						<td width=40>점수</td>
						<td width=100>리뷰날짜</td>
						<td width=150>내용</td>
						<td width=120>리뷰보기</td>	
						<td width=60>승인</td>
					</tr>
				
				<c:forEach var="review" items="${review}">
				<input name="memberCode" type="hidden" value="${review.memberCode}" />
				<input name="reviewCode" type="hidden" value="${review.reviewCode}" />
				<input name="brandCode" type="hidden" value="${review.brandCode}" />
				<input name="menuCode" type="hidden" value="${review.menuCode}" />		
					<tr>
						<td><c:out value="${review.memberCode}" /></td>
						<td><c:out value="${review.reviewScore}" /></td>
						<td><c:out value="${review.reviewDate}" /></td>
						<td><c:out value="${review.reviewContent}" /></td>
							
							<c:url value="reviewLookup" var="reviewLookup">
							<c:param name="brandCode" value="${review.brandCode}"/>
							<c:param name="menuCode" value="${review.menuCode}" />
							<c:param name="reviewCode" value="${review.reviewCode}" />
							<c:param name="memberCode" value="${review.memberCode}" />
						</c:url>
						<td><a href="${reviewLookup}">상세 리뷰 보기</a></td>
						<td><button onclick="confirm( )">승인</button></td>	
					</tr>										
				</c:forEach>
				</table>
				
			</div>
		</div>
		<!-- 메인 컨텐츠 끝 -->
			
	<!-- 하단 -->
	<jsp:include page="PageFooter.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 끝 -->
	</div>
	<!-- 페이지 Wrapper 끝 -->
	</div>
	<!-- 페이지 상단 버튼 -->
	<jsp:include page="PageTopBtn.jsp" flush="false"/>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>	
</body>
</html>