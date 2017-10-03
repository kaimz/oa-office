<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include.inc.jsp"%>
<script type="text/javascript" src="${ctx}/js/list.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

a, img {
	border: 0;
}

body {
	font: 12px/180% Arial, Helvetica, sans-serif, "新宋体";
}

.container {
	width: 940px;
	margin: 0 auto;
}
</style>



<link rel="stylesheet" href="${ctx}/css/calendar/style.css">



<!--必要样式-->

<link rel="stylesheet" href="${ctx}/css/calendar/fullcalendar.css">

<link rel="stylesheet" href="${ctx}/css/calendar/fullcalendar.print.css"
	media='print'>
<script type="text/javascript" src="${ctx}/js/fullcalendar.min.js"></script>
<script type="text/javascript">
	function calendarcloseAjaxDone(json) {
		DWZ.ajaxDone(json);
		/* 模拟触发导航管理菜单按钮 */
		navTab.openTab("calendarId", "${ctx}/calendar/index", {
			title : "日程管理",
			fresh : true,
			data : {}
		});
	}

	$(document).ready(function() {
		$.ajax({
			type : 'get',
			url : 'calendar/queryCalendar',
			data : {
				userid : function() {
					return $("#userid").val();
				}
			},
			success : function(data) {
				
				var json = [];

				for (var i = 0; i < data.length; i++) {
					var index = data[i];
					var obj;
					if (index.allDay) {
						obj = {
							id : index.id,
							title : index.title,
							start : new Date(index.start),
							allDay : true
						}
					} else {
						obj = {
							id : index.id,
							title : index.title,
							start : new Date(index.start),
							end : new Date(index.end),
							allDay : false
						}
					}
					json.push(obj);
				}
				if ($('.calendar').length > 0) {
					$('.calendar').fullCalendar({
						header : {
							left : 'prev,next,today',
							center : 'title',
							right : 'month,agendaWeek,agendaDay'
						},
						buttonText : {
							today : '跳转到当天'
						},
						editable : true,
						events : json
					});
				}
			}
		})

	})
</script>

<div id="calendarList" class="pageContent">
	<input type="hidden" id="userid" value="${userid }" />
	<!-- 左侧树的div -->
	<div layoutH="1" div="leftree" class="tree"
		style="float: left; display: block; overflow: auto; width: 140px; border: solid 1px #B8D0D6; line-height: 21px; background: #fff">
		<ul class="tree treeFolder expand">
			<li><a href="${ctx}/calendar/index" rel="calendarList"
				target="ajax" onclick="clearLiClass();">${loginuser.departmentid.name }</a>
				<ul>
					<li><a href="${ctx}/calendar/index" rel="calendarList"
						target="ajax"
						<c:if test="${loginuser.id == userid }">class="selected"</c:if>
						onclick="clearLiClass();">${loginuser.realname}</a></li>
					<c:forEach var="item" items="${list}" varStatus="s">
						<li><a href="${ctx}/calendar/index?userid=${item.id}"
							rel="calendarList" target="ajax"
							<c:if test="${item.id == userid }">class="selected"</c:if>
							onclick="clearLiClass();">${item.realname}</a></li>
					</c:forEach>
				</ul>
			<li>
		</ul>
	</div>

	<div id="calendarBox" class="unitBox" style="margin-left: 142px;">

		<div class="pageContent">

			<div class="panelBar">
				<ul class="toolBar">
					<c:if test="${loginuser.id == userid }">
						<li><a class="add" target="dialog" mask="true"
							maxable="false" resizable="false" width="600" height="250"
							href="${ctx}/calendar/addCalendar" title="添加日程"><span>添加日程</span></a></li>
					</c:if>
				</ul>

			</div>

			<div class="container">

				<div class="content">

					<div class="row-fluid">

						<div class="span12">

							<div class="box">

								<div class="box-head">

									<h3>Calendar</h3>
									<h3 style="float: right;">${topreview }的日程</h3>
								</div>

								<div class="box-content box-nomargin">

									<div class="calendar"></div>

								</div>

							</div>

						</div>

					</div>

				</div>

			</div>


		</div>
	</div>
</div>