<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/javascriptUpdate.js"></script>
<script>	
	$(document).ready(function(){
		$("#submit").click(function(){
			
			if($("#qstnTitle").val().length == 0)
				{alert("제목을 입력해주세요");
				$("#qstnTitle").focus(); 
					return false;
				}
			
			if($("#qstnContent").val().length == 0)
			{alert("내용을 입력해주세요");
			$("#qstnContent").focus(); 
				return false;
			}
		});
	});
</script>
<style>
input {
  vertical-align: top; 
  width:500px;
  
}
#qstnContent
{
	width:500px; 
	height:50px; 
    resize:none;
	vertical-align:-20px;
}
</style>
</head>
<body>
<div>
<header>
		<h1> 게시판</h1>
			</header>
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
									<label for="memberCode" id="memberCode">작성자 번호 :${ sltOne.memberCode }</label>
									<input type="hidden" id="memberCode" name="memberCode" value="${ sltOne.memberCode }">
									<input type="hidden" id="qstnCode" name="qstnCode" value="${ sltOne.qstnCode }">
							</tr>	
							<tr>
								<td>
									<label for="qstnTitle">제목 : </label><input type="text" id="qstnTitle" name="qstnTitle"  value=${ sltOne.qstnTitle } >
								</td>
							</tr>	
							<tr>
								<td>
									<label for="qstnContent">내용 : </label><textarea id="qstnContent" name="qstnContent" >${ sltOne.qstnContent } </textarea>
									<input type="hidden" id="qstnImg" name="qstnImg" value="${sltOne.qstnImg }" />
								</td>
							</tr>
							<tr>
								<td> 
									<label for="qstnDate" id="qstnDate">작성날짜 : ${ sltOne.qstnDate }</label>
									<input type="hidden" id="qstnDate" name="qstnDate" value="${ date }">  
								</td>
								</tr>
								<tr>
									<td> <input type="hidden" id="qstnConfirm" name="qstnConfirm" value="n"> </td>
									</tr>
							<tr>
								<td>						
									<button type="submit"  onclick="update()" id="submit">수정하기</button>
									<button type="submit"  onclick="Quesdelete('${ sltOne.memberCode }','${ sltOne.qstnCode }')">삭제하기</button>
									
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
    			<c:forEach items="" var="replyList">
     			 <li>
       				 <p>
       				 작성자 :${ selectOne.qesDto.memberCode }<br /><br />
       				 작성 내용: ${ selectOne.answerDto.answerContent }<br/><br />
       				 작성 날짜 : ${ selectOne.answerDto.answerDate }
        			</p>
      			</li>
    		</c:forEach>   
  			</ol>
		</div>
	<hr />
</div>

</body>
</html>