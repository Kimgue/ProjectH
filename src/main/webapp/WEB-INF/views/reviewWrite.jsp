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

    <title>헝픽 리뷰 작성</title>
    
   	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
   	<link href="resources/css/GridLayout.css" rel="stylesheet">
   	<link href="resources/css/fileBtnHidden.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/730c440743.js" crossorigin="anonymous"></script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/textareaHeight.js"></script>
	<script>
    var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${url}'/>";
	var preImg = new Array();

	if(msg != null && msg !='') { alert(msg); location.href = url;};

	$(document).ready(function() {
		$("#input_file").on("change", fileCheck);
		$("#preview-image-0").hide();
		$("#preview-image-1").hide();
	});

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
	      alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
	      return;
	    } else {
	    	 fileCount = fileCount + filesArr.length;
	    }
	    
	    // 각각의 파일 배열담기 및 기타
	    filesArr.forEach(function (f) {
	      var reader = new FileReader();
	      
	      reader.onload = function (e) {
	    	  
	    	  if(content_files.length == 0) {
	    		  fileNum = 0;
	    	  }
	    	  console.log("체크길이 : " + content_files.length);
	    	  console.log("체크 : " + fileNum);
	    	  var previewImage = document.getElementById("preview-image-"+fileNum);
	    	  previewImage.src = e.target.result;
	    	  $(previewImage).show();
	    	  
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
	  }

	// 파일 부분 삭제 함수
	function fileDelete(fileNum){
		var no = fileNum.replace(/[^0-9]/g, "");
		var previewImage;
		
		console.log(content_files.length);
		
		if(content_files.length > 1) {
			content_files[no].is_delete = true;
			previewImage = document.getElementById("preview-image-"+no);
			content_files.splice(no,1);
		} else if(no != 0) {
			content_files[no-1].is_delete = true;
			previewImage = document.getElementById("preview-image-"+no);
			content_files.splice(0,1);
		} else {
			content_files[no].is_delete = true;
			previewImage = document.getElementById("preview-image-"+no);
			content_files.splice(0,1);
		}
		
		$('#' + fileNum).remove();
		fileCount --;
		
		$(previewImage).attr("src","");
		$(previewImage).hide();
		
		console.log(content_files.length);
		console.log(content_files);

	}

	/* 폼 submit 로직 */
	function registerAction(){
		var form = $("form")[0];
		var formData = new FormData(form);
		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete) {
				 formData.append("article_file", content_files[x]);
			}
		}
   
		/* 파일업로드 multiple ajax처리 */
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
			<div class="container-fluid">
				<div class="row">
					<div class="card d-inline-block h-100 shadow mt-3 mb-3 overflow-hidden">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<div class="h1 mb-3">
									리뷰 등록
								</div>
								<div>
									<input type="button" class="btn btn-warning" value="이전" onclick="history.back()">
								</div>
							</div>
							
							<form id="dataForm" name="dataForm" action="reviewWriteSubmit">
								<input type='hidden' name='brandCode' value='${brandCode}'/>
								<input type='hidden' name='menuCode' value='${menuCode}'/>
								<input type="hidden" id="reviewImg" name="reviewImg">
								
								<div class="review-Grid">
									<div class="one">
										<input type="text" class="form-control mb-3" name="menuName" placeholder="${menuName}" readonly/>
										<input type="text" class="form-control mb-3" name="reviewScore" placeholder="리뷰 점수">
									</div>
									<div class="two">
										<textarea onkeydown="resize(this)" onkeyup="resize(this)" style="width:665px; min-height:180px;" class="form-control" name="reviewContent" placeholder="리뷰 작성"></textarea>
									</div>
									
									<div class="four">
										<div class="float-left">
											<label for="input-image">
												<i style="width:150px; height:38px;" id="btn-upload" class="fas fa-solid fa-file-image btn btn-warning"> 파일 첨부</i>
											</label>
										
											<input id="input_file" multiple="multiple" type="file" accept="image/*" style="display:none; ">
											<div style="font-size:12px;">
												※첨부 파일은 최대 2개까지 등록이 가능합니다.
											</div>
											<div class="data_file_txt" id="data_file_txt">
												<div id="articlefileChange">
												</div>
											</div>	
										</div>
							  												
									</div>
									<div class="five">
										<div class="float-right">
											<input style="width:150px;" type="button" class="btn btn-warning" value="등록" onclick="return registerAction()">
										</div>
									</div>
								</div>
								<div class="float-left">
									<img style="width: 300px; height:200px;" class="img img-fluid img-thumbnail mb-3 mr-3" id="preview-image-0" src="">
									<img style="width: 300px; height:200px;" class="img img-fluid img-thumbnail mb-3" id="preview-image-1" src="">
								</div>								
							</form>
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