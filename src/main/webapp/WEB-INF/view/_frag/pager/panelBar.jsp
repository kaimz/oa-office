<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<div class="panelBar">
	<div class="pages">
		<span>Per Page</span>
		<select name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
			<c:forEach begin="25" end="40" step="5" varStatus="s">
				<option value="${s.index}" ${pager.numPerPage eq s.index ? 'selected="selected"' : ''}>${s.index}</option>
			</c:forEach>
		</select>
		<span>Total: ${pager.totalCount}</span>
	</div>
	
	<div class="pagination" targetType="navTab" totalCount="${pager.totalCount}" numPerPage="${pager.numPerPage}" pageNumShown="10" currentPage="${pager.pageNum}"></div>
</div>