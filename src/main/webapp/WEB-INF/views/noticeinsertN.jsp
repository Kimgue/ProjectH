<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성</title>
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
/* input {
  
  vertical-align: top; 
  width:500px;
  
}
#noticeContent
{
	width:500px; 
	height:50px; 
    resize:none;
	vertical-align:-20px;
} */
</style>
</head>
<body>
		<div id="root">
			<header>
				<h1> 공지사항</h1>
			</header>
			<hr />	 
			<nav>
			  홈 - 공지사항 작성
			</nav>
			<hr />
			
			<section id="container">
				<form role="form" method="post" action="Noticeinsert">
					<table>
						<tbody>
						<thead>
						<tr>
						<th style="background-color: #eeeee; text-align: center;">공지사항 글쓰기 </th>
							</tr>
						</thead>		
							<tr>
								<td>
									<label for="adminCode" id="adminCode">작성자 번호 :${ adminCode }</label>
									<input type="hidden" id="adminCode" name="adminCode" value="${ adminCode }">
									<input type="hidden" id="noticeCode" name="noticeCode" value="noticeCode">
							</tr>	
							<tr>
								<td>
									<label for="noticeTitle">제목 : </label><input type="text" id="noticeTitle" name="noticeTitle" />
								</td>
							</tr>	
							<tr>
								<td>
									<label for="noticeContent">내용 : </label><textarea id="noticeContent" name="noticeContent" ></textarea>
								</td>
							</tr>
							<tr>
								<td> 
									<label for="noticeDate" id="noticeDate">작성날짜 : ${ date }</label>
									<input type="hidden" id="noticeDate" name="noticeDate" value="${ date }">  
									<input type="hidden" id="noticeImg" name="noticeImg" value="noticeImg">
								</td>
								</tr>
							<tr>
								<td>						
									<button type="submit" id="submit">작성</button>
									
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
</body>
</html>