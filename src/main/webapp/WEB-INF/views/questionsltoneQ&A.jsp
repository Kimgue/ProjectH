<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function Quesdelete( memberCode , qstnCode)
{
	 var g = confirm('정말 삭제하시겠습니까?')
	 
	 if(g == false)
		 {
		 	return;
		 }
	 else
		var f = document.paging;	 
	 	f.memberCode.value = memberCode;
		f.qstnCode.value = qstnCode;
		f.action = "./Questiondelete"
	    
		f.method="post"
		f.submit();
};
	function update()
	{
		var a = document.paging;

		a.action ="./view1"
		
		a.method="post"
		a.submit();
	
	}; 
</script>
</head>
<body>
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
									<label for="memberCode" id="memberCode">작성자 번호 :${ sltOne.memberCode }</label>
									<input type="hidden" id="memberCode" name="memberCode" value="${ sltOne.memberCode }">
									<input type="hidden" id="qstnCode" name="qstnCode" value="${ sltOne.qstnCode }">
							</tr>	
							<tr>
								<td>
									<label for="qstnTitle">제목 : ${ sltOne.qstnTitle }</label>
									 <input type="hidden" id="qstnTitle" name="qstnTitle"  value=${ sltOne.qstnTitle } > 
								</td>
							</tr>	
							<tr>
								<td>
									<label for="qstnContent">내용 :${ sltOne.qstnContent } 
									${sltOne.qstnImg }</label><!-- <textarea id="qstnContent" name="qstnContent" >
									</textarea>	 -->	
									<input type="hidden" id="qstnContent" name="qstnContent" value="${ sltOne.qstnContent } " />
									<input type="hidden" id="qstnImg" name="qstnImg" value="${sltOne.qstnImg }" /> 
									<%-- <td>
									<div id="test" contentEditable="true" style="overflow-x:auto; width:500px; height: 300px; border: solid; 1px; margin: 20px; line-height: 20px; background-image: ; " >
									<img src="<c:url value='${sltOne.qstnImg }' />" alt="${sltOne.qstnImg }" height="150" width="150"/>
									</div>									
								</td> --%>
							</tr>
							<tr>
								<td> 
									<label for="qstnDate" id="qstnDate">작성날짜 : ${ sltOne.qstnDate }</label>
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
     			 <li>
       				 <p>
       				 작성자 :  ${ selectOne.qesDto.memberCode }<br /><br />
       				 작성 내용: ${ selectOne.answerDto.answerContent }<br/><br />
       				 작성 날짜 : ${ selectOne.answerDto.answerDate }
        			</p>
      			</li>
  			</ol>
		</div>
							
</body>
</html>