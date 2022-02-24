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
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
   	<link href="resources/css/fileBtnHidden.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/qna/Questionupdatelist.js"></script>
	<script src="resources/js/textareaHeight.js"></script>
    
</head>

<body>
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
					<div class="card d-inline-block h-100 shadow mt-3 mb-3 overflow-hidden">
						<div class="card-body">
							<div class="h1 mb-3">
								질문 수정
							</div>
							<form name="paging" id="qstnupdate" enctype="multipart/form-data" action="QuestionUpdate" method="post">
								<div class="noticeGrid">
									<div class="one">
										<input type="text" class="form-control mb-3" id="qstnTitle" name="qstnTitle" value="${ sltOne.qesDto.qstnTitle }">
										<input type="hidden" id="memberCode" name="memberCode" value="${ sltOne.qesDto.memberCode }">
										<input type="hidden" id="qstnCode" name="qstnCode" value="${ sltOne.qesDto.qstnCode }">
										<input type="hidden" id="qstnImg" name="qstnImg" value="${sltOne.qesDto.qstnImg }">
										<input type="hidden" id="qstnDate" name="qstnDate" value="${date }">
										
									</div>
									<div class="two">
										<textarea onkeydown="resize(this)" onkeyup="resize(this)" style="width:665px; min-height:180px;" class="form-control" id="qstnContent" name="qstnContent">${ sltOne.qesDto.qstnContent }</textarea>
									</div>
									<input type="file" id="input-image" name="uploadfile" required="required">
									<div class="three">
										<img src="<c:url value='${ sltOne.qesDto.qstnImg }' />" alt="${ sltOne.qesDto.qstnImg }" height="150" width="150" onError="this.style.visibility='hidden'" />
										<img style="width: 350px; height:200px;" class="img img-fluid img-thumbnail mb-3" id="preview-image" src="">
									</div>
									<div class="four">
										<div class="float-left">
											<label for="input-image">
												<i style="width:150px; height:38px;" class="fas fa-solid fa-file-image btn btn-warning"> 파일 첨부</i>
											</label>
										</div>
									</div>
									<div class="five">
										<div class="float-right">
											<input style="width:150px;" type="button" class="btn btn-warning" value="수정" onclick="update()">
										</div>
									</div>
								</div>
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

    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sb-admin-2.min.js"></script>	
</body>
</html>