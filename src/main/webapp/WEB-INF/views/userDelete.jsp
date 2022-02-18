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

    <title>헝픽 회원탈퇴</title>
    
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="resources/css/user.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
	function userDelete() {
		var chk = $("#userDelChk").val();
		if(chk != "회원탈퇴") {
			alert("잘못된 입력입니다")
		} else {
			var chkFinal = confirm("정말 탈퇴하시겠습니까?");
			
			if(chkFinal == true) {
				$("#userDelete").submit();
			}
		}
	}
</script>
</head>

<body class="bg-gradient-primary">

	<header class="d-flex align-items-center justify-content-center">
			<div class="card border-0 my-5 text-center bg-transparent">
				<a href="main" class="text-decoration-none">
                	<h1 class="font-weight-bolder text-warning">HUNGPICK</h1>
            	</a>
			</div>
    </header>header>

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">회원탈퇴</h1>
                                        <p class="mb-4">회원탈퇴를 진행하시려면 '회원탈퇴'를 입력하고 탈퇴 버튼을 눌러주세요</p>
                                    </div>
                                    
                                    <form id="userDelete" action="userDeleteSubmit" method="post">                                        
                                        <div class="form-group row">
		                            		<div class="col-sm-9">
		                            			<input type="text" class="form-control form-control-user" id="userDelChk" placeholder="회원탈퇴를 입력해주세요">
		                            		</div>
		                            		
		                            		<div class="form-inline">
			                            		<a href="#" class="form-control btn btn-primary" onclick="userDelete()">
		                                        	<i class="fas fa-check"></i>
		                                    	</a>
			                            	</div>
				                        </div>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="main">메인페이지</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
</body>

</html>