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
				<span style="font-family: sans-serif;">${schedule.title }</span>
			</dd>
		</dl>
		<dl>
			<dt>收件人：</dt>
			<dd>
				<c:forEach var="list" items="${schedule.semails }" varStatus="s">
								<span style="margin-left: 5px;">${list.sendid.realname }</span>
							</c:forEach>
			</dd>
		</dl>
		
		<dl>
			<dt>创建时间：</dt>
			<dd>
				<span>${schedule.createTime }</span>
			</dd>
		</dl>
		<dl>
			<dt>内容:</dt>
			<dd>
				<span>${schedule.description }</span>	
			</dd>
		</dl>
		<c:if test="${schedule.parentid != null }">
			<dl>
				<dt>回复:</dt>
				<dd>
					<h4>${schedule.parentid.title }</h4>	
					<span>${schedule.parentid.description}</span>
				</dd>
			</dl>
		</c:if>
	</div>
	<div class="formBar">
		<ul>
			<li><a class="button"
					href="${ctx}/schedule/outbox/transpond/${schedule.id}"
					target="ajax" rel="outbox">
					<span>转发</span>
				</a>
			</li>
		
			<li><a class="button"
					href="${ctx}/schedule/outbox/list"
					target="ajax" rel="outbox">
					<span>关闭</span>
				</a>
			</li>
		</ul>
	</div>
</div>
</body>
</html>