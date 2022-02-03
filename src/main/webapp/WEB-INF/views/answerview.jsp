<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 달기</title>
<script src="js/jquery-3.4.1.min.js"></script>

</head>
<body>
<section id="container">			
					<table>
						<tbody>
							<tr>
								<td>
									<label for="memberCode" id="memberCode">작성자 번호 :${ sltOne.memberCode }</label>
							</tr>	
							<tr>
								<td>
									<label for="qstnTitle">제목 : ${ sltOne.qstnTitle }</label>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="qstnContent">내용 : </label>${ sltOne.qstnContent } 
								</td>
							</tr>
							<tr>
								<td> 
									<label for="qstnDate" id="qstnDate">작성날짜 : ${ sltOne.qstnDate }</label>
								</td>
								</tr>			
						</tbody>			
					</table>
				</section>
				<br>
				<hr>
			
														
									
								
				<div id="result">
					<form action="post">
						<table>
							<tr>
								<td>
									<label for="answerContent">내용 : </label><textarea id="answerContent" name="answerContent" > </textarea>
								</td>
							</tr>
							<tr>
							<td>
								<button type="submit" onclick="">답변 작성</button>
							</td>
							</tr>
							<tr>
							<td><input type="hidden" id="memberCode" value="${sltOne.memberCode }"/> <td>
							<td><input type="hidden" id="qstnCode" value="${sltOne.qstnCode }" /></td>
							<td><input type="hidden" id="answerCode" value="" /></td>
							<td><input type="hidden" id="adminCode" value="" /></td>
							<td><input type="hidden" id="answerDate" value="${ date }" /></td>
							</tr>
						</table>
					</form>
				</div>
</body>
</html>