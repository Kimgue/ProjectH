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

    <title>헝픽 질문과 답변</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/textareaHeight.js"></script>
    
</head>

<body id="page-top">
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	<!-- 사이드바 -->
	<jsp:include page="AdminPageSide.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
	<!-- 상단 -->
	<jsp:include page="PageHeader.jsp" flush="false"/>
					
		<!-- 메인 -->
		<div id="content">
			<div class="container-fluid">
				<div class="row">
					<div class="card d-inline-block w-100 h-100 shadow mt-3 mb-3">
						<div class="card-body">
							<div class="h4 text-center">${ sltOne.qesDto.qstnTitle }</div>
							<hr>
							<div class="d-flex justify-content-between">
								<div>작성자 : ${ sltOne.memberDto.memberName }</div>
								<div>작성일자 : ${ sltOne.qesDto.qstnDate }</div>
							</div>
							<hr>
							<div>
								${ sltOne.qesDto.qstnContent }
							</div>
							<div>
								<img src="<c:url value='${sltOne.qesDto.qstnImg }' />" alt="${sltOne.qesDto.qstnImg }" height="150" width="150" onError="this.style.visibility='hidden'" />
							</div>
						</div>
					</div>				
					<div class="card d-inline-block w-100 h-100 shadow mt-3 mb-3">
						<div class="card-body">
							<div class="h1 mb-3">
								답변 작성
							</div>
							<form method="post" action="insertreply">
								<div>
									<textarea onkeydown="resize(this)" onkeyup="resize(this)" style="width:665px; min-height:180px;" class="form-control" id="answerContent" name="answerContent" placeholder="내용"></textarea>
								</div>
								<div>
									<input type="submit" class="btn btn-warning" value="작성">
								</div>
								<input type="hidden" id="memberCode" name="memberCode" value="${ sltOne.qesDto.memberCode }"/>
								<input type="hidden" id="qstnCode" name="qstnCode" value="${ sltOne.qesDto.qstnCode }" />
								<input type="hidden" id="answerCode" name="answerCode" value="answerCode" />
								<input type="hidden" id="adminCode" name="adminCode" value="${ adminCode }" />
								<input type="hidden" id="answerDate" name="answerDate" value="${ date }" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 메인 컨텐츠 끝 -->
			
	<!-- 하단 -->
	<jsp:include page="PageFooter.jsp" flush="false"/>
	<!-- 컨텐츠 Wrapper 끝 -->
	</div>
	<!-- 페이지 Wrapper 끝 -->
	</div>
	<!-- 페이지 상단 버튼 -->
	<jsp:include page="PageTopBtn.jsp" flush="false"/>
	
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>
    
</body>
</html>