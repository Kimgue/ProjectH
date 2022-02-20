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