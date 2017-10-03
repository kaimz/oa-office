<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function outboxcloseAjaxDone(json) {
		DWZ.ajaxDone(json);
		// 模拟触发导航管理菜单按钮
		navTab.openTab("outboxId", "${ctx}/schedule/outbox/list", {
			title : "发件箱",
			fresh : true,
			data : {}
		});
	}

	function outboxonchangeHandle(obj) {
		if (obj.checked) {
			$("#outbox_hidden_form")
					.append(
							"<input type='hidden' name='id' value='"+obj.id+"' id='outbox_hidden_"+obj.id+"'>");
		} else {
			$("#outbox_hidden_" + obj.id).remove();
		}
	}

	function outboxselectAll(obj) {
		if (obj.checked) {
			$("input[name=id]")
					.each(
							function() {
								var id = $(this).val();
								$("#hidden_" + id).remove();
								$("#outbox_hidden_form")
										.append(
												"<input type='hidden' name='id' value='"+id+"' id='outbox_hidden_"+id+"'>");
							});
		} else {
			$("input[name=id]").each(function() {
				var id = $(this).val();
				$("#outbox_hidden_" + id).remove();
			});
		}
	}
	function outbox_delete() {

		alertMsg.confirm("您确定删除吗？", {
			okCall : function() {
				if ($("#outbox_hidden_form input").length > 0) {
					$("#outbox_hidden_form").submit();
				} else {
					alertMsg.error("您还未选择邮件！");
				}
			},
			cancelCall : function() {

			}
		});
	}
</script>
<body>
	<div id="outbox" class="unitBox" style="margin-left: 0px;">
		<c:import url="../_frag/pager/pagerForm.jsp"></c:import>
		<div class="pageHeader" style="height: 42px;">
			<form method="post" rel="pagerForm"
				action="${ctx}/schedule/outbox/list" id="outbox_Form"
				onsubmit="return navTabSearch(this)"
				onkeydown="if(event.keyCode==13){return false;}">
				<div class="searchBar">
					<table class="searchContent">
						<tr>
							<input type="hidden" name="numPerPage"
								value="${pager.numPerPage}" />
							<td>标题：<input type="text" name="title"
								value="${pager.queryObject.title}" /></td>
							<td>接收时间：<input type="text"
								value="<fmt:formatDate value="${pager.createTimeMin}"
								pattern="yyyy-MM-dd"/>"
								readonly="readonly" class="date" name="createTimeMin"><span
								class="limit">-</span> <input type="text"
								value="<fmt:formatDate value="${pager.createTimeMax}"
								pattern="yyyy-MM-dd"/>"
								readonly="readonly" class="date" name="createTimeMax">
							</td>
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
					<li><c:if test="${fn:length(pager.list)>0}">
							<li><a class="delete" "
							href="javascript:void(0)"
								onclick="outbox_delete()"><span>删除</span></a></li>
							<li class="line">line</li>
						</c:if>
				</ul>
			</div>
			<table class="table" width="100%" layoutH="128" rel="appResourceList">
				<thead>
					<tr>
						<th style="width: 20;"><input type="checkbox"
							class="checkboxCtrl" group="id" onchange="outboxselectAll(this)"
							title="全选" /></th>
						<th width="50">序号</th>
						<th width="180">标题</th>

						<th width="180">接收人</th>
						<th width="140">创建时间</th>
						<th width="60">查看详情</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${pager.list}" varStatus="s">
						<tr target="slt_objId" rel="${item.id }">
							<td><input type="checkbox" name="id" value="${item.id}"
								id="${item.id}" onchange="outboxonchangeHandle(this)" />
							</td>
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

							<td><c:forEach var="list" items="${item.semails }"
									varStatus="s">
									<span style="margin-left: 5px;">${list.sendid.realname }</span>
								</c:forEach></td>

							<td><c:choose>
									<c:when
										test="${!empty item.createTime && item.createTime !=''}">
										<fmt:formatDate value="${item.createTime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</c:when>
									<c:otherwise> 
								- - - -
							</c:otherwise>
								</c:choose></td>
							<td><a class="icon"
								href="${ctx}/schedule/outbox/detail/${item.id}" target="ajax"
								rel="outbox" title="查看邮件"> <img
									src="${ctx}/images/icon/search.png" />
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form id="outbox_hidden_form" action="schedule/outbox/delete"
				method="post"
				onsubmit="return validateCallback(this,outboxcloseAjaxDone)">

			</form>
			<c:import url="../_frag/pager/panelBar.jsp"></c:import>
		</div>
	</div>
</body>
</html>