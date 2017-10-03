<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/include.inc.jsp"%>
<c:forEach var="item" items="${menuList}" varStatus="vs">
	<ul>
		 <li><a oncontextmenu=self.event.returnValue=false
			onclick="selectDep('${item.id}','${item.name}');"> 
					${item.name} 
				
		</a> <c:if test="${fn:length(item.children) > 0}">
				<c:set var="menuList" value="${item.children}" scope="request" />
				<c:import url="/WEB-INF/view/employee/employee_dep.jsp" />
				<!-- 这就是递归了 -->
			</c:if></li> 
	</ul>
</c:forEach>