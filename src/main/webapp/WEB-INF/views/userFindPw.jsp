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

    <title>헝픽 비밀번호 찾기</title>
    
	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
	function FindPw() {
		var val_Id = $("#memberId").val();
		if (val_Id == "") {
			$("#memberId").focus();
			$("#resultId").text("아이디를 입력해주세요").css("color", "red");
			return;
		} else {
			var url = "chkId.do";

			$.getJSON(url, {
				"id" : val_Id
			}, function(json) {
				var result_text = json.result;
				var result = eval(result_text);

				if (result) {
					$("#resultId").text("아이디를 찾을 수 없습니다").css("color", "red");
					$("#memberId").val("");
					$("#memberId").focus();
				} else {
					$("#FindPw").submit();
				}
			});
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
                                    <div>
                                        <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
                                        <p class="mb-4">비밀번호를 찾고자 하는 아이디를 입력해주세요</p>
                                    </div>
                                    
                                    <form id="FindPw" action="userFindPwSubmit" method="post">
                                    	<div class="inputHeight">
											<input type="text" class="form-control col-9" id="memberId" name="memberId" placeholder="아이디">
											<a href="#" class="btn btn-primary btnMarginTop" onclick="FindPw()">
		                            			<i class="fas fa-check"></i>
		                           			</a>
		                            		<div id="resultId" class="result-text"></div>   
		                            	</div>
                                    </form>
                                    <p class="text-center text-danger">${wrongNotice}</p>
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