<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/javascriptPagemain.js"></script>
<title>메인화면</title>
</head>
<body>
<center>
<h1>환영합니다.</h1>
<form name="paging">

<input type="hidden" name="adminCode" />
<input type="hidden" name="noticeCode" />
	
<a href='javascript:Notice("1")'>공지사항</a>

<br>
	
<a href='javascript:QnA("00002")'>Q . A</a>
<input type="hidden" name="memberCode" />
<br>
</form>
</center>
</body>
</html>