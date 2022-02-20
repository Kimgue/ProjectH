		$(document).ready(function(){
			
			const inputImage = document.getElementById("noticeImg");
			inputImage.addEventListener("change", e => {readImage(e.target)});
			
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

	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image");
	            previewImage.src = e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	

	// 파일 업로드
	function insert() {
							
		var result = confirm("등록하시겠습니까?");
		if(result) {
			alert("등록되었습니다");
			
			const uploadPath = "/WebProject/src/main/webapp/resources/images/NoticeImg";
			
			const imageInput = $("#noticeImg")[0];
			if(imageInput.files.length == 0){
			   $("#noticeInsert").submit();
			} else {
				const formData = new FormData();
				formData.append("uploadFile", imageInput.files[0]);
				formData.append("uploadPath", uploadPath);
				
				$.ajax({
					type : "POST",
					url : "fileUpload.do",
					processData : false,
					contentType : false,
					data : formData,						
					success : function(response) {
						$("#testabc").attr("value","images/NoticeImg/"+response);
						$("#noticeInsert").submit();
					},
					error : function(jqXHR) {
						alert(jqXHR.responseText); 
					}
				});
			}	
		} else {
			return false;
		}
	}