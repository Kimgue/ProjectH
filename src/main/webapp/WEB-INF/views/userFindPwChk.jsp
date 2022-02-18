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
	var key;
	var validateEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

	function FindPw() {
		var val_Name = $("#memberName").val();
		var val_Email = $("#memberEmail").val();
		var val_EmailNumber = $("#Email_Number").val();
		if(val_Name == "") {
			$("#memberName").focus();
			alert("이름을 입력해주세요");
			return;
		}
		if(val_Email == "") {
			$("#memberEmail").focus();
			alert("이메일을 입력해주세요");
			return;
		}
		
		if(val_EmailNumber == "") {
			$("#Email_Number").focus();
			alert("인증번호를 입력해주세요");
			return;
		} else if(val_EmailNumber == key) {
			$("#FindPw").submit();
		} else {
			alert("잘못된 인증번호입니다");
			return;
		}
	}
	
	$(document).ready(function() {
		$("#Email_Number").attr("value","인증 번호를 입력해주세요");
		$("#Email_Number").prop("readonly",true);
		$("#Email_Transmit").click(function() {
			var val_Email = $("#memberEmail").val();
			if (val_Email == "") {
				alert("이메일 주소를 정확하게 입력해주세요");
			} else if (validateEmail.test($('#memberEmail').val())) {
				var url = "sendEmail.do";
				
				$.getJSON(url, {
					"mail" : val_Email
				}, function(json) {
					alert("인증번호가 전송되었습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요");
					$("#memberEmail").prop("readonly",true);
					$("#Email_Number").prop("readonly",false);
					$("#Email_Number").attr("value","");
					key = json.key;
				});
			} else {
				alert("형식에 맞지 않는 이메일입니다");
			}
		})
	})
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
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
                                        <p class="mb-4">비밀번호를 찾기 위해서는 본인 확인이 필요합니다</p>
                                    </div>
                                    
                                    <form id="FindPw" action="userFindPwChk" method="post">                                        
                                        <div class="form-group row">
		                            		<div class="col-sm-11">
		                            			<input type="text" class="form-control form-control-user" id="memberName" name="memberName" placeholder="이름을 입력해주세요">
		                            		</div>
				                        </div>

                                        <div class="form-group row">
		                            		<div class="col-sm-9">
		                            			<input type="text" class="form-control form-control-user" id="memberEmail" name="memberEmail" placeholder="이메일을 입력해주세요">
		                            		</div>
		                            		
		                            		<div class="form-inline">
			                            		<a href="#" id="Email_Transmit" class="form-control btn btn-primary">
		                                        	<i class="fas fa-solid fa-envelope"></i>
		                                    	</a>
			                            	</div>
				                        </div>

                                        <div class="form-group row">
		                            		<div class="col-sm-9">
		                            			<input type="text" class="form-control form-control-user" id="Email_Number" placeholder="인증번호를 입력해주세요">
		                            		</div>
		                            		
		                            		<div class="form-inline">
			                            		<a href="#" id="Email_Check" class="form-control btn btn-primary" onclick="FindPw()">
		                                        	<i class="fas fa-check"></i>
		                                    	</a>
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