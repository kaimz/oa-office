<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="pageContent" style="border: solid 1px #B8D0D6;">
	<div class="pageFormContent nowrap" layoutH="55">
		<dl>
			<dt>标题：</dt>
			<dd>
				<span style="font-family: sans-serif;">${semail.scheduleid.title }</span>
			</dd>
		</dl>
		<dl>
			<dt>发件人：</dt>
			<dd>
				<span>${semail.scheduleid.employeeid.realname }</span> <span style="color: #7F7F7F">(${semail.scheduleid.employeeid.email })</span>
			</dd>
		</dl>
		<dl>
			<dt>接收时间：</dt>
			<dd>
				<span>${semail.createTime }</span>
			</dd>
		</dl>
		<dl>
			<dt>内容:</dt>
			<dd>
				<span>${semail.scheduleid.description }</span>	
			</dd>
		</dl>
		<c:if test="${semail.scheduleid.parentid != null }">
			<dl>
				<dt>回复:</dt>
				<dd>
					<h4>${semail.scheduleid.parentid.title }</h4>	
					<span>${semail.scheduleid.parentid.description}</span>
				</dd>
			</dl>
		</c:if>
	</div>
	<div class="formBar">
		<ul>
			<li><a class="button"
					href="${ctx}/schedule/tosend?id=${semail.scheduleid.id }"
					target="ajax" rel="appResourceList">
					<span>回复</span>
				</a>
			</li>
			<li><a class="button"
					href="${ctx}/schedule/list?message=${schedulemessage}"
					target="ajax" rel="appResourceList">
					<span>关闭</span>
				</a>
			</li>
		</ul>
	</div>
</div>
</body>
</html>