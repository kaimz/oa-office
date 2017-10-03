/*编辑通用js方法,用于默认选择list列表第一行*/

/*页面加载完毕选中第一行*/
$(document).ready(function() {
	// 模拟click事件
	$("table.table tr").eq(1).trigger("click")
	// 得到页面的table的第一行tr设置class="selected"
	$("table.table tr").eq(1).addClass("selected");
});

/* 模拟cilck事件 */
function clickTr() {
	// 得到当前选中的tr 模拟click事件
	$("tr.selected").trigger("click");
}

/* 为list页面隐藏域设置值 */
/**
 * @param value
 * @param hiddenId
 * @returns
 */
function c(value, hiddenId) {
	// 将menuId的设置进入hidden
	$("#" + hiddenId).val(value);
}

/* 为编辑按钮链接后面加上对象id */
function changeHref(href, objectId, editObject ) {
	// 改变href属性
	href = href + "?" + objectId + "=" + $("#" + objectId).val();
	// 将href设置进元素
	$("#" + editObject).attr("href", href);
}

/* 为portal编辑按钮链接后面加上对象id */
function changePortalHref(href, objectId, editObject, organizationid) {
	// 改变href属性
	href = href + "?" + objectId + "=" + $("#" + objectId).val() + organizationid;
	// 将href设置进元素
	$("#" + editObject).attr("href", href);
}

/*点击树形菜单节点li，为所有li删除选中*/
function clearLiClass(){
	$(".tree li").removeClass("selected");
}

//自定义特殊字符验证
jQuery.validator.addMethod("specialCharacter", function(value, element) { 
	var pattern = new RegExp("[@#$%^&*-+_=\"]");
	return this.optional(element) || (!pattern.test(value)); 
}, "此栏存在特殊字符");

jQuery.validator.addMethod("isPhone", function(value,element) { 
	  var length = value.length; 
	  var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/; 
	  var tel = /^\d{3,4}-?\d{7,9}$/; 
	  return this.optional(element) || (tel.test(value) || mobile.test(value)); 

	}, "请正确填写您的联系电话"); 

jQuery.validator.addMethod("isIdCardNo", function(value, element) { 
	  return this.optional(element) || idCardNoUtil.checkIdCardNo(value);     
	}, "请正确输入您的身份证号码"); 

