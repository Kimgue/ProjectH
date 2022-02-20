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
    
	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/user/userMyInfo.js"></script>
	
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
			<div class="col-xl-5 col-lg-6 col-md-9">
				<div class="card border-0 shadow-lg my-4">
					<div class="card-body p-2">
						<!-- Nested Row within Card Body -->
							
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
												<input type="text" class="form-control mb-3" id="Nick_Txt">
												<input type="button" class="btn btn-primary"  id="Nick_Cancle" value="수정취소"> 
												<input type="button" class="btn btn-primary"  id="Nick_Submit" value="수정완료">
											</div>
											<input type="button" class="btn btn-primary" id="Nick_Btn" value="수정">
										</td>
									</tr>
									<tr>
										<td class="align-middle">이메일</td>
										<td class="align-middle">${memberDTO.memberEmail}
											<div id="Email">
												변경할 이메일<br>
												<input type="text" class="form-control mb-3" id="Email_Txt" name="memberEmail">
												<input type="button" class="btn btn-primary mb-3" id="Email_Transmit" value="인증번호 전송">
												<br>
												<input type="text" class="form-control mb-3" id="Email_Number">
												<input type="button" class="btn btn-primary mb-3" id="Email_Check" value="인증번호 확인">
												<br>
												<input type="button" class="btn btn-primary" id="Email_Cancle" value="수정취소">
												<input type="button"  class="btn btn-primary" id="Email_Submit" value="수정완료">
												<div id="resultEmail"></div>
											</div> 
												<input type="button" class="btn btn-primary" id="Email_Btn" value="수정">
										</td>
									</tr>
									<tr>
										<td class="align-middle">전화번호</td>
										<td class="align-middle">${memberDTO.memberNumber}
											<div id="Number">
												변경할 전화번호<br>
												<input type="text" class="form-control mb-3" id="Number_Txt" name="memberNumber">
												<input type="button" class="btn btn-primary mb-3" id="Number_Transmit" value="인증번호 전송">
												<br>
												<input type="text" class="form-control mb-3" id="Number_Number">
												<input type="button" class="btn btn-primary mb-3" id="Number_Check" value="인증번호 확인">
												<br>
												<input type="button" class="btn btn-primary" id="Number_Cancle" value="수정취소">
												<input type="button" class="btn btn-primary" id="Number_Submit" value="수정완료">
												<div id="resultNumber"></div>
											</div> 
												<input type="button" class="btn btn-primary" id="Number_Btn" value="수정">
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
									<br>
									<div class="card-body p-2">
										<div id="Pw">
											<input type="hidden" id="memberPw" value="${memberDTO.memberPw}">
											<table class="table table-borderless">
												<tr>
													<td class="align-middle">
														현재 비밀번호<br>
														<input type="password" class="form-control" id="Pw_Current">
														<div id="resultPwCurrent"></div><br>
													</td>
												</tr>
												<tr>
													<td class="align-middle">
														변경 비밀번호<br>
														<input type="password" class="form-control mb-3"  id="Pw_Change">
														<div id="resultPwChange"></div>
													</td>
												</tr>
												<tr>
													<td class="align-middle">
														변경 비밀번호 확인<br>
														<input type="password" class="form-control mb-3"  id="Pw_Chk">
														<div id="resultPwChk"></div>
													</td>									
												</tr>
												<tr>
													<td class="align-middle">
														<input type="button" class="btn btn-primary" id="Pw_Submit" value="변경 완료">
														<input type="button" class="btn btn-primary" id="Pw_Cancle" value="변경 취소">
													</td>									
												</tr>
											</table>
											
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

	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/sb-admin-2.min.js"></script>
</body>

</html>