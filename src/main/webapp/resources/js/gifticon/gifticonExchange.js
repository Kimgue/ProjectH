function rand(min, max) {
		return Math.floor(Math.random() * (max - min +1)) + min;
	}

	function insertGifticonExchange() {
		var currentPoint = $("#holdPoint").val();
		var gifticonPoint = $("#gifticonPrice").val();
		var gifticonName = $("#gifticonName").val();
		var resultPoint = currentPoint - gifticonPoint;

		if(currentPoint > gifticonPoint) {
			var result = confirm(gifticonName + " 상품을 교환하시겠습니까?\n" +
					"현재 보유 중인 포인트 : " + currentPoint + "\n" +
					"필요 포인트 : " + gifticonPoint + "\n" +
					"교환 후 잔여 포인트 : " + resultPoint
			);
			if(result) {
				alert(gifticonPoint + " 포인트를 소비하여 " + gifticonName + " 상품을 교환하였습니다\n" +
						"잔여 포인트는 " + resultPoint +"점 입니다");
				
				var url = "updatePoint.do";

				$.getJSON(url, {"point" : resultPoint}, function(json) {
					var gifticonNumber = rand(1,899999999)+100000000;
					$("#gifticonNumber").attr("value",gifticonNumber);
					$("#insertGifticonExchange").submit();
				});
			} else {
				return false;
			}
		} else {
			alert("보유 포인트가 부족합니다");
		}
	}