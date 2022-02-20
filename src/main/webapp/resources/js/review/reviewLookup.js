	var reviewImg = '<c:out value= "${Lookup.reviewDto.reviewImg}"/>';
	var imgFile = reviewImg.split(',');
	var filePath = "images/review/"
	var reviewImg1 = filePath + imgFile[0];
	var reviewImg2 = filePath + imgFile[1];
	
	function ImgAttr(){
		$("#reviewImg1").attr("src", reviewImg1);
		$("#reviewImg2").attr("src", reviewImg2);
	}

	$(document).ready(function()
			{
				ImgAttr();
			});