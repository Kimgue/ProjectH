var menuSltBool = false;
	
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
			const nameInput = $("#gifticonName").val();
			const priceInput = $("#gifticonPrice").val();
			
			if(imageInput.files.length === 0 || imageInput=="" || nameInput=="" || priceInput=="" || menuSltBool == false){
			    alert("입력되지 않은 항목이 있습니다");
			    return;
			}
			
			var result = confirm("등록하시겠습니까?");
			if(result) {
				alert("등록되었습니다");
				const filePath = "gifticon";
				
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
						$("#gifticonImg").attr("value","images/gifticon/"+response);
						$("#insertForm").submit();
					},
					error : function(jqXHR) {
						alert(jqXHR.responseText); 
					}
				});			
			} else {
				return false;
			}
		}
		
		function brandSelect() {
			var brandCode = $("#brandCode").val();
			
			switch(brandCode) {
			case '1':
				$("#menuCode option").remove();
				$("#menuCode").append("<option selected disabled>메뉴를 선택해주세요</option>");
				$("#menuCode").append("<option value=1>빅맥</option>");
				$("#menuCode").append("<option value=2>1955버거</option>");
				break;
			case '2':
				$("#menuCode option").remove();
				$("#menuCode").append("<option selected disabled>메뉴를 선택해주세요</option>");
				$("#menuCode").append("<option value=1>새우버거</option>");
				$("#menuCode").append("<option value=2>불고기버거</option>");
				break;
			}
		}
		
		function menuSelect() {
			menuSltBool = true;
		}