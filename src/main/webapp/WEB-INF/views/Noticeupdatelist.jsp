<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글-수정</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script>	
	$(document).ready(function(){
		$("#submit").click(function(){
			
			if($("#noticeTitle").val().length == 0)
				{alert("제목을 입력해주세요");
				$("#noticeTitle").focus(); 
					return false;
				}
			
			if($("#noticeContent").val().length == 0)
			{alert("내용을 입력해주세요");
			$("#noticeContent").focus(); 
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
#noticeContent
{
	width:500px; 
	height:300px; 
    resize:none;
	vertical-align:-160px;
}

</style>
</head>
<body>
	<header>
			<h1> 공지사항 작성내용</h1>
			</header>
			<hr />	 
			<nav>
			  홈 - 공지사항 수정
			</nav>
			<hr />
			<section id="container">
				<form role="form" method="post" action="Noticeupdate">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="adminCode" id="adminCode">작성자 번호 :${ person.adminCode }</label>
									<input type="hidden" id="adminCode" name="adminCode" value="${person.adminCode }">
									<input type="hidden" id="noticeCode" name="noticeCode" value="${ person.noticeCode }">
							</tr>	
							<tr>
								<td>
									<label for="noticeTitle">제목 : </label><input type="text" id="noticeTitle" name="noticeTitle"  value=${person.noticeTitle } >
								</td>
							</tr>	
							<tr>
								<td>
									<label for="noticeContent">내용 : </label><textarea id="noticeContent" name="noticeContent">${person.noticeContent }</textarea>
								</td>
							</tr>
							<tr>
								<td> 
									<label for="noticeDate" id="noticeDate">작성날짜 : ${ person.noticeDate }</label>
									<input type="hidden" id="noticeDate" name="noticeDate" value="${ date }">  
								</td>
								</tr>
							<tr>
								<td>						
									<button type="submit" id="submit">수정</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		
	
</body>
</html>