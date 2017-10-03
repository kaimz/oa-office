<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function submitForm() {
	var form = new FormData(document.getElementById("fileForm"));
	
	$.ajax({
    	type: "POST",
    	url:"${ctx}/test/upload",
    	data:form,
    	async: false,
    	contentType: false,  
		processData: false,  
    	error: function(request) {
        	alert("读取失败！！");
    	},
    	success: function(data) {
        	debugger
   		}
	});
}

</script>

</head>
<body>
	<form id="fileForm" enctype="multipart/form-data">
		<input type="file" name="file" /> <a href="javascript:void(0);"
			onclick="submitForm()">提交</a>
	</form>
</body>
</html>