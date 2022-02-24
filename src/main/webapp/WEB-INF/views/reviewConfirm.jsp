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

    <title>헝픽 리뷰 검토</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
	function confirm() {
		var brandCode = $("input[name='brandCode']").val();
		var menuCode = $("input[name='menuCode']").val();
		var reviewCode = $("input[name='reviewCode']").val();
		var memberCode = $("input[name='memberCode']").val();
		
		$.ajax({
			type: 'POST',
			url: 'confirmReview.do',
			async: true,
			data: {"brandCode" : brandCode,"menuCode" : menuCode,"reviewCode" : reviewCode,"memberCode" : memberCode },
			dataType: "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(jdata){
					alert(jdata.memberNickname + "님의 포인트가 "+ jdata.holdPoint+"점이 되었습니다.")
					document.location.href = document.location.href;
				}, 
			error: function(request, status, error){
				alert("지금은 시스템 사정으로 요청하신 작업을 처리할 수 없습니다.");
				return;
			}
		});
	};	
	
	function confirmNo() {
		var brandCode = $("input[name='brandCode']").val();
		var menuCode = $("input[name='menuCode']").val();
		var reviewCode = $("input[name='reviewCode']").val();
		var memberCode = $("input[name='memberCode']").val();
		
		$.ajax({
			type: 'POST',
			url: 'confirmNoReview.do',
			async: true,
			data: {"brandCode" : brandCode,"menuCode" : menuCode,"reviewCode" : reviewCode,"memberCode" : memberCode },
			dataType: "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(jdata){
					alert(jdata.memberNickname + "님의 리뷰를 승인하지 않았습니다.")
					document.location.href = document.location.href;
				}, 
			error: function(request, status, error){
				alert("지금은 시스템 사정으로 요청하신 작업을 처리할 수 없습니다.");
				return;
			}
		});
	};
	</script>
	
</head>

<body id="page-top">
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	<!-- 사이드바 -->
	<jsp:include page="AdminPageSide.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
	<!-- 상단 -->
	<jsp:include page="PageHeader.jsp" flush="false"/>
					
		<!-- 메인 -->
		<div id="content">
			<div class="w-100">
				<div style="width:1660px;" class="card shadow m-3">
					<div class="card-body">
						<div class="h1 mb-3">
							리뷰 승인
						</div>
						<c:choose>
								<c:when test="${not empty review}">
									<table id="menuReview" class="table text-center">
										<thead>
										<tr>
											<th width="100">회원코드</th>
											<th width="80">점수</th>
											<th width="200">리뷰날짜</th>
											<th>내용</th>
											<th width="150">리뷰보기</th>	
											<th width="100">승인</th>
											<th width="100">취소</th>
										</tr>
										</thead>
										<tbody>
											<c:forEach var="review" items="${review}">	
												<tr>
													<td style="vertical-align : middle;"><c:out value="${review.memberCode}" /></td>
													<td style="vertical-align : middle;"><c:out value="${review.reviewScore}" /></td>
													<td style="vertical-align : middle;"><c:out value="${review.reviewDate}" /></td>
													<td style="vertical-align : middle;"><c:out value="${review.reviewContent}" /></td>
														<c:url value="reviewLookup" var="reviewLookup">
															<c:param name="brandCode" value="${review.brandCode}"/>
															<c:param name="menuCode" value="${review.menuCode}" />
															<c:param name="reviewCode" value="${review.reviewCode}" />
															<c:param name="memberCode" value="${review.memberCode}" />
														</c:url>											
													<td style="vertical-align : middle;"><a href="${reviewLookup}">상세 리뷰</a></td>
													<td style="vertical-align : middle;"><button class="btn btn-warning" onclick="confirm( )">승인</button></td>
													<td style="vertical-align : middle;"><button class="btn btn-warning" onclick="confirmNo( )">취소</button></td>		
												</tr>
												<input name="memberCode" type="hidden" value="${review.memberCode}" />
												<input name="reviewCode" type="hidden" value="${review.reviewCode}" />
												<input name="brandCode" type="hidden" value="${review.brandCode}" />
												<input name="menuCode" type="hidden" value="${review.menuCode}" />
											</c:forEach>
										</tbody>
									</table>								
								</c:when>
								
								<c:otherwise>
									<div class="h4 text-center">등록된 리뷰가 없습니다</div>
								</c:otherwise>
						</c:choose>
					</div>
				</div>
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
	
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
    
</body>
</html>