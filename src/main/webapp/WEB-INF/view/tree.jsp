<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include.inc.jsp"%>
<c:forEach var="item" items="${objectList}" varStatus="vs">
	<ul>
		 <li
			class="<c:if test="${item.id eq depid}">
						selected
						</c:if>"><a oncontextmenu=self.event.returnValue=false
			href="${url}?depid=${item.id}&numPerPage=${pager.numPerPage}" target="ajax" rel="${rel}"
			onclick="clearLiClass();"> 
					${item.name} 
				
		</a> <c:if test="${fn:length(item.children) > 0}">
				<c:set var="objectList" value="${item.children}" scope="request" />
				<c:import url="/WEB-INF/view/tree.jsp" />
				<!-- 这就是递归了 -->
			</c:if></li> 
	</ul>
</c:forEach>
