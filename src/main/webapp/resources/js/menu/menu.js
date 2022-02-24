		function inputCheck(){
		
			$("form").submit();
		/*if(
				
		$("input:checkbox[name='brandCode']").is(":checked") == false &&
			$("input:checkbox[name='menuIngredients']").is(":checked") == false &&
			$("input[name='menuPrice']").val().trim() == '' &&
			$("input[name='menuName']").val().trim() == '')
			{
				alert("검색 조건을 입력해주세요");
				
			};*/	
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
		
		$("#menuSearch").click(function() {	
			inputCheck();
			
		});
	
		$("#menuHighPrice").click(function(){
			menuHighPrice();
		});
		$("#menuLowPrice").click(function(){
			menuLowPrice();
		});
		
	});