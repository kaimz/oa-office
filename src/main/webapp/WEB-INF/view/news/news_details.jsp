<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:960px;margin:20px auto;border:1px solid #CDCDCF;">
					<div style="height:auto;padding-bottom:30px;">
						<div style="text-align:center;margin:30px 0 20px;font-size:24px;">${news.title}</div>
						<div style="text-align:center;margin-bottom:10px;">
							<span>作者：${creater}</span>
							<span>创建时间：<fmt:formatDate value="${news.createTime }"
								pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</div>
						<div style="width:930px;margin:auto;text-indent:2em;word-break:break-all;letter-spacing:1px;line-height:18px;overflow:auto">
							<span>
								<c:if test="${!empty news.content}" >
									${news.content}
								</c:if>
							</span>
						</div>
					</div>
					
</div>
</body>
</html>