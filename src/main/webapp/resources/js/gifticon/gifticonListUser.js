function dateFormat(date) {
	    let month = date.getMonth() + 1;
	    let day = date.getDate();
	    let hour = date.getHours();
	    let minute = date.getMinutes();
	    let second = date.getSeconds();
	
	    month = month >= 10 ? month : '0' + month;
	    day = day >= 10 ? day : '0' + day;
	    hour = hour >= 10 ? hour : '0' + hour;
	    minute = minute >= 10 ? minute : '0' + minute;
	    second = second >= 10 ? second : '0' + second;
	
	    return date.getFullYear() + '년 ' + month + '월 ' + day + '일 ';
	}
	
	$(document).ready(function() {
		var abc = $("#gifticonDate:first").val();
		var month = new Date(abc);
		
		var currentMonth = dateFormat(month);
		month.setMonth(month.getMonth() +1);
		var nextMonth = dateFormat(month);
		
		$("#currentMonth").text(currentMonth);
		$("#nextMonth").text(nextMonth);

		$(".btn").click(function() {
			
			var code = $(this).attr("id").substring(3);
			<c:choose>
			<c:when test="${loginBool eq true}">
				$("#form"+code).submit();
			</c:when>
			
			<c:otherwise>
				alert("로그인이 필요합니다");
				document.location.href = "userLogin";
			</c:otherwise>
		</c:choose>
		});
	});