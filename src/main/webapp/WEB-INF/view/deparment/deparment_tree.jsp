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
<div layoutH="1" div="leftree"
		style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #B8D0D6; line-height: 21px; background: #fff">
		<ul class="tree treeFolder expand">
		<li>
		<a onclick="depselect('','');">部门</a>
<c:set var="menuList" value="${menuList}" scope="request"></c:set>
<c:import url="/WEB-INF/view/deparment/deparment_dep.jsp"></c:import>
</li>
</ul>
</div>
</body>
</html>