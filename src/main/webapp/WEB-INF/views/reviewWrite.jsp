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
	<%-- import해서 쓰면 문제있음
	<script src="resources/js/review/reviewWrite.js"></script>
	 --%>
   	<script>
    var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${url}'/>";
	
	if(msg != null && msg !='')
	{
	alert(msg);
	location.href = url;
	};

	$(document).ready(function()
			// input file 파일 첨부시 fileCheck 함수 실행
			{
				$("#input_file").on("change", fileCheck);
			});

	/**
	 * 첨부파일로직
	 */
	$(function () {
	    $('#btn-upload').click(function (e) {
	        e.preventDefault();
	        $('#input_file').click();
	    });
	});

	// 파일 현재 필드 숫자 totalCount랑 비교값
	var fileCount = 0;
	// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
	var totalCount = 2;
	// 파일 고유넘버
	var fileNum = 0;
	// 첨부파일 배열
	var content_files = new Array();

	function fileCheck(e) {
	    var files = e.target.files;
	    
	    // 파일 배열 담기
	    var filesArr = Array.prototype.slice.call(files);
	    
	    // 파일 개수 확인 및 제한
	    if (fileCount + filesArr.length > totalCount) {
	      $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
	      return;
	    } else {
	    	 fileCount = fileCount + filesArr.length;
	    }
	    
	    // 각각의 파일 배열담기 및 기타
	    filesArr.forEach(function (f) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        content_files.push(f);
	        $('#articlefileChange').append(
	       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
	       		+ '<font style="font-size:12px">' + f.name + '</font>'  
	       		+ '<img src="resources/images/button/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
	       		+ '<div/>'
			);
	        fileNum ++;
	      };
	      reader.readAsDataURL(f);
	    });
	    console.log(content_files);
	 
	  }

	// 파일 부분 삭제 함수
	function fileDelete(fileNum){
	    var no = fileNum.replace(/[^0-9]/g, "");
	    content_files[no].is_delete = true;
		$('#' + fileNum).remove();
		fileCount --;
	    console.log(content_files);
	}

	/*
	 * 폼 submit 로직
	 */
		function registerAction(){
			
		var form = $("form")[0];        
	 	var formData = new FormData(form);
			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if(!content_files[x].is_delete){
					 formData.append("article_file", content_files[x]);
				}
			}
	   /*
	   * 파일업로드 multiple ajax처리
	   */    
		$.ajax({
	   	      type: "POST",
	   	   	  enctype: "multipart/form-data",
	   	      url: "file-upload",
	       	  data : formData,
	       	  processData: false,
	   	      contentType: false,
	   	      success: function (data) {
	   	    	if($('input[name=reviewScore]').val() =="" || $('input[name=reviewContent]').val() ==""){
	 	    			alert("리뷰 작성란에 빈칸이 있습니다.")
	 	    			return;	  
	   	    	}
	   	    	if(JSON.parse(data)['result'] == "OK"){
	   	    		var result = confirm("등록하시겠습니까?");
	   	 			if(result) {
	   	 				alert("등록되었습니다");
	   	    			//초기화 한다.
	   	 	    		$("#input_file").val("");  	    			
	   	 	    		$("#reviewImg").attr("value", JSON.parse(data)['reviewImg']);
	   	 	    		$("form").submit();
	   	 	    		}
				} else
					alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
	   	      },
	   	      error: function (xhr, status, error) {
	   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
	   	     return false;
	   	      }
	   	    });
	   	    return false;
		}
   	
   	</script>
	
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
			<div align="center">
				<button onclick="history.back()">돌아가기</button>	
				<form action="reviewWriteSubmit" name="dataForm"  id="dataForm">
					<br> 
					<input type='hidden' name='brandCode' value='${brandCode}' readonly/>
					<br> 
					<input type='hidden' name='menuCode' value='${menuCode}' readonly/>
					<br> 
					메뉴명:
					<input type='text' name='menuName' value='${menuName}' readonly/>
					<br> 
					리뷰점수: 
					<input type='number' name='reviewScore' min='1' max='5' step='0.1' required/>
					<br> 
					리뷰내용:
					<input type='text' name='reviewContent' style="width:300px;height:200px;" required/>
					<br> 
		  			<h3>리뷰 이미지</h3>
		  			<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
		  			<input type="hidden" id="reviewImg" name="reviewImg">
		  			<input id="input_file" multiple="multiple" type="file" accept="image/*" style="display:none; ">
		  			<span style="font-size:10px; color: gray;">※첨부파일은 최대 2개까지 등록이 가능합니다.</span>
		  			<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
					<span>첨부 파일</span>
					<br />
					<div id="articlefileChange">
					</div>
					</div>
		  			<button type="submit" onclick="return registerAction()" >전송</button>
				</form>
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