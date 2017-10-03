<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include.inc.jsp"%>
<script type="text/javascript" src="${ctx}/js/list.js"></script>
<script type="text/javascript" src="${ctx}/js/listSubmitReset.js"></script>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="${ctx}/css/error_msg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
 	function schedulecloseAjaxDone(json) {
		DWZ.ajaxDone(json);
		// 模拟触发导航管理菜单按钮
		navTab.openTab("appResourceTabId",
				"${ctx}/schedule/list", {
					title : "收件箱",
					fresh : true,
					data : {}
				});
	} 
 	
 	function onchangeHandle(obj){
		if(obj.checked){
			$("#schedule_hidden_form").append("<input type='hidden' name='id' value='"+obj.id+"' id='hidden_"+obj.id+"'>");
		}else{
			$("#hidden_"+obj.id).remove();
		}
	}
 	
 	function selectAll(obj){
		if(obj.checked){
			$("input[name=id]").each(function(){
				var id=$(this).val();
				$("#hidden_"+id).remove();
				$("#schedule_hidden_form").append("<input type='hidden' name='id' value='"+id+"' id='hidden_"+id+"'>");
			});
		}else{
			$("input[name=id]").each(function(){
				var id=$(this).val();
				$("#hidden_"+id).remove();
			});
		}
	}
 	
 	function _mark() {
		alertMsg.confirm("您确定标记为已读吗？", {
			 okCall: function(){
				 if($("#schedule_hidden_form input").length > 0) {
					 $("#schedule_hidden_form").attr('action', '/oa-office/schedule/mark');
					 $("#schedule_hidden_form").submit();
				 } else {
					 alertMsg.error("您还未选择邮件！");
				 }
			 },
			 cancelCall : function() {
				 
			 }
			});
		
 	}
 	
 	function _delete() {
 		alertMsg.confirm("您确定删除吗？", {
			 okCall: function(){
				 if($("#schedule_hidden_form input").length > 0) {
					 $("#schedule_hidden_form").attr('action', '/oa-office/schedule/delete');
					 $("#schedule_hidden_form").submit();
				 } else {
					 alertMsg.error("您还未选择邮件！");
				 }
			 },
			 cancelCall : function() {
				 
			 }
			});
		
	}
