<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(document).ready(function(){
		$("#employee_isusing").val('${emp.isusing}');
		$("input[name=roleindex][value=${emp.roleid.id}]").attr("checked",true); 
		$("input[name=jobindex][value=${emp.job.id}]").attr("checked",true); 
	});

	function employee_edit_submitForm(){
		$("#employeeeditform").submit();
		$.pdialog.closeCurrent("page1");
	}
	
	function selectDep(id, name){
		$.pdialog.closeCurrent("page2");
		$(".tree li").removeClass("selected");
		$("#employee_depid").val(id);
		$("#employee_depname").val(name);
	}
</script>
</head>
<body>
		<div class="pageContent" style="border: solid 1px #B8D0D6;" >
	<form method="post" id="employeeeditform" enctype="multipart/form-data"  action="${ctx}/employee/edit" class="pageForm required-validate" 
		onkeydown="if(event.keyCode==13){return false;}" onsubmit="return validateCallback(this, empListCloseAjaxDone)">
		<div class="pageFormContent nowrap" layoutH="64" >
			<input type="hidden" name="empid" value="${emp.id }" />
			<dl>
				<dt>员工名称：</dt>
				<dd>
					<input name="realname" value="${emp.realname }"  id="employee_realname" type="text" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>部门：</dt>
				<dd>
					<input type="hidden" name="depid" id="employee_depid" value="${emp.departmentid.id }"/>
					<input value="${emp.departmentid.name }"  id="employee_depname" type="text" class="required readonly"/>
					<a  target="dialog" href="${ctx}/employee/queryDep"  
								title="选择部门" width="253"  mask="true" rel="page2"
					> <img src="${ctx}/images/icon/search.png" title="选择部门"/></a>
				</dd>
			</dl>
			<dl>
				<dt>系统角色：</dt>
				<dd>
					<input type="radio" name="roleindex" value="2222222"/>user<br>
					<input type="radio" name="roleindex" value="3333"/>personnel<br>
					<input type="radio" name="roleindex" value="1111111"/>admin
				</dd>
			</dl>
			<dl>
				<dt>职位：</dt>
				<dd>
					<input type="radio" name="jobindex" value="9b410bd609e811e781a3807ae40a8479"/>员工<br>
					<input type="radio" name="jobindex" value="9b410bd609e811e781a3807ae40a8478"/>实习生<br>
					<input type="radio" name="jobindex" value="9b410bd609e811e781a3807ae40a8477" />部门经理
				</dd>
			</dl>
			<dl>
				<dt>是否启用：</dt>
				<dd>
					<select name="isusing" id="employee_isusing"  >
						<option value="false">不启用</option>
						<option value="true">启用</option>
					</select>
				</dd>
			</dl>
			
		</div>
		<div class="formBar">
			<ul>
				<li>
					<a class="button" href="javascript:void(0)" onclick="employee_edit_submitForm()"><span>保存</span>
					</a>
				</li>
				
			</ul>
		</div>
	</form>
</div>
</body>
</html>