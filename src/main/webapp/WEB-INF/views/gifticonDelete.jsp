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

    <title>헝픽 관리자 페이지</title>
    
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
	$(document).ready(function() {
		
		$(".col .btn").click(function() {

			var result = confirm("삭제하시겠습니까?");
			if(result) {
				alert("삭제되었습니다");
				var a = $(this).attr("id");
				const filePath = "gifticon";
				const fileName = $(".img"+a).attr("value");
				
				const formData = new FormData();
				formData.append("filePath", filePath);
				formData.append("fileName", fileName);
				
				$.ajax({
					type : "POST",
					url : "fileDelete.do",
					processData : false,
					contentType : false,
					data : formData,						
					success : function(response) {
						$("#form"+a).submit();
					},
					error : function(jqXHR) {
						alert(jqXHR.responseText); 
					}
				});
			} else {
				return false;
			}	
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

			<!-- Nav Item - Dashboard -->
			<li class="nav-item">
				<a class="nav-link" href="adminPage">
					<i class="fas fa-fw fa-cog"></i> 
					<span>관리자 페이지</span>
				</a>
			</li>
			
 			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Menu" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-wrench"></i> <span>메뉴</span>
				</a>
				<div id="Menu" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="">메뉴 등록</a> 
						<a class="collapse-item" href="">메뉴 수정</a> 
						<a class="collapse-item" href="">메뉴 삭제</a>
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
						<a class="collapse-item" href="">브랜드 등록</a> 
						<a class="collapse-item" href="">브랜드 수정</a> 
						<a class="collapse-item" href="">브랜드 삭제</a>
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
						<a class="collapse-item" href="noticeinsertN">공지사항 등록</a>
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
			<li class="nav-item active">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#Gifticon" aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-wrench"></i> <span>기프티콘</span>
				</a>
				<div id="Gifticon" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="gifticonList">기프티콘 조회</a> 
						<a class="collapse-item" href="gifticonInsert">기프티콘 등록</a> 
						<a class="collapse-item" href="gifticonUpdate">기프티콘 수정</a> 
						<a class="collapse-item" href="gifticonDelete">기프티콘 삭제</a> 
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
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
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
                    <h1 class="h3 mb-4 text-gray-800">관리자 기능 : 기프티콘 삭제</h1>
                    
                    <!-- Content Row -->
                    <div class="row">
                    	<c:choose>
							<c:when test="${not empty gifticonList}">
								<c:forEach var="gift" items="${gifticonList}">
									<div class="col-xl-3 col-md-6 mb-4">
										<div class="card border-left-primary shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<form id="formbtn${gift.gifticonCode}" action="gifticonDeleteSubmit" method="post">
															<input type="hidden" value="${gift.gifticonCode}" name="gifticonCode">
															<input type="hidden" class="imgbtn${gift.gifticonCode}" value="${gift.gifticonImg}" name="gifticonImg">
															<input type="hidden" value="${gift.gifticonName}" name="gifticonName">
															<input type="hidden" value="${gift.gifticonPrice}" name="gifticonPrice">
															<input type="hidden" value="${gift.brandCode}" name="brandCode">
															<input type="hidden" value="${gift.menuCode}" name="menuCode">
														</form>
														<div class="h2 font-weight-bold text-primary">
															<c:out value="${gift.gifticonName}" />
														</div>
														<div class="h4 mb-0 font-weight-bold text-gray-800">
															<c:out value="${gift.gifticonPrice} 포인트" />
														</div>
														<img src="<c:url value='${gift.gifticonImg}' />" alt="${gift.gifticonImg}" height="270" width="270" /><br>
														<input type="button" class="btn btn-primary" id="btn${gift.gifticonCode}" value="삭제">
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