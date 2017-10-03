package cn.qnight.controller;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import cn.qnight.common.DateEditor;
import cn.qnight.common.DoubleEditor;
import cn.qnight.common.IntegerEditor;
import cn.qnight.common.LongEditor;


/**
 * 所有Cotroller类的基础类
 * 
 * @author
 * 
 */
public abstract class BaseController {
	
	protected ResourceBundleMessageSource _res;

	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {

		binder.registerCustomEditor(int.class, new IntegerEditor());
		binder.registerCustomEditor(long.class, new LongEditor());
		binder.registerCustomEditor(double.class, new DoubleEditor());
		binder.registerCustomEditor(Date.class, new DateEditor());
	}

	protected ModelAndView ajaxDone(int statusCode, String message) {
		ModelAndView mav = new ModelAndView("ajaxDone");
		mav.addObject("statusCode", statusCode);
		mav.addObject("message", message);
		return mav;
	}

	protected ModelAndView ajaxDoneSuccess(String message) {
		return ajaxDone(200, message);
	}

	protected ModelAndView ajaxDoneError(String message) {
		return ajaxDone(500, message);
	}

	protected String getMessage(String code) {
		return this.getMessage(code, new Object[] {});
	}

	protected String getMessage(String code, Object arg0) {
		return getMessage(code, new Object[] { arg0 });
	}

	protected String getMessage(String code, Object arg0, Object arg1) {
		return getMessage(code, new Object[] { arg0, arg1 });
	}

	protected String getMessage(String code, Object arg0, Object arg1,
			Object arg2) {
		return getMessage(code, new Object[] { arg0, arg1, arg2 });
	}

	protected String getMessage(String code, Object arg0, Object arg1,
			Object arg2, Object arg3) {
		return getMessage(code, new Object[] { arg0, arg1, arg2, arg3 });
	}

	protected String getMessage(String code, Object[] args) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		LocaleResolver localeResolver = RequestContextUtils
				.getLocaleResolver(request);
		Locale locale = localeResolver.resolveLocale(request);

		return _res.getMessage(code, args, locale);
	}

}
