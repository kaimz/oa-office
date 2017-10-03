<%@ include file="/include.inc.jsp"%>

<form id="pagerForm" method="post" action="#rel#">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${pager.numPerPage}" />
	<input type="hidden" name="orderField" value="${pager.orders.key}" />
	<input type="hidden" name="orderDirection" value="${pager.orders.value}" />
</form> 