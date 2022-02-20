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
	<script src="resources/js/gifticon/gifticonUpdate.js"></script>
    
</head>

<body>
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
			<c:choose>
				<c:when test="${not empty gifticonList}">
					<c:forEach var="gift" items="${gifticonList}">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<form id="form${gift.gifticonCode}" action="gifticonUpdatePage" method="post">
												<input type="hidden" value="${gift.gifticonCode}" name="gifticonCode">
												<input type="hidden" value="${gift.gifticonImg}" name="gifticonImg">
												<input type="hidden" value="${gift.gifticonName}" name="gifticonName">
												<input type="hidden" value="${gift.gifticonPrice}" name="gifticonPrice">
												<input type="hidden" value="${gift.brandCode}" name="brandCode">
												<input type="hidden" value="${gift.menuCode}" name="menuCode">
												<div class="h2 font-weight-bold text-primary">
													
													<c:out value="${gift.gifticonName}" />
												</div>
												<div class="h4 mb-0 font-weight-bold text-gray-800">
													<c:out value="${gift.gifticonPrice} 포인트" />
												</div>
												<img src="<c:url value='${gift.gifticonImg}' />" alt="${gift.gifticonImg}" height="270" width="270" /><br>
												<input type="button" class="btn" id="btn${gift.gifticonCode}" value="수정">
											</form>
										</div>
									</div>
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