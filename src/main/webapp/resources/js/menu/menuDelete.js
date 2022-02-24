function brandSelect(brandCode) {
	var menuCode = $("select[name='menuCode']");

	menuCode.empty();
	if (brandCode == "") {
		menuCode.append("<option value=''>메뉴선택</option>")
		return;
	}

	$.ajax({
		type : 'POST',
		url : 'brandMenu.do',
		async : false,
		data : {
			"brandCode" : brandCode
		},
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(jdata) {
			if (jdata.length == 0) {
				menuCode.append("<option value=''>메뉴선택</option>")
			} else {
				$.each(jdata, function(i) {
					menuCode.append("<option value=" + jdata[i].menuCode + ">"
							+ jdata[i].menuName + "</option>");
				});
			}
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
			alert("지금은 시스템 사정으로 요청하신 작업을 처리할 수 없습니다.");
			return;
		}
	});
};

function inputCheck() {
	var brandInput = $("#brandCode").val()
	var menuInput = $("#menuCode").val()

	if (brandInput == '' || menuInput == '') {
		alert('모든 항목을 선택해주세요.');
	} else {	
		var result = confirm("삭제하시겠습니까?");
		if(result) {
			alert("삭제되었습니다.")
			$("#deleteForm").submit();
		}
	}
};

$(document).ready(function() {
	$("#deleteBtn").click(function() {	
		inputCheck();	
	});
	});