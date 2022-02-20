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
	<script src="resources/js/brand/brandDelete.js"></script>
    
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
				<c:when test="${not empty brand}">
					<c:forEach var="brand" items="${brand}">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<form id="formbtn${brand.brandCode}" action="deleteBrand" method="post">
												<input type="text" value="${brand.brandCode}" name="brandCode">
												<input type="text" class="imgbtn${brand.brandCode}" value="${brand.brandImg}" name="brandImg">
											</form>
											<div class="h2 font-weight-bold text-primary">
												<c:out value="${brand.brandName}" />
											</div>
											<img src="<c:url value='${brand.brandImg}' />" alt="${gift.brandImg}" height="270" width="270" /><br>
											<input type="button" class="btn btn-primary" id="btn${brand.brandCode}" value="삭제">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div class="h2 font-weight-bold text-primary">현재 등록된 브랜드가 없습니다</div>
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