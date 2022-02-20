$(document).ready(function() {
		
		$(".btn").click(function() {
			
			var code = $(this).attr("id").substring(3);
			
			$("#form"+code).submit();
		});

	});
	</script>
	<script>
	$(document).ready(function() {
		const inputImage = document.getElementById("input-image");
		inputImage.addEventListener("change", e => {readImage(e.target)});
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
	
	function update() {
		var result = confirm("수정하시겠습니까?");
		if(result) {
			alert("수정되었습니다");
			
			const uploadPath = "gifticon";
			
			const imageInput = $("#input-image")[0];
			if(imageInput.files.length === 0){
			    alert("파일은 선택해주세요");
			    return;
			}
			
			const formData = new FormData();
			const fileName = $("#gifticonImg").val();
			
			formData.append("uploadFile", imageInput.files[0]);
			formData.append("filePath", uploadPath);
			formData.append("fileName", fileName);

			$.ajax({
				type : "POST",
				url : "fileDelete.do",
				processData : false,
				contentType : false,
				data : formData,						
				success : function(response) {
					$.ajax({
						type : "POST",
						url : "fileUpload.do",
						processData : false,
						contentType : false,
						data : formData,						
						success : function(response) {
							$("#gifticonImg").attr("value","images/gifticon/"+response);
							$("#updateGifticon").submit();
						},
						error : function(jqXHR) {
							alert(jqXHR.responseText); 
						}
					});	
				},
				error : function(jqXHR) {
					alert(jqXHR.responseText); 
				}
			});		
		} else {
			return false;
		}
		
	}