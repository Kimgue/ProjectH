 	function view(  memberCode ,   qstnCode )
	{
		var f = document.paging;
		
		f.memberCode.value = memberCode;
		f.qstnCode.value = qstnCode;
		f.action = "./sltOneQnA"
		
		f.method= "post"
		f.submit();
	};
	function insert()
	{
		var f = document.paging;
		
		f.action = "./insertQnA"
		
		f.method= "post"
		f.submit();
	}; 
	
	//페이지 번호 이동
	$('#pagingDiv a').click(function(e){
		e.preventDefault();
		$('#pageNum').val($(this).attr("href"));
		pagingForm.submit();
		
	});