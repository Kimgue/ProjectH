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

    <title>헝픽 메뉴 조회</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></link>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script>
    var lang_kor = {
            "decimal" : "",
            "emptyTable" : "데이터가 없습니다.",
            "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
            "infoEmpty" : "0개",
            "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
            "infoPostFix" : "",
            "thousands" : ",",
            "lengthMenu" : "_MENU_ 개씩 보기",
            "loadingRecords" : "로딩중...",
            "processing" : "처리중...",
            "search" : "검색 : ",
            "zeroRecords" : "검색된 데이터가 없습니다.",
            "paginate" : {
                "first" : "첫 페이지",
                "last" : "마지막 페이지",
                "next" : "다음",
                "previous" : "이전"
            },
        };  
    
    $(document).ready( function () {
        $('#menuReview').DataTable({
        	pageLength: 5,
        	bPaginate: true,
        	bAutoWidth: false,
        	processing: true,
        	severSide: false,
        	searching: true,
        	language : lang_kor
        });
    });
    </script>
    
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
			<div class="w-100 text-center">
				<div style="width:1660px;" class="card shadow m-3">
					<div class="card-body">
						<div class="mt-3">
							<img src="<c:out value="resources/${menu.menuImg}"/>" alt="메뉴 이미지" height="200" width="200" />
						</div>
						
						<div class="">
							<div class="h3 font-weight-bolder"><c:out value="${menu.menuName}" /></div>
							<div><c:out value="${menu.menuPrice}"/>원</div>
							<div><c:out value="${menu.menuIngredients}" /></div>
						</div>
						
						<div class="">
							<div class="font-weight-bold text-gray-800 mt-3">
								<c:out value="${menu.menuDescription}" />
							</div>
						</div>
					</div>
				</div>
				
				<div style="width:1660px;" class="card shadow m-3">
					<div class="card-body">
						<table id="menuReview" class="table table-bordered">
							<thead>
								<tr>
									<th width="150">닉네임</th>
									<th width="80">점수</th>
									<th width="150">리뷰날짜</th>
									<th>내용</th>
									<th width="130">상세리뷰</th>	
								</tr>
							</thead>
							<tbody>
								<c:forEach var="review" items="${review}">
									<tr>
										<td><c:out value="${review.memberDto.memberNickname}" /></td>
										<td><c:out value="${review.reviewDto.reviewScore}" /></td>
										<td><c:out value="${review.reviewDto.reviewDate}" /></td>
									
										<td>
											<c:out value="${review.reviewDto.reviewContent}" />
										</td>
										
										
										<c:url value="reviewLookup" var="reviewLookup">
											<c:param name="brandCode" value="${review.reviewDto.brandCode}"/>
											<c:param name="menuCode" value="${review.reviewDto.menuCode}" />
											<c:param name="reviewCode" value="${review.reviewDto.reviewCode}" />
											<c:param name="memberCode" value="${review.reviewDto.memberCode}" />
										</c:url>
										<td><a href="${reviewLookup}">상세 리뷰 보기</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div>	
							<c:url value="reviewWrite" var="reviewWrite">
								<c:param name="brandCode" value="${menu.brandCode}"/>
								<c:param name="menuCode" value="${menu.menuCode}" />
								<c:param name="menuName" value="${menu.menuName}" />
							</c:url>
							<c:if test="${empty adminDTO}">
								<a href="${reviewWrite}">리뷰 작성하기</a>
							</c:if>
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