
	
		$(document).ready(function() {
			const inputImage = document.getElementById("input-image");
			inputImage.addEventListener("change", e => {readImage(e.target)});
			$("#preview-image").hide();
		});
		
		function readImage(input) {
			$("#preview-image").attr("src","");
			$("#preview-image").hide();
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader();
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image");
		            previewImage.src = e.target.result;
		            $("#preview-image").show();
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0]);
		        
		    }
		}
		
		function insert() {
			const imageInput = $("#input-image")[0];
			const nameInput = $("#brandName").val();
			const DescriptionInput = $("#brandDescription").val();
			const LinkInput = $("#brandLink").val();
			
			
			if(imageInput.files.length === 0 || imageInput=="" || nameInput=="" || DescriptionInput=="" || LinkInput==""){
			    alert("입력되지 않은 항목이 있습니다");
			    return;
			}
			
			var result = confirm("등록하시겠습니까?");
			if(result) {
				const filePath = "brand";
				
				const formData = new FormData();
				formData.append("uploadFile", imageInput.files[0]);
				formData.append("filePath", filePath);
				
				$.ajax({
					type : "POST",
					url : "fileUpload.do",
					processData : false,
					contentType : false,
					data : formData,						
					success : function(response) {
						$("#brandImg").attr("value","images/brand/"+response);
						$("#insertForm").submit();
						alert("등록되었습니다.")
					},
					error : function(jqXHR) {
						alert(jqXHR.responseText); 
					}
				});			
			} else {
				return false;
			}
		}
		