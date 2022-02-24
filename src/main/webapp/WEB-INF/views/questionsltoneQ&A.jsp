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
	<script src="resources/js/qna/questionsltoneQ&A.js"></script>
    
</head>

<body id="page-top">
	<!-- 페이지 Wrapper 시작 -->
	<div id="wrapper">
	<!-- 사이드바 -->
	<jsp:include page="PageSide.jsp" flush="false"/>
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
							<form name="paging" >
								<div class="d-flex">
									<c:if test="${sltOne.qesDto.qstnConfirm eq '미답변'}">
										<div>
											<input class="btn btn-warning mr-3" type="button" value="수정" onclick="update()" >
										</div>									
									</c:if>
										<div>
											<input class="btn btn-warning" type="button" value="삭제" onclick="Quesdelete('${ sltOne.qesDto.memberCode }','${ sltOne.qesDto.qstnCode }')">
										</div>
								</div>
								<div class="h4 text-center">${ sltOne.qesDto.qstnTitle }</div> 
								<hr>
								<div class="d-flex justify-content-between">
									<div>${ sltOne.memberDto.memberName }</div>
									<div>작성일자 : ${ sltOne.qesDto.qstnDate }</div>
								</div>
								<hr>
								<div>
									${ sltOne.qesDto.qstnContent }
								</div>
								
								<div>
									<img src="<c:url value='${ sltOne.qesDto.qstnImg }' />" alt="${ sltOne.qesDto.qstnImg }" height="150" width="150" onError="this.style.visibility='hidden'" />
								</div>
								<input type="hidden" id="memberCode" name="memberCode" value="${ sltOne.qesDto.memberCode }">
								<input type="hidden" id="qstnCode" name="qstnCode" value="${ sltOne.qesDto.qstnCode }">
								<input type="hidden" id="qstnTitle" name="qstnTitle"  value=${ sltOne.qesDto.qstnTitle } >
								<input type="hidden" id="qstnContent" name="qstnContent" value="${ sltOne.qesDto.qstnContent } " />
								<input type="hidden" id="qstnImg" name="qstnImg" value="${sltOne.qesDto.qstnImg }" />
								<input type="hidden" id="qstnDate" name="qstnDate" value="${ date }">
								<input type="hidden" id="qstnConfirm" name="qstnConfirm" value="미답변"> 
							</form>
						</div>
					</div>
					<c:if test="${not empty selectOne}">
						<div class="card d-inline-block w-100 h-100 shadow mt-3 mb-3">
							<div class="card-body">
								<div id="reply">	
									<div class="h4 text-center">답변</div>
									<div class="d-flex justify-content-between">
										<div>${ selectOne.adminDto.adminName }</div>
										<div>답변일자 : ${ selectOne.answerDto.answerDate }</div>
									</div>
									<hr>
									<div>${ selectOne.answerDto.answerContent }</div>
								</div>						
							</div>
						</div>
					</c:if>

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