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
    
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
	function inputCheck(){
		
		if(
			$("input:checkbox[name='brandCode']").is(":checked") == false &&
			$("input:checkbox[name='menuIngredients']").is(":checked") == false &&
			$("input[name='menuPrice']").val().trim() == '' &&
			$("input[name='menuName']").val().trim() == ''
		)
			{
				alert("검색 조건을 입력해주세요");
				return false;
			};
	}
	
	var menuPriceHigh = function(url){
		
		$.ajax({
			type: 'get',
			url: 'menuPriceHigh.do',
			data: "",
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data){
				$('#menu_list').html(data)
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	
	var menuPriceLow = function(url){
		
		$.ajax({
			type: 'get',
			url: 'menuPriceLow.do',
			data: "",
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data){
				$('#menu_list').html(data)
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	
	$(document).ready(function(){
		$("form").submit(function() {		
			inputCheck();
		
		});
		$("#menuHighPrice").click(function(){
			menuHighPrice();
		});
		$("#menuLowPrice").click(function(){
			menuLowPrice();
		});
	});
</script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
    
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="main">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">메인 페이지</div>
			</a>
			
			
		
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
			
 			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Menu" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-wrench"></i> <span>메뉴</span>
				</a>
				<div id="Menu" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="menu">메뉴 검색</a> 
					</div>
				</div>
			</li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Brand" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-wrench"></i> <span>브랜드</span>
				</a>
				<div id="Brand" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="brand">브랜드 검색</a> 
					</div>
				</div>
			</li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Notice" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-wrench"></i> <span>공지사항</span>
				</a>
				<div id="Notice" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="AdminNoticelist">공지사항 조회</a>
					</div>
				</div>
			</li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#QnA" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-wrench"></i> <span>질문과 답변</span>
				</a>
				<div id="QnA" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="Nconfirm">질문과 답변</a> 
					</div>
				</div>
			</li>
			
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Gifticon" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-wrench"></i> <span>이달의 기프티콘</span>
				</a>
				<div id="Gifticon" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="gifticonListUser">기프티콘 조회</a> 
					</div>
				</div>
			</li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow d-flex align-items-center justify-content-center">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                    	<c:choose>
                    		<c:when test="${loginBool eq true}">
                    			<c:choose>
                    				<c:when test="${not empty adminDTO}">
										<li class="nav-item dropdown no-arrow">
										<input class="btn btn-primary" type="button" id="userDropdown" value="${adminDTO.adminName}"data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										
										<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
										<a class="dropdown-item" href="adminPage">
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 관리자 페이지
										</a>
										
										<a class="dropdown-item" href="userMyInfo">
										<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 마이페이지
										</a>
										
										<div class="dropdown-divider"></div>
										
										<a class="dropdown-item" href="userLogout">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
										</a>
										</div>
										</li>
                    				</c:when>
                    					
                    				<c:otherwise>
                    					<li class="nav-item dropdown no-arrow">
                        		 		<input class="btn btn-primary" type="button" id="userDropdown" value="${memberDTO.memberName}"data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        		 
                        		 		<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
	                        		 	<a class="dropdown-item" href="userMyInfo">
	                        		 		<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 마이페이지
	                        		 	</a>
	                        		 	
	                        		 	<div class="dropdown-divider"></div>
	                        		 	
	                        		 	<a class="dropdown-item" href="userLogout">
	                        		 		<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
	                        		 	</a>
                        		 		</div>
                        		 		</li>
                    				</c:otherwise>
                    			</c:choose>
                    		</c:when>
                    		
                    		<c:otherwise>
                       		 	<input class="btn btn-primary" type="button" onClick="location.href='userLogin'" value="로그인">
                    		</c:otherwise>
                    	</c:choose>
                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">menu</h1>
                    
                    <!-- Content Row -->
					<div class="row">
						<div align="center">
							검색하고 싶은 메뉴 조건을 입력해주세요.<br>
							<form action="menuResult" id="menuSearch">
								<%-- 체크박스일 경우 값들을 배열로 받아서 처리해야함 --%>
								<br> 브랜드<br>
								<c:forEach var="brand" items="${brand}">
									<input type='checkbox' name='brandCode' value='${brand.brandCode}' />${brand.brandName}
								</c:forEach>
								
								<br> 좋아하는 패티<br>
								<c:forEach var="menuIng" items="${menuIng}">
									<input type='checkbox' name='menuIngredients' value='${menuIng.menuIngredients}' />${menuIng.menuIngredients}
								</c:forEach>
								
								<br> 최대가격<br>
								<input type='number' name='menuPrice' min='0' max='100000' /> <br>
								<br> 이름<br>
								<input type="text" name="menuName">
								
								<input type="submit" value="검색" />
							</form>
							<hr>
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
							<a href="javascript:menuPriceHigh();">높은가격순</a>
							<br>
							<a href="javascript:menuPriceLow();">낮은가격순</a>
							<div id="menu_list">
							<c:forEach var="menu" items="${menu}">
								<c:url value="menuDetail" var="menuDetail">
									<c:param name="brandCode" value="${menu.brandCode}"/>
									<c:param name="menuCode" value="${menu.menuCode}"/>
									<c:param name="menuName" value="${menu.menuName}" />
								</c:url>
								<a href="${menuDetail}">
									<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="270" width="270" />
								</a>
								<p style="font-size: 15pt">
								<a href="${menuDetail}">
									<c:out value="메뉴명: ${menu.menuName}" />
								</a>
								</p>		
								<p style="font-size: 15pt">
									<c:out value="메뉴가격: ${menu.menuPrice}" />
								</p>		
								<hr>
							</c:forEach>
							</div>
						</div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>하단 메뉴</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
</body>

</html>