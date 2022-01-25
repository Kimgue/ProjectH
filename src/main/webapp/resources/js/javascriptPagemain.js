function QnA( memberCode )
{
	var f = document.paging;
			
			if( !memberCode)
				{
				
				alert("로그인 해주세요");
				
				return;
				}
			else
			
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