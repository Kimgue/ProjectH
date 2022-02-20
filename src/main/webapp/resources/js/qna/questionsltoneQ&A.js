		function Quesdelete( memberCode , qstnCode)
		{
			 var g = confirm('정말 삭제하시겠습니까?')
			 
			 if(g == false)
				 {
				 	return;
				 }
			 else
				var f = document.paging;	 
			 	f.memberCode.value = memberCode;
				f.qstnCode.value = qstnCode;
				f.action = "./Questiondelete"
			    
				f.method="post"
				f.submit();
		};
			function update()
			{
				var a = document.paging;
		
				a.action ="./view1"
				
				a.method="post"
				a.submit();
			
			}; 