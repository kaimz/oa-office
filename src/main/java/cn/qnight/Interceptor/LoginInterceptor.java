package cn.qnight.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.id.enhanced.TableStructure;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.qnight.model.entity.Employee;


public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if (request.getServletPath().startsWith("/login")) {
			return true;
		}
		if (request.getServletPath().startsWith("/userlogin")) {
			return true;
		}
		Employee employee = (Employee) request.getSession().getAttribute("loginuser");
		
		if (employee != null && employee.getId() != null && employee.getId() != "") {
			return true;
		}
		response.sendRedirect(request.getContextPath() + "/login");
		return false;
	}

}
