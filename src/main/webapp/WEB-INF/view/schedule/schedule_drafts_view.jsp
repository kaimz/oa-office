<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
    <link rel="stylesheet" href="${ctx}/css/mainfest/styles.css">
    <script src="${ctx}/js/jquery.ui.widget.min.js"></script>
    <script src="${ctx}/js/jquery.marcopolo.min.js"></script>
    <script src="${ctx}/js/jquery.manifest.js"></script>

<script type="text/javascript">
function draftscloseAjaxDone(json) {
	DWZ.ajaxDone(json);
	// 模拟触发导航管理菜单按钮
	navTab.openTab("draftsId",
			"${ctx}/schedule/drafts/list", {
				title : "草稿箱",
				fresh : true,
				data : {}
			});
} 
	$(document).ready(function() {
		// 为上传文件的路径加上唯一识别标识
		var upLinkUrl = $("#textarea").attr("upLinkUrl");
		var upImgUrl = $("#textarea").attr("upImgUrl");
		var upFlashUrl = $("#textarea").attr("upFlashUrl");
		var upMediaUrl = $("#textarea").attr("upMediaUrl");
		$("#textarea").attr("upLinkUrl", upLinkUrl);
		$("#textarea").attr("upImgUrl", upImgUrl);
		$("#textarea").attr("upFlashUrl", upFlashUrl);
		$("#textarea").attr("upMediaUrl", upMediaUrl); 
		
	$('#input').manifest();

						$('#locations')
								.manifest(
										{
											formatDisplay : function(data,
													$item, $mpItem) {
												return data.name;
											},
											formatValue : function(data,
													$value, $item, $mpItem) {
												return data.id;
											},
											marcoPolo : {
												data : {
													client_id : 'EDCKXTNEIH2UJLGHEXUUAKPLNRHCNS0URQZNCLH10YZQLBES',
													client_secret : 'XUBZENVXNNK1ORU4GDDO22B0TBZZWW2QXW3H3O5CYC0JQ0RU',
													intent : 'global',
													limit : 20,
													v : '20130826'
												},
												formatData : function(data) {
													return data.response.venues;
												},
												formatItem : function(data,
														$item) {
													return data.name;
												},
												minChars : 3,
												param : 'query'
											},
											required : true
										});
						
						
		});

	function draftssubmitForm() {

		var value = $("#draftstextarea").val();
		value = value.replace(/\s/g, "");
		value = value.replace(/&nbsp;/g, "")
		if (value == "") {
			alertMsg.error('内容不能为空');
			return false;
		}
		// 提交表单
		$("#draftsForm").submit();
	}
	
	function selectReceive(id, name, email) {
		var _flag = true;
		$(".mf_value").each(function() {
			if($(this).val() == id) {
				_flag = false;
				return;
			}
		})
		if(_flag) {
			$("ol.mf_list").append('<li class="mf_item" role="option" aria-selected="false">'+name+'<span style="color: #7F7F7F">('+email+')</span>'
					+'<a href="#" class="mf_remove" title="Remove">X</a>'
					+'<input type="hidden" class="mf_value" name="input_values[]" value="'+id+'">'
					+'</li>'
				);
		}
	}
	
	function draftssaveAsDraft() {
		$("input[type=hidden][name=flag]").val("1");
		draftssubmitForm();
	}
</script>
<div class="pageContent">
	<form method="post" id="draftsForm"
		action="${ctx}/schedule/insert"
		class="pageForm required-validate" enctype="multipart/form-data"
		onsubmit="return iframeCallback(this,draftscloseAjaxDone)">
		
		<div class="pageFormContent nowrap" layoutH="56">
			<input type="hidden" name="flag" value="0">
			
					<dl>
						<dt>标题：</dt>
						<dd>
							<input type="text" name="title" class="required specialCharacter" value="${baseSchedule.title }"
								alt="最多输入32个字符" maxlength="32" size="70" style="border: 1px solid rgb(153,187,232);cursor: text;display: inline-block;padding: 2px;width: 494px;" />
						</dd>
					</dl>
			
			<dl>
				<dt>收件人</dt>
				<dd>
        			<input type="text" name="input" id="input" autocomplete="off">
				</dd>
			</dl>
			<dl>
				<dt>内容：</dt>
				<dd>

					<textarea class="required editor xheditor {urlType:'root'}" id="draftstextarea" name="description"
						rows="15" cols="100" upLinkUrl="${ctx}/schedule/upload"
						upImgUrl="${ctx}/schedule/upload"
						upFlashUrl="${ctx}/schedule/upload"
						upMediaUrl="${ctx}/schedule/upload"
						cleanPaste="1">
						<c:if test="${!empty baseSchedule.description}">${baseSchedule.description}</c:if>
					</textarea>
				</dd>
			</dl>
			
			
			<dl>
				<dt>发件人</dt>
				<dd>
        			<span style="color:rgb(153,187,232)">${loginuser.realname }</span> <span style="color: #7F7F7F">(${loginuser.email })</span>
				</dd>
			</dl>
		</div>
		<div id="drafts_contacts" style="display: block;position: absolute;width: 200px;min-height: 200px;max-height:600px; left: 800px;top: 30px;border: 1px solid rgb(153,187,232);overflow: hidden;">
			<span style="padding-left: 75px;padding-bottom: 10px;padding-top: 10px;">联系人</span>
			<ul style="list-style: none;overflow: visible;margin-left: 0px;">
				
				<c:forEach  var="item" items="${emp}" varStatus="s">
					<c:if test="${loginuser.id != item.id }">
						<li style="display: list-item;text-align: -webkit-match-parent;list-style: none;" title="${item.email }">
							<a href="javascript:selectReceive('${item.id }', '${item.realname }', '${item.email }')" style="display: block; overflow: hidden;font-size: 16px;text-align: center;color: rgb(153,187,232)">${item.realname }<span style="color: #7F7F7F">(${item.email })</span></a>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		
		</div>
		
		<div class="formBar">
			<ul>
				<li><a class="button" href="javascript:void(0)"
					onclick="draftssaveAsDraft()"><span>保存为草稿</span></a>
				</li>
				<li><a class="button" href="javascript:void(0)"
					onclick="draftssubmitForm()"><span>发送邮件</span></a>
				</li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="reset">清空</button>
						</div>
					</div></li>
				<li><a class="button"
					href="${ctx}/schedule/drafts/list"
					target="ajax" rel="drafts"><span>取消</span></a></li>
			</ul>
		</div>
	</form>
</div>