<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/include.inc.jsp"%>
<script>
	$(document).ready(function(){
		queryCount();
	})
	
	function queryCount(){
		$.get("queryCount",function(data){
			$("#emailcount").text(data);
		});
	}
</script>
<div style="padding: 10px 10px 0px 0px;">
	<div class="panel" minH="325">
		<h1>待处理事务</h1>
		<div style="min-height:325px;height:auto !important;height:325px;">
			<table class="list" width="98%">
				<tr>
					<td>待处理的邮件：</td>
					<td><a href="${ctx}/schedule/list?message=1"
						target="navTab" rel="appResourceTabId" title="收件箱" id="emailcount"> ${email} </a>封
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>