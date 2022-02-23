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
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/menu/menu.js"></script>
    
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
			<div class="layout">
			    <article>
			    	
			    		<div class="card shadow ml-3 mt-3 mb-3">
				    		<div class="card-body">
							검색 조건
								<form action="menuResult" id="menuSearch">
									<%-- 체크박스일 경우 값들을 배열로 받아서 처리해야함 --%>
									<div>
									브랜드
									</div>
									<div>
										<c:forEach var="brand" items="${brand}">
											<input class="custom-checkbox" type='checkbox' name='brandCode' value='${brand.brandCode}' />${brand.brandName}
										</c:forEach>
									</div>
									
									<div>
									재료
									</div>
									<div>
										<c:forEach var="menuIng" items="${menuIng}">
											<input type='checkbox' name='menuIngredients' value='${menuIng.menuIngredients}' />${menuIng.menuIngredients}
										</c:forEach>
									</div>
									
									<div>
									최대 가격
									</div>
									<div>
										<input type='number' id="menuPrice" name='menuPrice' min='0' max='100000' /> <br>
									</div>
									
									<div>
									이름
									</div>
									<div>
										<input type="text" id="menuName" name="menuName">
									</div>
									
									<div>
										<input id="menuSearchForm" type="button" value="검색" />
									</div>
								</form>
							</div>
						</div>
						<div class="flexbox">
			            <div class="item">
							<c:forEach var="menu" items="${menu}">
								<div class="card shadow ml-3 mb-3">
									<div style="width:700px; height:300px;" class="card-body">
										<div class="menu-grid">
											<div class="menuImg mt-3">
												<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="200" width="200" />
											</div>
											
											<div class="menuTitle">
												<div class="h3 font-weight-bolder"><c:out value="${menu.menuName}" /></div>
												<div><c:out value="${menu.menuPrice}"/>원</div>
												<div><c:out value="${menu.menuIngredients}" /></div>
											</div>
											
											<div class="menuDescription">
												<div class="font-weight-bold text-gray-800 mt-3">
													<c:out value="${menu.menuDescription}" />
												</div>
											</div>
										<c:url value="menuDetail" var="menuDetail">
											<c:param name="brandCode" value="${menu.brandCode}"/>
											<c:param name="menuCode" value="${menu.menuCode}"/>
											<c:param name="menuName" value="${menu.menuName}" />
										</c:url>
										<div class="menuReview">
										<a class="h4" href="${menuDetail}">리뷰</a>
										</div>
									</div>										
								</div>
							</div>
						</c:forEach>
		            </div>
		        </div>
			    </article>
			    <aside>
					<div class="card shadow mt-3 mb-3 mr-3">
						<div class="card-body">
							<h4>메뉴 리뷰 점수순위</h4>
							
							<div>1</div>
							<div>2</div>
							<div>3</div>
							<div>4</div>
							<div>5</div>
							<div>6</div>
							<div>7</div>
							<div>8</div>
							<div>9</div>
							<div>10</div>
						</div>
					</div>
			    </aside>
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