</script>
<div id="appResourceList" class="pageContent">
	<!-- 左侧树的div -->
	<div layoutH="1" div="leftree"
		style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #B8D0D6; line-height: 21px; background: #fff">
		<ul class="tree treeFolder expand">
			<c:choose>
				<c:when test="${schedulemessage==1 }">
					<li class="selected"><a href="${ctx}/schedule/list?message=1&numPerPage=${pager.numPerPage}" target="ajax" onclick="clearLiClass();"
				rel="appResourceList">未查看</a>
			</li>
				</c:when>
				<c:otherwise>
					<li><a href="${ctx}/schedule/list?message=1&numPerPage=${pager.numPerPage}" target="ajax" onclick="clearLiClass();"
				rel="appResourceList">未查看</a>
			</li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${schedulemessage==2 }">
					<li class="selected"><a href="${ctx}/schedule/list?message=2&numPerPage=${pager.numPerPage}" target="ajax" onclick="clearLiClass();"
				rel="appResourceList">已查看</a>
			</li>
				</c:when>
				<c:otherwise>
					<li><a href="${ctx}/schedule/list?message=2&numPerPage=${pager.numPerPage}" target="ajax" onclick="clearLiClass();"
				rel="appResourceList">已查看</a>
			</li>
				</c:otherwise>
			</c:choose>
		
			<c:choose>
				<c:when test="${schedulemessage==3 }">
					<li class="selected"><a href="${ctx}/schedule/list?message=3&numPerPage=${pager.numPerPage}" target="ajax" onclick="clearLiClass();"
				rel="appResourceList">全部</a>
			</li>
				</c:when>
				<c:otherwise>
					<li><a href="${ctx}/schedule/list?message=3&numPerPage=${pager.numPerPage}" target="ajax" onclick="clearLiClass();"
				rel="appResourceList">全部</a>
			</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	
	<div id="appBox" class="unitBox" style="margin-left: 242px;" >
	<c:import url="../_frag/pager/pagerForm.jsp"></c:import>
		<div class="pageHeader" style="height: 42px;" >
			<form method="post" rel="pagerForm" action="${ctx}/schedule/list"
				id="appList_Form" onsubmit="return navTabSearch(this)"
				onkeydown="if(event.keyCode==13){return false;}">
				<div class="searchBar">
					<table class="searchContent">
						<tr>
							<input type="hidden" name="message" value="${schedulemessage}" />
							<input type="hidden" name="numPerPage" value="${pager.numPerPage}" />
							<td>标题：<input type="text" name="scheduleid.title"
								value="${pager.queryObject.scheduleid.title}" /></td>
							<td>发送人：<input type="text" name="scheduleid.employeeid.realname"
								id="appList_Creater" value="${pager.queryObject.scheduleid.employeeid.realname}" /></td>
							<td>接收时间：<input type="text" 
								value="<fmt:formatDate value="${pager.createTimeMin}"
								pattern="yyyy-MM-dd"/>"
								readonly="readonly" class="date" name="createTimeMin"><span
								class="limit">-</span> <input type="text" id="app_EndDate"
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
					<li><a class="add" target="ajax" rel="appResourceList"
						href="${ctx}/schedule/tosend"
						title=">去发送邮件"><span>去发送邮件</span></a></li>
					<c:if test="${fn:length(pager.list)>0}">
						<li><a class="edit"
							href="javascript:void(0)" onclick="_mark()"
							><span>标记为已读</span></a></li>
						<li><a class="delete""
							href="javascript:void(0)" onclick="_delete()"
							><span>删除</span></a></li>
						<li class="line">line</li>
					</c:if>
				</ul>
			</div>
			<table class="table" width="100%" layoutH="128" rel="appResourceList">
				<thead>
					<tr>
						<th style="width:20;">
								<input type="checkbox" class="checkboxCtrl" group="id" onchange="selectAll(this)" title="全选"/>
						</th>
						<th width="50">序号</th>
						<th width="180">标题</th>
						
						<th width="60">发送人</th>
						<th width="140">接收时间</th>
						<th width="60">是否查看</th>
						<th width="60">查看</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${pager.list}" varStatus="s">
						
						<tr target="slt_objId" rel="${item.id }" <c:if test="${item.isview == true}">style="color: gray;"</c:if>
							onclick="c('${item.id}','appId')">
							<td>
								<input type="checkbox" name="id" value="${item.id}" id="${item.id}"
								onchange="onchangeHandle(this)"
								/>
							</td>
							<td>${s.index+1}</td>
							<td><c:choose>
									<c:when test="${!empty item.scheduleid.title && item.scheduleid.title !=''}">
										<c:choose>
											<c:when test="${fn:length(item.scheduleid.title) > 13}">
												<c:out value="${fn:substring(item.scheduleid.title, 0, 13)}..." />
											</c:when>
											<c:otherwise>
												<c:out value="${item.scheduleid.title}" />
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise> 
									- - - -
								</c:otherwise>
								</c:choose></td>
							
						<td><c:choose>
									<c:when
										test="${!empty item.scheduleid.employeeid.realname && item.scheduleid.employeeid.realname !=''}">
										${item.scheduleid.employeeid.realname }
									</c:when>
									<c:otherwise> 
								- - - -
							</c:otherwise>
							</c:choose></td>
						
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
						<td><c:choose>
									<c:when test="${item.isview == true}"> 
								已查看
							</c:when>
									<c:otherwise> 
								待查看
							</c:otherwise>
								</c:choose></td>
						
						<td>
							<a class="icon" href="${ctx}/schedule/list/detail/${item.id}/${schedulemessage}" target="ajax" rel="appResourceList"
									title="查看邮件" >
									<img src="${ctx}/images/icon/search.png"/>
								</a>
						</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
			<input type="hidden" id="appId" />
			<form id="schedule_hidden_form" action="" method="post" onsubmit="return validateCallback(this,schedulecloseAjaxDone)">
				
			</form>
			<c:import url="../_frag/pager/panelBar.jsp"></c:import>
		</div>
	</div>
</div>