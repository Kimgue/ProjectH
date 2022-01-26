function QnA( memberCode )
{
	 var g = confirm('로그인이 필요합니다 하시겠습니까?')
			
			if( g == false)
				{
				
				return;
				}
			else
				var f = document.paging;
			
				f.memberCode.value = memberCode;
				
				f.action = "./Question"
		
				f.method= "post"
					
				f.submit();		
				
	
	};
	function Notice( adminCode   )
	{
		let f = document.paging;
		
		f.adminCode.value = adminCode;
		
		f.action = "./Notice"
		
		f.method= "post"
			
		f.submit();
	};