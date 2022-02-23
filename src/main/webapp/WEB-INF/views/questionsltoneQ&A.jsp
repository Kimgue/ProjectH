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
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/qna/questionsltoneQ&A.js"></script>
    
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
			<h1> 게시판</h1>
			<hr />	 
			<nav>
			  홈 - 글 수정
			</nav>
			<hr/>
			<section id="container">
				<form name="paging" >
					<table>
						<tbody>
							<tr>
								<td>
									<label for="memberCode" id="memberCode">작성자 이름 :${ sltOne.memberDto.memberName }</label>
									<input type="hidden" id="memberCode" name="memberCode" value="${ sltOne.qesDto.memberCode }">
									<input type="hidden" id="qstnCode" name="qstnCode" value="${ sltOne.qesDto.qstnCode }">
							</tr>	
							<tr>
								<td>
									<label for="qstnTitle">제목 : ${ sltOne.qesDto.qstnTitle }</label>
									 <input type="hidden" id="qstnTitle" name="qstnTitle"  value=${ sltOne.qesDto.qstnTitle } > 
								</td>
							</tr>	
							<tr>
								<td>
									<label for="qstnContent">내용 :${ sltOne.qesDto.qstnContent } </label><!-- <textarea id="qstnContent" name="qstnContent" >
									</textarea>	 -->	</td>
									
									<input type="hidden" id="qstnContent" name="qstnContent" value="${ sltOne.qesDto.qstnContent } " />
									<input type="hidden" id="qstnImg" name="qstnImg" value="${sltOne.qesDto.qstnImg }" /> 
									<%-- <td>
									<div id="test" contentEditable="true" style="overflow-x:auto; width:500px; height: 300px; border: solid; 1px; margin: 20px; line-height: 20px; background-image: ; " >
									<img src="<c:url value='${sltOne.qstnImg }' />" alt="${sltOne.qstnImg }" height="150" width="150"/>
									</div>									
								</td> --%>
							</tr>
							<tr>
								<td>								
									<img src="<c:url value='${sltOne.qesDto.qstnImg }' />" alt="${sltOne.qesDto.qstnImg }" height="150" width="150" onError="this.style.visibility='hidden'" />
								</td>
							</tr>
							<tr>
								<td> 
									<label for="qstnDate" id="qstnDate">작성날짜 : ${ sltOne.qesDto.qstnDate }</label>
								 <input type="hidden" id="qstnDate" name="qstnDate" value="${ date }">   
								</td>
								</tr>
								<tr>
									<td>
									 <input type="hidden" id="qstnConfirm" name="qstnConfirm" value="n"> </td>
									</tr>
									<tr>
									<td>
									<button type="submit"  onclick="update()" >수정하기</button>
									<button type="submit"  onclick="Quesdelete('${ sltOne.qesDto.memberCode }','${ sltOne.qesDto.qstnCode }')">삭제하기</button>
								</td>
							</tr>					
						</tbody>			
					</table>
				</form>
				</section>
				<hr>	
		<div id="reply">	
			<h3>관리자 댓글</h3>
  				<ol >
     			 <li>
       				 <p>
       				 작성자 :  ${ selectOne.qesDto.memberCode }<br /><br />
       				 작성 내용: ${ selectOne.answerDto.answerContent }<br/><br />
       				 작성 날짜 : ${ selectOne.answerDto.answerDate }
        			</p>
      			</li>
  			</ol>
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