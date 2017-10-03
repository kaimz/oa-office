<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/include.inc.jsp"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$("#calendar_allDay").on('change', function(){
		if($(this).val() == "true"){
			$("#true").show();
			$("#false").hide();
			//$("#true").find("input").attr("dateFmt", "yyyy-MM-dd");
		} else {
			$("#true").hide();
			$("#false").show();
		}
		$("#true").find('input').val("");
		$("#false").find('input').val("");
	})
	
	function calendar_add_submitForm(){
		$("#calendarform").submit();
		$.pdialog.closeCurrent();
	}
	
	function closeCalendarDialog(){
		$.pdialog.closeCurrent();
	}
</script>
</head>
<body>
	<div class="pageContent" style="border: solid 1px #B8D0D6;" >
	<form method="post" id="calendarform" enctype="multipart/form-data"  action="${ctx}/calendar/add" class="pageForm required-validate" 
		onkeydown="if(event.keyCode==13){return false;}" onsubmit="return validateCallback(this, calendarcloseAjaxDone)">
		<div class="pageFormContent nowrap"  >
			<dl>
				<dt>日程名称：</dt>
				<dd>
					<input name="title"  id="calendar_title" type="text" class="required"/>
				</dd>
			</dl>
			<dl>
				<dt>全天事项：</dt>
				<dd>
					<select name="allDay" id="calendar_allDay">
						<option value="false">false</option>
						<option value="true">true</option>
					</select>
				</dd>
			</dl>
			<dl id="false" style="display: block;">
				<dt>时间:</dt>
				<dd>
					<input type="text" 
								class="date textInput readonly" dateFmt="yyyy-MM-dd HH:mm:ss" name="start0" id="calendar_StartDate"><span
								class="limit">-</span> <input type="text" id="calendar_EndDate"
								dateFmt="yyyy-MM-dd HH:mm:ss"
								class="date textInput readonly" name="end0">
				</dd>
			</dl>
			<dl id="true" style="display: none;">
				<dt>时间:</dt>
				<dd>
					<input type="text" 
						class="date textInput readonly"  name="start1" id="calendar_StartDate1">
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<a class="button" href="javascript:void(0)" onclick="calendar_add_submitForm()"><span>保存</span>
					</a>
				</li>
				
			</ul>
		</div>
	</form>
</div>
</body>
</html>