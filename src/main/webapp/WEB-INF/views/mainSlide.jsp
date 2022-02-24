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
   	<link href="resources/css/main.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/menu/menuSlide.js"></script>
    
</head>

<body>
	<div class="slider">
		<div class="slides">
			<input type="radio" name="radio-btn" id="radio1"> 
			<input type="radio" name="radio-btn" id="radio2"> 
			<input type="radio" name="radio-btn" id="radio3"> 
			<input type="radio" name="radio-btn" id="radio4">

			<div class="slide first">
				<img src="images/etc/slideImg1.png" alt="">
			</div>
			<div class="slide">
				<img src="images/etc/slideImg2.png" alt="">
			</div>
			<div class="slide">
				<img src="images/etc/slideImg3.png" alt="">
			</div>
			<div class="slide">
				<img src="images/etc/slideImg4.png" alt="">
			</div>

			<div class="navigation-auto">
				<div class="auto-btn1"></div>
				<div class="auto-btn2"></div>
				<div class="auto-btn3"></div>
				<div class="auto-btn4"></div>
			</div>
		</div>
		
		<div class="navigation-manual">
			<label for="radio1" class="manual-btn"></label> <label for="radio2"
				class="manual-btn"></label> <label for="radio3" class="manual-btn"></label>
			<label for="radio4" class="manual-btn"></label>
		</div>
	</div>
</body>
</html>