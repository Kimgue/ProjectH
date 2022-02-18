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

    <title>헝픽 아이디 찾기</title>
    
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
	var passwdCheck = RegExp(/^[A-Za-z0-9]{8,16}$/);
	
	function FindPw() {
		var pw = $("#memberPw").val();
		var pwchk = $("#memberPwChk").val();
		
		if(pw == "" || pwchk == "") {
			alert("변경할 비밀번호를 입력해주세요");
			return;
		} else if(pw == pwchk){
			if(passwdCheck.test($('#memberPw').val())) {
				alert("비밀번호가 변경되었습니다");
				$("#FindPw").submit();
			} else {
				alert("형식에 맞지 않는 비밀번호입니다");
			}
	
		} else {
			alert("변경할 비밀번호가 다릅니다");
			return;
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
    </header>

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
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호 변경</h1>
                                        <p class="mb-4">비밀번호를 변경해주세요</p>
                                    </div>
                                    
                                    <form id="FindPw" action="userFindPwUpdate" method="post">                                        
                                        <div class="form-group">
		                            		<div class="col-sm-11">
		                            			<input type="password" class="form-control form-control-user" id="memberPw" name="memberPw" placeholder="변경할 비밀번호를 입력해주세요">
		                            		</div>
				                        </div>

                                        <div class="form-group">
		                            		<div class="col-sm-11">
		                            			<input type="password" class="form-control form-control-user" id="memberPwChk" placeholder="변경할 비밀번호를 확인해주세요">
		                            		</div>
				                        </div>
				                        <hr>
                                        <div class="form-group">
		                            		<div class="col-sm-11">
		                            			<input type="button" class="btn btn-primary btn-user btn-block" value="비밀번호 변경" onclick="FindPw()">
		                            		</div>
		                            		
				                        </div>					                        				                        
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="userFindId">아이디를 찾으시나요?</a>
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