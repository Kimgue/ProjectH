
		function brandSelect() {
			var brandCode = $("#brandCode").val();
			
			switch(brandCode) {
			case '1':
				$("#menuCode option").remove();
				$("#menuCode").append("<option selected disabled>메뉴를 선택해주세요</option>");
				$("#menuCode").append("<option value=1>빅맥</option>");
				$("#menuCode").append("<option value=2>1955버거</option>");
				break;
			case '2':
				$("#menuCode option").remove();
				$("#menuCode").append("<option selected disabled>메뉴를 선택해주세요</option>");
				$("#menuCode").append("<option value=1>새우버거</option>");
				$("#menuCode").append("<option value=2>불고기버거</option>");
				break;
			}
		}
		