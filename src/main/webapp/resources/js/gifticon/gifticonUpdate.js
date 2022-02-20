	$(document).ready(function() {
		
		$(".btn").click(function() {
			
			var code = $(this).attr("id").substring(3);
			
			$("#form"+code).submit();
		});

	});