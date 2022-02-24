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

    <title>헝픽 기프티콘 교환</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/gifticon/gifticonExchange.js"></script>
    
</head>

<body id="page-top">
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
			
			<div class="row align-items-center justify-content-center">
				<c:choose>
					<c:when test="${not empty gifticonList}">
						<div class="mt-5">
							<div class="card shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2 text-center">
											<form id="insertGifticonExchange" action="insertGifticonExchange" method="POST">
												<input type="hidden" id="gifticonCode" name="gifticonCode" value="${gifticonList.gifticonCode}" />
												<input type="hidden" id="memberCode" name="memberCode" value="${memberDTO.memberCode}" />
												<input type="hidden" id="holdPoint" name="holdPoint" value="${memberDTO.holdPoint}" />
												<input type="hidden" id="gifticonImg" name="gifticonImg" value="${gifticonList.gifticonImg}" />
												<input type="hidden" id="gifticonName" name="gifticonName" value="${gifticonList.gifticonName}" />
												<input type="hidden" id="gifticonPrice" name="gifticonPrice" value="${gifticonList.gifticonPrice}" />
												<input type="hidden" id="brandCode" name="brandCode" value="${gifticonList.brandCode}" />
												<input type="hidden" id="menuCode" name="menuCode" value="${gifticonList.menuCode}" />
												<input type="hidden" id="gifticonExcode" name="gifticonExcode" />
												<input type="hidden" id="gifticonNumber" name="gifticonNumber" />
												
												<div class="h2 font-weight-bold m-3">
													<c:out value="${gifticonList.gifticonName}" /><br>
												</div>
												 
												<div class="h4 mb-0 font-weight-bold text-gray-800 m-3">
													<c:out value="${gifticonList.gifticonPrice}" /> 포인트<br>
												</div>
												
												<img src="<c:url value='${gifticonList.gifticonImg}' />" alt="${gifticonList.gifticonImg}" height="270" width="270"/><br>
												
												<div class="h4 font-weight-bold text-gray-800 m-3">
													현재 보유 포인트 <c:out value="${memberDTO.holdPoint}" />
												</div>
												<div class="m-3">
													<input type="button" class="form-control btn btn-warning" value="교환" onclick="insertGifticonExchange()">
												</div>

											</form>	

										</div>
									</div>
								</div>
							</div>
						</div>
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
	
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
    
</body>
</html>