<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>办公管理</title>

<link href="${ctx}/lib/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${ctx}/lib/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${ctx}/lib/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="${ctx}/lib/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<style type="text/css">
.moduel-title {
	margin-top: 4px; text-align : center;
	cursor: pointer;
	height: 93px;
	text-align: center;
}

.moduel-title:HOVER {
	text-align: center;
	background-image: url(${ctx}/images/icon/leftNav_subtitlebg.png);
	background-position: center;
	background-repeat: no-repeat;
	cursor: pointer;
	height: 93px;
}

.moduel-title a:HOVER {
	text-decoration:none;
}
.moduel-title-selected {
	text-align: center;
	background-image: url(${ctx}/images/icon/leftNav_subtitlebg.png);
	background-position: center;
	background-repeat: no-repeat;
	cursor: pointer;
	height: 93px;
}

</style>
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->
<!--
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->

<script src="${ctx}/lib/dwz/js/speedup.js" type="text/javascript"></script>
<script src="${ctx}/js/dwz-extend.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/jquery.validate.js"
	type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/jquery.bgiframe.js"
	type="text/javascript"></script>
<script src="${ctx}/lib/dwz/xheditor/xheditor-1.1.14-zh-cn.min.js"
	type="text/javascript"></script>
<script
	src="${ctx}/lib/dwz/uploadify/scripts/jquery.uploadify.v2.1.0.js"
	type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script src="${ctx}/lib/dwz/chart/raphael.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/chart/g.raphael.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/chart/g.bar.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/chart/g.line.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/chart/g.pie.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/chart/g.dot.js" type="text/javascript"></script>

<script src="${ctx}/lib/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.util.date.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.validate.method.js"
	type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.regional.zh.js"
	type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.accordion.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.contextmenu.js"
	type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.resize.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.dialog.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.pagination.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.effects.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.history.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.print.js" type="text/javascript"></script>
<script src="${ctx}/lib/dwz/js/dwz.regional.zh.js"
	type="text/javascript"></script>
	
<script type="text/javascript" src="${ctx }/dwr/engine.js"></script>
<script type="text/javascript" src="${ctx }/dwr/util.js"></script>
<script type="text/javascript" src="${ctx }/dwr/interface/MessagePush.js"></script>

<script type="text/javascript">
/* dwr初始化 */
function onPageLoad(){
    var userId = '${loginuser.id}';
    MessagePush.onPageLoad(userId);

 }
