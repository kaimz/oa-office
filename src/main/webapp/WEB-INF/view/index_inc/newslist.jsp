<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/include.inc.jsp"%>
<script>
function newsDetails(id) {
	 navTab.openTab("newsDetails",
				"${ctx}/news/details/"+id, {
					title : "新闻详情",
					fresh : true,
					data : {}
				});
}
</script>
<div style="padding: 10px 10px 0px 0px;">
<input type="hidden" id="hidden_newsid" />
	<div class="panel" minH="325">
		<h1>News</h1>
		<div style="height:325px;">
			<iframe id="iframe1" src="newsindex" width="500px" height="320px"></iframe>
		</div>
	</div>
</div>