	function view2(  adminCode ,   noticeCode )
	{
		var f = document.paging;
		
		f.adminCode.value = adminCode;
		f.noticeCode.value = noticeCode;
		f.action = "./noticeandminview"
		
		f.method= "post"
		f.submit();
	};
	 function insert(  adminCode )
	{
		var f = document.paging;
		
		f.adminCode.value = adminCode;
		
		f.action = "./insertNotice"
		
		f.method= "post"
		f.submit();
	};
	function Noticeupdatelist(  adminCode ,   noticeCode )
	{
		var f = document.paging;
		
		f.adminCode.value = adminCode;
		f.noticeCode.value = noticeCode;
		f.action = "./Noticeupdatepage"
		
		f.method= "post"
		f.submit();
	}; 
	
	 function Noticedelete( adminCode , noticeCode)
	 {
		 var g = confirm('정말 삭제하시겠습니까?')
		 
		 if(g == false)
			 {
			 	return;
			 }
		 else
			 var f = document.paging;	 
		 	f.adminCode.value = adminCode;
			f.noticeCode.value = noticeCode;
			f.action = "./Noticedelete"
			
			f.method="post"
			f.submit();
		
	 };