<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include.inc.jsp"%>
<script type="text/javascript" src="${ctx}/js/list.js"></script>
<script type="text/javascript" src="${ctx}/js/listSubmitReset.js"></script>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="${ctx}/css/error_msg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function empListCloseAjaxDone(json) {
		DWZ.ajaxDone(json);
		// 模拟触发导航管理菜单按钮
		navTab.openTab("employeeTabId",
				"${ctx}/employee/list?depid=${depid}", {
					title : "员工管理",
					fresh : true,
					data : {}
				});
	}
	
	function export1() {
		/* $.ajax({
			url: "${ctx}/employee/export",
			type: "get",
			success: function(data) {
				debugger
			}
		}) */
		window.open("${ctx}/employee/export");
	}
</script>
<div id="empResourceList" class="pageContent">
	<!-- 左侧树的div -->
	<div layoutH="1" div="leftree"
		style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #B8D0D6; line-height: 21px; background: #fff">
		<ul class="tree treeFolder expand">
			<li><a
				href="${ctx}/employee/list?numPerPage=${pager.numPerPage}" 
				<c:if test="${empty depid || depid == ''}">class="selected"</c:if>
				target="ajax" onclick="clearLiClass();" rel="empResourceList">部门</a>
				<c:set var="objectList" value="${menuList}" scope="request"></c:set>
				<c:set var="url" value="${ctx}/employee/list"
					scope="request"></c:set> <c:set var="rel" value="empResourceList"
					scope="request"></c:set> <c:import
					url="/WEB-INF/view/tree.jsp"></c:import></li>
		</ul>
	</div>
	<c:import url="../_frag/pager/pagerForm.jsp"></c:import>
	<div id="empBox" class="unitBox" style="margin-left: 242px;">

		<div class="pageHeader" style="height: 42px;">
			<form method="post" rel="pagerForm" action="${ctx}/employee/list"
				id="empList_Form" onsubmit="return navTabSearch(this)"
				onkeydown="if(event.keyCode==13){return false;}">
				<div class="searchBar">
					<table class="searchContent">
						<tr>
							<input type="hidden" name="depid" value="${depid }" />
							<input type="hidden" name="numPerPage"
								value="${pager.numPerPage}" />
							<td>员工名：<input type="text" name="realname" id="emp_name"
								value="${pager.queryObject.realname}" /></td>
							
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
				<c:if test="${!empty depid}">
					<li><a class="add" target="ajax" rel="empResourceList"
						href="${ctx}/employee/add?depid=${depid}"
						title="添加"><span>添加</span></a></li>
				</c:if>
				<li>
						<a class="edit" href="${ctx}/employee/export">
							<span>导出所有</span>
						</a>
					</li>
				</ul>
			</div>
			<table class="table" width="100%" layoutH="128" rel="empResourceList">
				<thead>
					<tr>
						<th width="50">序号</th>
						<th width="150">员工名</th>
						<th width="120">账号</th>
						<th width="40">性别</th>
						<th width="120">出生日期</th>
						<th width="100">邮件</th>
						<th width="100">手机号</th>
						<th width="120">描述</th>
						<th width="60">职位</th>
						<th width="120">所属部门</th>
						<th width="120">入职时间</th>
						<th width="60">是否启用</th>
						<th width="60">修改</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${pager.list}" varStatus="s">
						<tr target="slt_objId" rel="${item.id }" <c:if test="${item.isusing == false}">style="color: gray;"</c:if>
							onclick="c('${item.id}','empId')">
							<td>${s.index+1}</td>
							<td>${item.realname }</td>
							<td>${item.loginname }</td>
							<td>
								<c:choose>
									<c:when test="${item.sex eq '0'}"> 
								女
							</c:when>
									<c:otherwise> 
								男
							</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when
										test="${!empty item.birth && item.birth !=''}">
										<fmt:formatDate value="${item.birth}"
											pattern="yyyy-MM-dd" />
									</c:when>
									<c:otherwise> 
										- - - -
									</c:otherwise>
								</c:choose>
							</td>
							<td>${item.email }</td>
							<td>${item.phone }</td>
							<td>
								<c:choose>
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
								</c:choose>
							</td>
							<td>${item.job.title }</td>
							<td>${item.departmentid.name }</td>
							<td><c:choose>
									<c:when
										test="${!empty item.createTime && item.createTime !=''}">
										<fmt:formatDate value="${item.createTime}"
											pattern="yyyy-MM-dd" />
									</c:when>
									<c:otherwise> 
								- - - -
							</c:otherwise>
								</c:choose>
							</td>
							<td><c:choose>
									<c:when test="${item.isusing == true}"> 
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
								<a target="dialog" href="${ctx}/employee/form?id=${item.id}&depid=${depid}"  
								title="操作" width="400" height="325" mask="true" rel="page1">
									<img src="${ctx}/images/icon/edit.png"/>
							</a>
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="hidden" id="empId" />
			<c:import url="../_frag/pager/panelBar.jsp"></c:import>
		</div>
	</div>	
	
</div>