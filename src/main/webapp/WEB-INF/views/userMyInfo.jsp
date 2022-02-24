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

    <title>헝픽 내 정보</title>
    
	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/user/userMyInfo.js"></script>
	
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
		<div class="row justify-content-center">
			<div class="col-xl-5 col-lg-6 col-md-9">
				<div class="card border-0 shadow-lg my-4">
					<div class="card-body p-2">
						<c:choose>
							<c:when test="${not empty adminDTO}">
								<div class="text-center">
									<h1 class="h2 text-gray-900 mt-4 mb-4">관리자 정보</h1>
								</div>
								<table class="table">				
								<tr>
									<td>아이디
									<td>${adminDTO.adminId}</td>
								</tr>
								<tr>
									<td>비밀번호
									<td>${adminDTO.adminPw}</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>${adminDTO.adminName}</td>
								</tr>
								</table>
							</c:when>
									
							<c:otherwise>
								<div class="text-center">
									<h1 class="h2 text-gray-900 mt-4 mb-4">내 정보</h1>
								</div>
								<table class="table">
								<tr>
									<td class="align-middle">아이디</td>
									<td class="align-middle">${memberDTO.memberId}</td>
								</tr>
								<tr>
									<td class="align-middle">이름</td>
									<td class="align-middle">${memberDTO.memberName}</td>
								</tr>
								<tr>
									<td class="align-middle">닉네임</td>
									<td class="align-middle">
										${memberDTO.memberNickname}&nbsp;&nbsp;
										<div id="Nickname">
											변경할 닉네임<br>
											<div class="mb-2">
												<input type="text" class="col-9 form-control" id="Nick_Txt" placeholder="변경 닉네임 입력"><br>
											</div>
											
											<input type="button" class="btn btn-warning"  id="Nick_Cancle" value="수정취소"> 
											<input type="button" class="btn btn-warning"  id="Nick_Submit" value="수정완료">
										</div>
										<input type="button" class="btn btn-warning" id="Nick_Btn" value="수정">
									</td>
								</tr>
								<tr>
									<td class="align-middle">이메일</td>
									<td class="align-middle">${memberDTO.memberEmail}
										<div id="Email">
											변경할 이메일<br>

			                            	<div class="mb-2 rightMarginTest">
												<input type="text" class="col-9 form-control" id="Email_Txt" name="memberEmail" placeholder="변경 이메일 입력">
												<a href="#" id="Email_Transmit" class="btn btn-warning btnMarginTop">
			                            			<i class="fas fa-solid fa-envelope"></i>
			                           			</a>   
			                            	</div>

			                            	<div class="mb-2 rightMarginTest">
												<input type="text" class="col-9 form-control" id="Email_Number" placeholder="인증번호 입력">
				                            	<a href="#" id="Email_Check" class="btn btn-warning btnMarginTop">
				                            		<i class="fas fa-check"></i>
				                           		</a> 
			                            	</div>
			                            	
			                            	<input type="button" class="btn btn-warning" id="Email_Cancle" value="수정취소">
											<input type="button"  class="btn btn-warning" id="Email_Submit" value="수정완료">
											<div id="resultEmail"></div>
											
										</div> 
											<input type="button" class="btn btn-warning" id="Email_Btn" value="수정">
									</td>
								</tr>
								<tr>
									<td class="align-middle">전화번호</td>
									<td class="align-middle">${memberDTO.memberNumber}
										<div id="Number">
											변경할 전화번호<br>
											
			                            	<div class="mb-2 rightMarginTest">
												<input type="text" class="form-control col-9" id="Number_Txt" name="memberNumber" placeholder="변경 전화번호 입력">
												<a href="#" id="Number_Transmit" class="btn btn-warning btnMarginTop">
			                            			<i class="fas fa-solid fa-envelope"></i>
			                           			</a>
			                           		</div>

			                            	<div class="mb-2 rightMarginTest">
												<input type="text" class="form-control col-9" id="Number_Number" placeholder="인증번호 입력">
												<a href="#" id="Number_Check" class="btn btn-warning btnMarginTop">
			                            			<i class="fas fa-check"></i>
			                           			</a>
			                           		</div>			

											<input type="button" class="btn btn-warning" id="Number_Cancle" value="수정취소">
											<input type="button" class="btn btn-warning" id="Number_Submit" value="수정완료">
											<div id="resultNumber"></div>
										</div> 
											<input type="button" class="btn btn-warning" id="Number_Btn" value="수정">
									</td>
								</tr>
								<tr>
									<td class="align-middle">가입날짜</td>
									<td class="align-middle">${memberDTO.memberDate}</td>
								</tr>
								<tr>
									<td class="align-middle">보유포인트</td>
									<td class="align-middle">${memberDTO.holdPoint}</td>
								</tr>
								</table>
								<div class="card-body ml-n2">
									<div id="Pw">
										<input type="hidden" id="memberPw" value="${memberDTO.memberPw}">
										
		                            	<div class="mb-2 inputHeight">
											<input type="password" class="form-control col-9" id="Pw_Current" placeholder="현재 비밀번호 입력">
											<div id="resultPwCurrent"></div><br>
		                            	</div>

		                            	<div class="mb-2 inputHeight">
											<input type="password" class="form-control col-9" id="Pw_Change" placeholder="변경 비밀번호 입력">
											<div id="resultPwChange"></div><br>
		                            	</div>

		                            	<div class="mb-2 inputHeight">
											<input type="password" class="form-control col-9" id="Pw_Chk" placeholder="변경 비밀번호 확인">
											<div id="resultPwChk"></div><br>
		                            	</div>

										<input type="button" class="btn btn-warning" id="Pw_Submit" value="변경 완료">
										<input type="button" class="btn btn-warning" id="Pw_Cancle" value="변경 취소">
									</div>
								</div>
								<div class="card-body p-2">
									<input type="button" class="form-control mb-2" id="Pw_Btn" value="비밀번호 변경">
									<form id="userGifticon" action="userGifticon" method="POST">
										<input type="hidden" id="memberCode" name="userDto.memberCode" value="${memberDTO.memberCode}">
										<input type="button" class="form-control mb-2" value="보유 기프티콘" onClick="userGifticon()">
									</form>
									<input type="button" class="form-control" value="회원탈퇴" onClick="location.href='userDelete'">
								</div>
							</c:otherwise>
						</c:choose>
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