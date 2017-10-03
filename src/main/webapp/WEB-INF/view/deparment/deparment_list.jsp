<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ctx }/js/list.js"></script>
<script type="text/javascript">
 function depListCloseAjaxDone(json) {
	 DWZ.ajaxDone(json);
	 navTab.openTab("deparmentTabId",
				"${ctx}/deparment/list", {
					title : "部门管理",
					fresh : true,
					data : {}
				});
 }
 
</script>
</head>
<body>
	<div id="deparment" class="unitBox" style="margin-left: 0px;" >
	<c:import url="../_frag/pager/pagerForm.jsp"></c:import>
		<div class="pageHeader" style="height: 42px;" >
			<form method="post" rel="pagerForm" action="${ctx}/deparment/list"
				id="deparment_Form" onsubmit="return navTabSearch(this)"
				onkeydown="if(event.keyCode==13){return false;}">
				<div class="searchBar">
					<table class="searchContent">
						<tr>
							<input type="hidden" name="numPerPage" value="${pager.numPerPage}" />
							<td>部门名称：<input type="text" name="name"
								value="${pager.queryObject.name}" /></td>
							<td>
								<div class="button">
									<div class="buttonContent">
										<button type="submit" style="line-height: 25px;">搜索</button>
									</div>
								</div>
							</td>
							<td>
								<div class="button">
									<div class="buttonContent">
										<button type="reset" style="line-height: 25px;">清空</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>

		<div class="pageContent">

			<div class="panelBar">
				<ul class="toolBar">
					<li>
					<a class="add" href="${ctx}/deparment/add" target="dialog" rel="deppage1" mask="true">
						<span>新增</span>
					</a>
					</li>
					<c:if test="${fn:length(pager.list)>0}">
						<a class="delete" href="${ctx}/deparment/delete/{slt_objId}" target="ajaxTodo" title="确定要删除吗?">
							<span>删除</span>
						</a>
						<li class="line">line</li>
					</c:if>
				</ul>
			</div>
			<table class="table" width="100%" layoutH="128" rel="deparment">
				<thead>
					<tr>
						<th width="50">序号</th>
						<th width="180">名称</th>
						<th width="280">简介</th>
						<th width="140">父级部门</th>
						<th width="140">创建时间</th>
						<th width="140">更新时间</th>
						<th width="60">修改</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${pager.list}" varStatus="s">
						<tr target="slt_objId" rel="${item.id }"
						onclick="c('${item.id}','depId')">
							<td>${s.index+1}</td>
							<td><c:choose>
									<c:when test="${!empty item.name && item.name !=''}">
										<c:choose>
											<c:when test="${fn:length(item.name) > 13}">
												<c:out value="${fn:substring(item.name, 0, 13)}..." />
											</c:when>
											<c:otherwise>
												<c:out value="${item.name}" />
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise> 
									- - - -
								</c:otherwise>
								</c:choose></td>
								<td><c:choose>
									<c:when test="${!empty item.description && item.description !=''}">
										<c:choose>
											<c:when test="${fn:length(item.description) > 13}">
												<c:out value="${fn:substring(item.description, 0, 13)}..." />
											</c:when>
											<c:otherwise>
												<c:out value="${item.description}" />
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise> 
									- - - -
								</c:otherwise>
								</c:choose></td>
						<td><c:choose>
									<c:when test="${!empty item.parentid.name && item.parentid.name !=''}">
										<c:choose>
											<c:when test="${fn:length(item.parentid.name) > 13}">
												<c:out value="${fn:substring(item.parentid.name, 0, 13)}..." />
											</c:when>
											<c:otherwise>
												<c:out value="${item.parentid.name}" />
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise> 
									- - - -
								</c:otherwise>
								</c:choose></td>	
						
						
						<td><c:choose>
									<c:when
										test="${!empty item.createTime && item.createTime !=''}">
										<fmt:formatDate value="${item.createTime}"
											pattern="yyyy-MM-dd" />
									</c:when>
									<c:otherwise> 
								- - - -
							</c:otherwise>
								</c:choose></td>
								<td><c:choose>
									<c:when
										test="${!empty item.updateTime && item.updateTime !=''}">
										<fmt:formatDate value="${item.updateTime}"
											pattern="yyyy-MM-dd" />
									</c:when>
									<c:otherwise> 
								- - - -
							</c:otherwise>
								</c:choose></td>
						<td>
							<a class="icon" href="${ctx}/deparment/editor/${item.id}" target="dialog" rel="deppage3"
									title="Edit"  mask="true" >
									<img src="${ctx}/images/icon/edit.png"/>
								</a>
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="hidden" id="depId" />
			<c:import url="../_frag/pager/panelBar.jsp"></c:import>
		</div>
	</div>
</body>
</html>