/* dwr接收消息 */ 
function showMessage(autoMessage) {
	alertMsg.info(autoMessage);
	queryCount();
}
 
 
var ctx='${ctx}';
$(function(){	
	//dwz初始化
	DWZ.init("${ctx}/lib/dwz/dwz.frag.xml", {
		loginUrl:"${ctx}/login_dialog", loginTitle:"登录",	// 弹出登录对话框
		statusCode:{ok:200, error:500, timeout:301}, //【可选】
		//pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"${ctx}/lib/dwz/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
	
	//左侧菜单样式绑定
	$(".moduel-title").click(function(){
		$(".moduel-title").removeClass("moduel-title-selected");
		$(this).addClass("moduel-title-selected");
	})
	
	
});


	
</script>
</head>

<body onload="dwr.engine.setActiveReverseAjax(true);dwr.engine.setNotifyServerOnPageUnload(true);onPageLoad();">
	<div id="layout">
		<!-- header -->
		<div id="header">
			<div class="headerNav">
				<a class="logo"
					style="background:url(${ctx}/upload/logo.png) no-repeat;background-size:contain;">标志</a>
				<ul class="nav">
					<li><a>欢迎您：${loginuser.realname }</a></li>
					<li><a href="${ctx}/logout">注销</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
			<!-- navMenu 多个页面-->
		</div>
		<div id="leftside">
			<!-- 收缩栏 -->
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<!-- 菜单栏 -->
			<div id="sidebar">
				<div class="toggleCollapse">
					<div></div>
				</div>

				
				<div class="accordion" fillSpace="sidebar">
				<div class="accordionHeader">
							<h2>
								<span>Folder</span>日程管理
							</h2>
						</div>
						<div class="accordionContent">
								<div class="moduel-title">
									<a href="${ctx}/calendar/index" target="navTab" rel="calendarId" id="calendarId" title="日程管理">
										<img src="${ctx}/images/icon/appResource.png"/>
										<br/><span>日程管理</span>
									</a>
								</div>
						</div>
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>邮箱管理
							</h2>
							
						</div>
						<div class="accordionContent">
								<div class="moduel-title">
									<a href="${ctx}/schedule/list?message=1" target="navTab" rel="appResourceTabId" id="appResourceTabId" title="收件箱">
										<img src="${ctx}/images/icon/appResource.png"/>
										<br/><span>收件箱</span>
									</a>
								</div>
								<div class="moduel-title">
									<a href="${ctx}/schedule/outbox/list" target="navTab" rel="outboxId" id="outboxId" title="发件箱">
										<img src="${ctx}/images/icon/appResource.png"/>
										<br/><span>发件箱</span>
									</a>
								</div>
								<div class="moduel-title">
									<a href="${ctx}/schedule/drafts/list" target="navTab" rel="draftsId" id="draftsId" title="草稿箱">
										<img src="${ctx}/images/icon/appResource.png"/>
										<br/><span>草稿箱</span>
									</a>
								</div>
						</div>
						<c:if test="${loginuser.roleid.card == '2' }">
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>员工管理
							</h2>
						</div>
						<div class="accordionContent">
								<div class="moduel-title">
									<a href="${ctx}/employee/list" target="navTab" rel="employeeTabId" id="employeeTabId" title="员工管理">
										<img src="${ctx}/images/icon/appResource.png"/>
										<br/><span>员工管理</span>
									</a>
								</div>
						</div>
						</c:if>
						<c:if test="${loginuser.roleid.card == '2' }">
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>部门管理
							</h2>
						</div>
						<div class="accordionContent">
								<div class="moduel-title">
									<a href="${ctx}/deparment/list" target="navTab" rel="deparmentTabId" id="deparmentTabId" title="部门管理">
										<img src="${ctx}/images/icon/appResource.png"/>
										<br/><span>部门管理</span>
									</a>
								</div>
						</div>
						</c:if>
						
						<c:if test="${loginuser.roleid.card == '0' }">
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>新闻管理
							</h2>
						</div>
						<div class="accordionContent">
								<div class="moduel-title">
									<a href="${ctx}/news/list" target="navTab" rel="newsTabId" id="newsTabId" title="新闻管理">
										<img src="${ctx}/images/icon/appResource.png"/>
										<br/><span>新闻管理</span>
									</a>
								</div>
						</div>
						</c:if>
						
						</div>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<div class="tabsRight">right</div>
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p>
								<span style="font-size: 20px">欢迎使用OA办公系统！</span>
							</p>
							<p>
								<span style="display: block;float: right;">您所在的部门是 : ${loginuser.departmentid.name}</span>
							</p>
						</div>
						<div class="divider"></div>
						<table width="100%">
							<tr>
								<td style="width: 45%">
									<div style="padding: 10px 10px 0px 10px;">
										<jsp:include page="index_inc/task.jsp" flush="true" />
									</div>
								</td>
								<td style="width: 45%">
									<div style="padding: 10px 10px 0px 0px;">
									<jsp:include page="index_inc/newslist.jsp" flush="true" />
									</div>
								</td>
							</tr>
							<tr>
								<td style="width: 45%">
									<div style="padding: 10px 10px 0px 10px;">
									·	<form action="upload/uploadPic" enctype="multipart/form-data" method="post">
											<input type="file" name="pic"/>
											<input type="submit"/>
										</form>
									</div>
								</td>
								<td style="width: 45%">
									<div style="padding: 10px 10px 0px 0px;">
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		Copyright &copy; 2017 <a href="http://www.qnight.cn/"
			target="_blank">www.qnight.cn</a>
	</div>
</body>
</html>