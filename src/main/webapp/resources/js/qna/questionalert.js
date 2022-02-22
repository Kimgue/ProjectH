	var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${url}'/>";
	
	if(msg != null && msg !='')
	{
	alert(msg);
	location.href = url;
	}