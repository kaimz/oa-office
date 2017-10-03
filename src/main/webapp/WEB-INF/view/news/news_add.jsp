<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function news_add_submitForm() {
		if (!$("#description").val()) {
			$("#hiddenSpan").html('');
			$("#hiddenSpan").append($("#textarea").val());
			$("[name=description]").val($("#hiddenSpan").text().substring(0, 20));
		}
		
		
		$("#newsform").submit();
	}
	
	$(document).ready(function(){
		$("[name=isenble]").val('${baseNews.isenble}');
	});
</script>
</head>
<body>
	<div class="pageContent" style="border: solid 1px #B8D0D6;">
		<form method="post" id="newsform" enctype="multipart/form-data"
			action="${ctx}/news/insert" class="pageForm required-validate"
			onkeydown="if(event.keyCode==13){return false;}"
			onsubmit="return validateCallback(this, newscloseAjaxDone)">
			<div class="pageFormContent nowrap" layoutH="56">
				<c:if test="${!empty baseNews.id}"><input type="hidden" name="id" value="${baseNews.id}"/></c:if>
				<input type="hidden" name="employee" value="<c:if test="${!empty baseNews.employee}">${baseNews.employee}</c:if>"/>
				<dl>
					<dt>新闻标题：</dt>
					<dd>
						<input name="title" id="news_title" type="text" class="required"
							value="<c:if test="${!empty baseNews.title}">${baseNews.title}</c:if>" />
					</dd>
				</dl>
				<dl>
					<dt>新闻类型：</dt>
					<dd>
						<select class="required" name="newstype.id" >
							<c:forEach var="list" items="${newType }">
								<option value="${list.id }" <c:if test="${!empty baseNews.newstype.id && baseNews.newstype.id eq list.id}">selected ="selected"</c:if>>${list.title }</option>
							</c:forEach>
						</select>
					</dd>
				</dl>
				<dl>
					<dt>是否启用：</dt>
					<dd>
						<select name="isenble">
							<option value="true">启用</option>
							<option value="false">不启用</option>
						</select>
					</dd>
				</dl>
				<dl>
					<dt>内容：</dt>
					<dd>

						<textarea class="required editor xheditor {urlType:'root'}"
							id="textarea" name="content" rows="15" cols="100"
							upLinkUrl="${ctx}/schedule/upload"
							upImgUrl="${ctx}/schedule/upload"
							upFlashUrl="${ctx}/schedule/upload"
							upMediaUrl="${ctx}/schedule/upload" cleanPaste="1">
						<c:if test="${!empty baseNews.content}">${baseNews.content}</c:if>
					</textarea>
					</dd>
				</dl>
				<dl>
					<dt>简介：</dt>
					<dd>
						<textarea id="description" name="description" rows="5" cols="60" style="resize: none;" placeholder="请用一句话介绍这篇文章,不输入，默认自动生成内容前20字。"><c:if test="${!empty baseNews.description}">${baseNews.description}</c:if></textarea>
					</dd>
				</dl>
			</div>
			<div class="formBar">
				<ul>
					<li><a class="button" href="javascript:void(0)"
						onclick="news_add_submitForm()"><span>保存</span> </a></li>
					<li><a class="button" href="${ctx }/news/list"
						 target="ajax" rel="news"><span>关闭</span> </a></li>
				</ul>
			</div>
		</form>
		<span id="hiddenSpan" style="display: none"></span>
	</div>
</body>
</html>