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
	function dateFormat(date) {
	    let month = date.getMonth() + 1;
	    let day = date.getDate();
	    let hour = date.getHours();
	    let minute = date.getMinutes();
	    let second = date.getSeconds();
	
	    month = month >= 10 ? month : '0' + month;
	    day = day >= 10 ? day : '0' + day;
	    hour = hour >= 10 ? hour : '0' + hour;
	    minute = minute >= 10 ? minute : '0' + minute;
	    second = second >= 10 ? second : '0' + second;
	
	    return date.getFullYear() + '년 ' + month + '월 ' + day + '일 ';
	}
	
	$(document).ready(function() {
		var abc = $("#gifticonDate:first").val();
		var month = new Date(abc);
		var currentMonth = dateFormat(month);
		month.setMonth(month.getMonth() +1);
		var nextMonth = dateFormat(month);
		
		$("#currentMonth").text(currentMonth);
		$("#nextMonth").text(nextMonth);
		
		$(".btn").click(function() {
			var code = $(this).attr("id").substring(3);
			<c:choose>
				<c:when test="${loginBool eq true}">
					$("#form"+code).submit();
				</c:when>
				<c:otherwise>
					alert("로그인이 필요합니다");
					document.location.href = "userLogin";
				</c:otherwise>
			</c:choose>
			});
		});	
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
			
			<div class="row justify-content-center">
				<c:choose>
					<c:when test="${not empty gifticonList}">
						<c:forEach var="gift" items="${gifticonList}">
							<div class="card shadow h-100 py-2 m-3">
								<div class="card-body">
									<div class="col text-center">
										<form id="form${gift.gifticonCode}" action="gifticonExchange" method="POST">
											<div class="h2 font-weight-bold text-primary m-3">
												<input type="hidden" id="gifticonCode" name="gifticonCode" value="${gift.gifticonCode}">
												<c:out value="${gift.gifticonName}" />
											</div>
											<div class="h4 font-weight-bold text-gray-800 m-3">
												<c:out value="${gift.gifticonPrice}" /> 포인트
											</div>
												<img class="m-3" src="<c:url value='${gift.gifticonImg}' />" alt="${gift.gifticonImg}" height="270" width="270" /><br>
										</form>	
											<c:if test="${empty adminDTO}">
												<div class="m-3">
													<input type="button" class="form-control btn btn-primary" id="btn${gift.gifticonCode}" value="교환">
												</div>
											</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
	
					<c:otherwise>
						<div class="h2 font-weight-bold text-primary">현재 등록된 기프티콘이 없습니다</div>
					</c:otherwise>
				</c:choose>
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