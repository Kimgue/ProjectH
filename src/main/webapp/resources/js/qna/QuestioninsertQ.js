 function update() {
      
      if ($("#qstnTitle").val().length == 0) {
         alert("제목을 입력해주세요");
         $("#qstnTitle").focus();
         return false;
      }

      if ($("#qstnContent").val().length == 0) {
         alert("내용을 입력해주세요");
         $("#qstnContent").focus();
         return false;
      }
      else 
    	  
      var a = document.paging;

		a.action ="./QuestionUpdate"
		
		a.method="post"
		a.submit();
                     
      