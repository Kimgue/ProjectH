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

    <title>헝픽 회원가입</title>
    
	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/user/userSignUp.js"></script>
	
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
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div>
                                <h1 class="h2 mb-4">회원가입</h1>
	                            <form class="user" id="UserSignUp" action="userSignUpSubmit" method="post">
	                            	
	                            	<div class="inputHeight">
		                            	<input type="text" class="form-control col-9" id="memberId" name="memberId" placeholder="아이디">
		                            	<div id="resultId" class="result-text"></div>
	                            	</div>

	                            	<div class="inputHeight">
		                            	<input type="password" class="form-control col-9" id="memberPw" name="memberPw" placeholder="비밀번호">
		                            	<div id="resultPw" class="result-text"></div>
	                            	</div>                        	

	                            	<div class="inputHeight">
	                            		<input type="text" class="form-control col-9" id="memberName" name="memberName" placeholder="이름">
	                            		<div id="resultName" class="result-text"></div>
	                            	</div>	

	                            	<div class="inputHeight">
	                            		<input type="text" class="form-control col-9" id="memberNickname" name="memberNickname" placeholder="닉네임">
	                            		<div id="resultNickname" class="result-text"></div>   
	                            	</div>

	                            	<div class="inputHeight">
										<input type="text" class="form-control col-9" id="memberEmail" name="memberEmail" placeholder="이메일을 입력해주세요">
										<a href="#" id="Email_Transmit" class="btn btn-warning btnMarginTop">
	                            			<i class="fas fa-solid fa-envelope"></i>
	                           			</a>
	                            		<div id="resultEmail" class="result-text"></div>   
	                            	</div>
	                            	
	                            	<div id="EmailChk">
	                            	<div class="inputHeight">
										<input type="text" class="form-control col-9" id="Email_Number" placeholder="인증번호 입력">
		                            	<a href="#" id="Email_Check" class="btn btn-warning btnMarginTop">
		                            		<i class="fas fa-check"></i>
		                           		</a>
		                           		<div id="resultEmailChk" class="result-text"></div> 
	                            	</div>
	                            	</div>

	                            	<div class="inputHeight">
										<input type="text" class="form-control col-9" id="memberNumber" name="memberNumber" placeholder="전화번호를 입력해주세요">
										<a href="#" id="Number_Transmit" class="btn btn-warning btnMarginTop">
	                            			<i class="fas fa-solid fa-envelope"></i>
	                           			</a>
	                            		<div id="resultNumber" class="result-text"></div>   
	                            	</div>
	                            	
	                            	<div id="NumberChk">
	                            	<div class="inputHeight">
										<input type="text" class="form-control col-9" id="Number_Number" placeholder="인증번호 입력">
		                            	<a href="#" id="Number_Check" class="btn btn-warning btnMarginTop">
		                            		<i class="fas fa-check"></i>
		                           		</a>
		                           		<div id="resultNumberChk" class="result-text"></div> 
	                            	</div>
	                            	</div>
	                           		<input type="button" class="form-control btn btn-warning" value="회원가입" onclick="UserSignUp()">
	                                <hr>
		                                	
	                            </form>
	                            <div class="text-center">
	                                <a class="small" href="userLogin">이미 회원가입 하셨나요? 로그인</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
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