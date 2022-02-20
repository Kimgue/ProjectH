	 function reply1(  memberCode ,   qstnCode )
		{
			var f = document.paging;
			
			f.memberCode.value = memberCode;
			f.qstnCode.value = qstnCode;
			f.action = "./reply"
			
			f.method= "post"
			f.submit();
		};