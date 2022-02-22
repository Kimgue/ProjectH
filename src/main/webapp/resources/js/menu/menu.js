	function inputCheck(){
		
		if(
			$("input:checkbox[name='brandCode']").is(":checked") == false &&
			$("input:checkbox[name='menuIngredients']").is(":checked") == false &&
			$("input[name='menuPrice']").val().trim() == '' &&
			$("input[name='menuName']").val().trim() == ''
		)
			{
				alert("검색 조건을 입력해주세요");
				return false;
			};
	}
	
	var menuPriceHigh = function(url){
		
		$.ajax({
			type: 'get',
			url: 'menuPriceHigh.do',
			data: "",
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data){
				$('#menu_list').html(data)
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	
	var menuPriceLow = function(url){
		
		$.ajax({
			type: 'get',
			url: 'menuPriceLow.do',
			data: "",
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data){
				$('#menu_list').html(data)
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	};
	
	$(document).ready(function(){
		$("form").submit(function() {	
			inputCheck();
			

		
		});
		
		$("#menuHighPrice").click(function(){
			menuHighPrice();
		});
		$("#menuLowPrice").click(function(){
			menuLowPrice();
		});
		
		
		// 메뉴 검색 버튼 클릭
		$("#menuSearchForm").click(function() {
			
			// b(브랜드), m(재료), n(이름), p(가격) 변수 선언
			var bCode = "";
			var mCode = "";
			var nCode = "";
			var pCode = "";
			
			// 브랜드 체크한거 검사해서 bCode에 적립시킴
			$("input:checkbox[name='brandCode']:checked").each(function() {
				if(bCode == ""){
					bCode = $(this).val();
				} else {
					bCode = bCode + "," + $(this).val();
				}
			});
			
			// 재료 체크한거 검사해서 mCode에 적립시킴			
			$("input:checkbox[name='menuIngredients']:checked").each(function() {
				if(mCode == ""){
					mCode = $(this).val();
				} else {
					mCode = mCode + "," + $(this).val();
				}
			});
			
			// 이름 검사
			nCode = $("#menuName").val();
			
			// 가격 검사			
			pCode = $("#menuPrice").val();
			
			// 브랜드를 하나라도 선택했다면 쿼리스트링 등록
			if(bCode != "") {
				bCode = "brandCode=" + bCode + "&";
			}
			
			// 메뉴를 하나라도 선택했다면 쿼리스트링 등록			
			if(mCode != "") {
				mCode = "menuIngredients=" + mCode + "&";
			}
			
			// 이름을 적었으면 쿼리스트링 등록
			if(nCode != "") {
				nCode = "menuName=" + nCode + "&";
			}

			// 이름을 적었으면 쿼리스트링 등록
			if(pCode != "") {
				pCode = "menuPrice=" + pCode + "&";
			}
			
			// 아무 조건 없이 검색할 시 초기 검색, 조건이 하나라도 있을 시 조건 검색
			if(bCode == "" && mCode == "" && nCode == "" && pCode == "") {
				var menu = "menuResult?menuPrice=&menuName=";
			} else {
				var menu = "menuResult?" + bCode + mCode + nCode + pCode;
			}
			
			// iframe 방식은 문제가 많아서 페이지 이동으로
			$(location).attr("href","http://localhost:8085/WebProject/"+menu);

		});
	});