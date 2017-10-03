<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function depselect(id, name) {
		$.pdialog.closeCurrent("page2");
		$("#deparment_depid").val(id);
		$("#deparment_depname").val(name);
	}
	
	function deparment_add_submitForm() {
		$("#deparmentaddform").submit();
		$.pdialog.closeCurrent("deppage1");
	}
</script>
</head>
<body>
<div class="pageContent" style="border: solid 1px #B8D0D6;" >
	<form method="post" id="deparmentaddform" enctype="multipart/form-data"  action="${ctx}/deparment/insert" class="pageForm required-validate" 
		onkeydown="if(event.keyCode==13){return false;}" onsubmit="return validateCallback(this, depListCloseAjaxDone)">
		<div class="pageFormContent nowrap" layoutH="64" >
			<dl>
				<dt>部门名称：</dt>
				<dd>
					<input name="name"  id="deparment_name" type="text" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>选择父级部门：</dt>
				<dd>
					<input type="hidden" name="depid" id="deparment_depid" value=""/>
					<input id="deparment_depname" type="text" class="readonly"/>
					<a  target="dialog" href="${ctx}/deparment/queryDep"  
								title="选择部门" width="253"  mask="true" rel="page2"
					> <img src="${ctx}/images/icon/search.png" title="选择父级部门"/></a>
				</dd>
			</dl>
			<dl>
				<dt>简介：</dt>
				<dd>
					<textarea name="description" rows="5" cols="50" style="resize: none;"></textarea>
				</dd>
			</dl>
			
		</div>
		<div class="formBar">
			<ul>
				<li>
					<a class="button" href="javascript:void(0)" onclick="deparment_add_submitForm()"><span>保存</span>
					</a>
				</li>
				
			</ul>
		</div>
	</form>
</div>
</body>
</html>