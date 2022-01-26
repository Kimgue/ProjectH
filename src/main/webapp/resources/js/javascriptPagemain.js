function QnA( memberCode )
{
		var g = document.paging;
				
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
		
		if( !adminCode )
			
			{
				f.action = "./NoticeMember"
				
				f.method= "post"
					
				f.submit();
			}
		else

		f.action = "./Notice"
			
		f.submit();
		
	};