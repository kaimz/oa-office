/**
 * DWZ框架扩展
 * @author wuchangwen
 */

(function($){
	$.extend($.validator.messages,{
		phone: "数字、空格、括号",
		validateChinese:"中文、数字、下划线、字母",
	})
	
	if ($.validator){
		$.validator.addMethod("validateChinese", function(value, element) {
			return this.optional(element) || /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/.test(value);
		}, "中文、数字、下划线、字母");
	}
	if($.validator){
		$.validator.addMethod("valChinese", function(value, element) {
			return this.optional(element) || /^[\u4e00-\u9fa5]+$/.test(value);
		}, "中文");
	}
	if ($.validator){
		$.validator.addMethod("validateUrl", function(value, element) {
			return this.optional(element) || /^(\/\w*)+$/.test(value);
		}, "错误的Url格式,请输入/xx/xx格式");
	}
	if ($.validator){
		$.validator.addMethod("validateMobile", function(value, element) {
			return this.optional(element) || /^(13[0-9]|145|147|15[0-3]|15[5-9]|18[0-3]|18[5-9])[0-9]{8}$/.test(value);
		}, "错误的手机号码");
	}
	if ($.validator){
		$.validator.addMethod("validateTelephone", function(value, element) {
			return this.optional(element) || /^(\d{3}-\d{8}|\d{4}-\d{7})$/.test(value);
		}, "错误的电话号码");
	}
	if ($.validator){
		$.validator.addMethod("validateChineseName", function(value, element) {
			return this.optional(element) || /^[\u4e00-\u9fa5]+$/.test(value);
		}, "请输入中文名字");
	}
	if ($.validator){
		$.validator.addMethod("validatePort", function(value, element) {
			return this.optional(element) || /^(\d{1,4}|([1-5]\d{4})|([1-6][1-4]\d{3})|([1-6][1-4][1-4]{2})|([1-6][1-4][1-4][1-2]\d)|([1-6][1-5][1-5][1-3][1-5]))$/.test(value);
		}, "请输入正确的端口号");
	}
	if ($.validator){
		$.validator.addMethod("validateIP", function(value, element) {
			return this.optional(element) || /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/.test(value);
		}, "请输入正确的ip地址");
	}
	if ($.validator){
		$.validator.addMethod("validatePermission", function(value, element) {
			return this.optional(element) || /^[A-Za-z_]+:[A-Za-z_]+$/.test(value);
		}, "错误的英文权限名称，请输入abc:abc格式");
	}
	if ($.validator){
		$.validator.addMethod("validatePostCode", function(value, element) {
			return this.optional(element) || /^[1-9]\d{5}$/.test(value);
		}, "请输入正确的邮政编码");
	}
	if ($.validator){
		$.validator.addMethod("validateFax", function(value, element) {
			return this.optional(element) || /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/.test(value);
		}, "请输入正确的传真号码");
	}
	if ($.validator){
		$.validator.addMethod("validateImage", function(value, element) {
			return this.optional(element) || /^[a-zA-Z]:(\\.+)(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$/.test(value);
		}, "请上传正确的图片格式");
	}
})(jQuery)