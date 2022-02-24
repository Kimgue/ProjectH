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

    <title>헝픽 메뉴</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/menu/menu.js"></script>
	
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
			<div class="m-Grid">
				<div class="m-Grid-Search">
		    		<div style="width:750px; height:530px;" class="card shadow ml-3 mt-3 mb-3">
			    		<div class="card-body">
							<h3>검색 조건</h3>
							<form action="menuResult">
								<%-- 체크박스일 경우 값들을 배열로 받아서 처리해야함 --%>
								<div>
								<h5>브랜드</h5>
								</div>
								<div>
									<c:forEach var="brand" items="${brand}">
										<input class="custom-checkbox" type='checkbox' name='brandCode' value='${brand.brandCode}' />
										<label class="form-check-label" for="inlineCheckbox1">${brand.brandName}</label>
									</c:forEach>
								</div>
								<br>
								<div>
								<h5>재료</h5>
								</div>
								<div>
									<c:forEach var="menuIng" items="${menuIng}">
										<input class="custom-checkbox" type='checkbox' name='menuIngredients' value='${menuIng.menuIngredients}' />
										<label class="form-check-label" for="inlineCheckbox1">${menuIng.menuIngredients}</label>
									</c:forEach>
								</div>
								<br>
								<div>
								<h5>최대 가격</h5>
								</div>
								<div style="width:250px;">
									<div class="input-group">
										<input type='number' class="form-control" name='menuPrice' min='0' max='100000' step="100" placeholder="가격을 입력해주세요"/>
										<div class="input-group-append">
											<span class="input-group-text">₩</span>
										</div>
										</div>
								</div>
								<br>
								<div>
								<h5>메뉴이름</h5>
								</div>
								<div style="width:250px;">
									<input type="text" class="form-control" id="menuName" name="menuName">
								</div>
								<br>
								<div>
									<button type="button" class="btn btn-warning" onclick="inputCheck()">검색</button>
								</div>
							</form>
							<br>
							<a href="javascript:menuPriceHigh();"><button type="button" class="btn btn-warning">높은가격순</button></a>
							<a href="javascript:menuPriceLow();"><button type="button" class="btn btn-warning">낮은가격순</button></a>
						</div>
					</div>
				</div>
				<div class="m-Grid-Rank">
					<div style="width:750px; height:530px;" class="card shadow m-3">
						<div class="card-body">
							<div class="h1 text-center mb-3">메뉴 리뷰 점수 순위</div>
							<c:forEach var="rank" items="${ reviewRanking }">
								<c:set var="i" value="${i+1}"/>
								<div class="h4 text-center mb-2">
									<c:out value="${i}" />등
									<c:out value="${rank.brandDto.brandName}" /> - <c:out value="${rank.menuDto.menuName}" />
									<c:out value="${rank.reviewDto.reviewScore}"/>점
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
        	</div>
				<div id="menu_list" class="m-Div text-center">
					<c:forEach var="menu" items="${menu}">
						<div style="width:750px; height:500px;" class="card shadow ml-3 mb-3">
							<div class="card-body">
								<div class="mt-3">
									<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="200" width="200" />
								</div>
								
								<div>
									<div class="h3 font-weight-bolder"><c:out value="${menu.menuName}" /></div>
									<div><c:out value="${menu.menuPrice}"/>원</div>
									<div><c:out value="${menu.menuIngredients}" /></div>
								</div>
								
								<div>
									<div class="font-weight-bold text-gray-800 mt-3">
										<c:out value="${menu.menuDescription}" />
									</div>
								</div>
								<c:url value="menuDetail" var="menuDetail">
									<c:param name="brandCode" value="${menu.brandCode}"/>
									<c:param name="menuCode" value="${menu.menuCode}"/>
									<c:param name="menuName" value="${menu.menuName}" />
								</c:url>
								<div class="mt-5">
									<a class="btn btn-warning" href="${menuDetail}">상세보기</a>
								</div>
							</div>
						</div>
					</c:forEach>
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