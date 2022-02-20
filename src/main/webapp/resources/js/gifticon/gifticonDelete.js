	$(document).ready(function() {
		
		$(".col .btn").click(function() {

			var result = confirm("삭제하시겠습니까?");
			if(result) {
				alert("삭제되었습니다");
				var a = $(this).attr("id");
				const filePath = "gifticon";
				const fileName = $(".img"+a).attr("value");
				
				const formData = new FormData();
				formData.append("filePath", filePath);
				formData.append("fileName", fileName);
				
				$.ajax({
					type : "POST",
					url : "fileDelete.do",
					processData : false,
					contentType : false,
					data : formData,						
					success : function(response) {
						$("#form"+a).submit();
					},
					error : function(jqXHR) {
						alert(jqXHR.responseText); 
					}
				});
			} else {
				return false;
			}	
		});
	});