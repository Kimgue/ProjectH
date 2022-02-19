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
    
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>	
		$(document).ready(function(){
			
			const inputImage = document.getElementById("noticeImg");
			inputImage.addEventListener("change", e => {readImage(e.target)});
			
			$("#submit").click(function(){
				
				if($("#noticeTitle").val().length == 0)
					{alert("제목을 입력해주세요");
					$("#noticeTitle").focus(); 
						return false;
					}
				
				if($("#noticeContent").val().length == 0)
				{alert("내용을 입력해주세요");
				$("#noticeContent").focus(); 
					return false;
				}
			});
		});
		
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader();
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image");
		            previewImage.src = e.target.result;
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		
	
		// 파일 업로드
		function insert() {
								
			var result = confirm("등록하시겠습니까?");
			if(result) {
				alert("등록되었습니다");
				
				const uploadPath = "G:/rbtjd/WebProject/src/main/webapp/resources/images/NoticeImg";
				
				const imageInput = $("#noticeImg")[0];
				if(imageInput.files.length == 0){
				   $("#noticeInsert").submit();
				} else {
					const formData = new FormData();
					formData.append("uploadFile", imageInput.files[0]);
					formData.append("uploadPath", uploadPath);
					
					$.ajax({
						type : "POST",
						url : "fileUpload.do",
						processData : false,
						contentType : false,
						data : formData,						
						success : function(response) {
							$("#testabc").attr("value","images/NoticeImg/"+response);
							$("#noticeInsert").submit();
						},
						error : function(jqXHR) {
							alert(jqXHR.responseText); 
						}
					});
				}	
			} else {
				return false;
			}
		}
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
                    <h1 class="h3 mb-4 text-gray-800">noticeinsertN</h1>
                    
                    <!-- Content Row -->
                    <div class="row">
						<div id="root">
							<header>
								<h1> 공지사항</h1>
							</header>
							<hr />	 
							<nav>
							  홈 - 공지사항 작성
							</nav>
							<hr />
							
							<section id="container">
								<form role="form" id="noticeInsert" method="post" action="Noticeinsert" encType ="multipart/form-data">
									<table>
										<tbody>
										<thead>
										<tr>
										<th style="background-color: #eeeee; text-align: center;">공지사항 글쓰기 </th>
											</tr>
										</thead>		
											<tr>
												<td>
													<label for="adminCode" id="adminCode">작성자 번호 :${ adminCode }</label>
													<input type="hidden" id="adminCode" name="adminCode" value="${ adminCode }">
													<input type="hidden" id="noticeCode" name="noticeCode" value="noticeCode">
											</tr>	
											<tr>
												<td>
													<label for="noticeTitle">제목 : </label><input type="text" id="noticeTitle" name="noticeTitle" />
												</td>
											</tr>	
											<tr>
												<td>
													<label for="noticeContent">내용 : </label><textarea id="noticeContent" name="noticeContent" ></textarea>
												</td>
											</tr>
											<tr>
												<td> 
													<label for="noticeDate" id="noticeDate">작성날짜 : ${ date }</label>
													<input type="hidden" id="noticeDate" name="noticeDate" value="${ date }">  
												</td>
												</tr>
												<tr>
												<td>
													<input type="hidden" id="noticeImg" name="noticeImg" value="noticeImg">
												
														<input type="file" id="noticeImg" name="uploadfile">
														<img style="width: 100px;" id="preview-image" src="">
														<div class="img"></div>
												</td>
												</tr>
											<tr>
												<td>						
													<!-- <button type="submit" id="submit">작성</button> -->
														<input type="button" value="작성" onclick="insert()">								
												</td>
											</tr>			
										</tbody>			
									</table>
								</form>
							</section>
							<hr />
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