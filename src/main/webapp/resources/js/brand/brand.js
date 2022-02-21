$(document).ready(function() {

	$("#store").hide();
	$("#menu").hide();
	
	
	$(".store").click(function() {
		$("#store").removeClass("animated--grow-out");
		$("#store").addClass("animated--grow-in");
		$("#store").show();
		
		var code = $(this).attr("id").substring(5);
		
		var store = $("#val"+code).val();
		
		$("#nearStore").attr("src",store);
	});
	
	$("#storeClose").click(function() {
		$("#store").removeClass("animated--grow-in");
		$("#store").addClass("animated--grow-out");
		$("#nearStore").attr("src","");
		setTimeout(hide,200);
	});	
	
	function hide() {
		$("#store").hide();
	}

	function menuHide() {
		$("#menu").hide();
	}
	
	$("#menuClose").click(function() {
		$("#menu").removeClass("animated--grow-in");
		$("#menu").addClass("animated--grow-out");
		$("#brandMenu").attr("src","");
		setTimeout(menuHide,200);
	});	
	
	$(".menu").click(function() {
		$("#menu").removeClass("animated--grow-out");
		$("#menu").addClass("animated--grow-in");
		$("#menu").show();
		
		var code = $(this).attr("id").substring(4);
		
		var menu = $("#menuVal"+code).val();
		
		$("#brandMenu").attr("src",menu);
	});
});