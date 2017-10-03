<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function employee_add_submitForm(){
		$("#employeeform").submit();	
	}
</script>
<script type="text/javascript" src="${ctx }/js/card.js"></script>
</head>
<body>
<div class="pageContent" style="border: solid 1px #B8D0D6;">
	<form method="post" id="employeeform" enctype="multipart/form-data"  action="${ctx}/employee/insert" class="pageForm required-validate" 
		onkeydown="if(event.keyCode==13){return false;}" onsubmit="return validateCallback(this, empListCloseAjaxDone)">
		<div class="pageFormContent nowrap" layoutH="56">
			<dl>
				<dt>所属部门：</dt>
				<dd>
					<input name="depid" id="employee_depid" type="hidden" value="${dep.id }"/>
					<input  id="employee_depname" type="text" class="required readonly" value="${dep.name }"/>
				</dd>
			</dl>
			<dl>
				<dt>员工名称：</dt>
				<dd>
					<input name="realname"  id="employee_realname" type="text" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>登录系统名：</dt>
				<dd>
					<input name="loginname"  id="employee_loginname" type="text" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>身份证号：</dt>
				<dd>
					<input name="card"  id="employee_card" type="text" class="required isIdCardNo"/>
				</dd>
			</dl>
			<dl>
				<dt>性别：</dt>
				<dd>
					<select name="sex" id="employee_sex">
						<option value="0">女</option>
						<option value="1">男</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>出生年月：</dt>
				<dd>
					<input name="birth"  id="employee_birth" type="text"  class="required date readonly"/>
				</dd>
			</dl>
			<dl>
				<dt>邮箱：</dt>
				<dd>
					<input name="email"  id="employee_email" type="text" class="required email"/>
				</dd>
			</dl>
			<dl>
				<dt>手机号：</dt>
				<dd>
					<input name="phone"  id="employee_phone" type="text" class="required isPhone"/>
				</dd>
			</dl>
			<dl>
				<dt>系统角色：</dt>
				<dd>
					<input type="radio" name="roleindex" value="2222222" checked/>user<br>
					<input type="radio" name="roleindex" value="3333"/>personnel<br>
					<input type="radio" name="roleindex" value="1111111"/>admin
				</dd>
			</dl>
			<dl>
				<dt>职位：</dt>
				<dd>
					<input type="radio" name="jobindex" value="9b410bd609e811e781a3807ae40a8479" checked/>员工<br>
					<input type="radio" name="jobindex" value="9b410bd609e811e781a3807ae40a8478"/>实习生<br>
					<input type="radio" name="jobindex" value="9b410bd609e811e781a3807ae40a8477" />部门经理
				</dd>
			</dl>
			<dl>
				<dt>简介：</dt>
				<dd>
					<textarea rows="6" cols="60" style="resize: none;"></textarea>
				</dd>
			</dl>
				
			
		</div>
		<div class="formBar" >
			<ul>
				<li>
					<a class="button" href="javascript:void(0)" onclick="employee_add_submitForm()"><span>保存</span>
					</a>
				</li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button id="reset" type="reset">清空</button>
						</div>
					</div>
				</li>
				<li>
					<a class="button" href="${ctx}/employee/list" target="ajax"
						rel="empResourceList"><span>关闭</span>
					</a>
				</li>
			</ul>
		</div>
	</form>
</div>
</body>
</html>