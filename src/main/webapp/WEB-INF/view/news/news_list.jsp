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
 function newscloseAjaxDone(json) {
	 DWZ.ajaxDone(json);
	 navTab.openTab("newsTabId",
				"${ctx}/news/list", {
					title : "新闻管理",
					fresh : true,
					data : {}
				});
 }
 
</script>
</head>
<body>
	<div id="news" class="unitBox" style="margin-left: 0px;" >
	<c:import url="../_frag/pager/pagerForm.jsp"></c:import>
		<div class="pageHeader" style="height: 42px;" >
			<form method="post" rel="pagerForm" action="${ctx}/news/list"
				id="news_Form" onsubmit="return navTabSearch(this)"
				onkeydown="if(event.keyCode==13){return false;}">
				<div class="searchBar">
					<table class="searchContent">
						<tr>
							<input type="hidden" name="numPerPage" value="${pager.numPerPage}" />
							<td>新闻标题：<input type="text" name="title"
								value="${pager.queryObject.title}" /></td>
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
					<a class="add" href="${ctx}/news/add" target="ajax" rel="news" >
						<span>新增</span>
					</a>
					</li>
					<c:if test="${fn:length(pager.list)>0}">
						<a class="delete" href="${ctx}/news/delete/{slt_objId}" target="ajaxTodo" title="确定要删除吗?">
							<span>删除</span>
						</a>
						<li class="line">line</li>
					</c:if>
				</ul>
			</div>
			<table class="table" width="100%" layoutH="128" rel="news">
				<thead>
					<tr>
						<th width="50">序号</th>
						<th width="180">标题</th>
						<th width="60">新闻类型</th>
						<th width="300">简介</th>
						<th width="140">创建时间</th>
						<th width="140">更新时间</th>
						<th width="30">启用</th>
						<th width="60">修改</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${pager.list}" varStatus="s">
						<tr target="slt_objId" rel="${item.id }" <c:if test="${item.isenble == false}">style="color: gray;"</c:if>
						onclick="c('${item.id}','news')">
							<td>${s.index+1}</td>
							<td><c:choose>
									<c:when test="${!empty item.title && item.title !=''}">
										<c:choose>
											<c:when test="${fn:length(item.title) > 13}">
												<c:out value="${fn:substring(item.title, 0, 13)}..." />
											</c:when>
											<c:otherwise>
												<c:out value="${item.title}" />
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise> 
									- - - -
								</c:otherwise>
								</c:choose></td>
								<td> ${item.newstype.title }</td>
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
								<td><c:choose>
									<c:when test="${item.isenble == true}"> 
								<img src="${ctx }/images/Yes.png"
											title="启用" alt="启用" />
							</c:when>
									<c:otherwise> 
								<img src="${ctx }/images/No.png"
											title="未启用" alt="未启用" />
							</c:otherwise>
								</c:choose>
							</td>
						<td>
							<a class="icon" href="${ctx}/news/editor/${item.id}" target="ajax" rel="news" >
									<img src="${ctx}/images/icon/edit.png"/>
								</a>
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="hidden" id="newsId" />
			<c:import url="../_frag/pager/panelBar.jsp"></c:import>
		</div>
	</div>
</body>
</html>