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

    <title>헝픽 보유 기프티콘</title>
    
	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	
</head>

<body class="bg-gradient-light">

	<header class="d-flex align-items-center justify-content-center">
			<div class="card border-0 my-5 text-center bg-transparent">
				<a href="main" class="text-decoration-none">
                	<img src="images/etc/hungpicklogo.png" width="300">
            	</a>
			</div>
    </header>
    
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-5 col-lg-6 col-md-9">
				<div class="card border-0 shadow-lg my-4">
					<c:choose>
						<c:when test="${not empty userVo}">
							<div class="text-center">
								<h1 class="h2 text-gray-900 mt-4 mb-4">보유 기프티콘</h1>
							</div>
							<c:forEach var="userVo" items="${userVo}">
								<div class="card shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2 text-center">
												<img class="m-3" src="<c:url value="${userVo.gifticonDto.gifticonImg}" />" alt="${userVo.gifticonDto.gifticonImg}" height="270" width="270"/> <br>
												<div class="text-primary m-3">
													기프티콘명 : <c:url value="${userVo.gifticonDto.gifticonName}" /> <br>
													기프티콘 번호 : <c:out value="${userVo.gifticonExchangeDto.gifticonNumber}" /> <br>
													기프티콘 교환 날짜 : <c:out value="${userVo.gifticonExchangeDto.gifticonExdate}" /> <br>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>				
						</c:when>
						
						<c:otherwise>
							<div class="text-center">
								<h1 class="h2 text-gray-900 mt-4 mb-4">보유중인 기프티콘이 없습니다</h1>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
    	
</body>
</html>