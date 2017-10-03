package cn.qnight.controller;

import java.io.FileNotFoundException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.qnight.model.entity.Employee;
import cn.qnight.model.entity.Semail;
import cn.qnight.model.service.EmployeeService;
import cn.qnight.model.service.NewsService;
import cn.qnight.model.service.SemailService;
import freemarker.core.ReturnInstruction.Return;

/** 
* @ClassName: LoginController 
* @Description: TODO(登录控制器) 
* @author zhangkai 
* @date 2017年3月17日 下午4:57:42 
*  
*/
@Controller
public class LoginController extends BaseController{
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private SemailService semailService;
	
	@Autowired
	private NewsService newsService;

	@RequestMapping(value={"/","/index"})
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/userlogin", method = RequestMethod.POST) 
	public ModelAndView userlogin(String loginname, String password, HttpSession session, 
			ModelAndView model, Semail semail) {
		Employee employee = employeeService.findByLoginnameAndPassword(loginname, password);
		if (employee == null) {
			model.setViewName("redirect:/login");
			model.addObject("errorMessage", "账号或密码错误！");
			return model;
		}
		if(!employee.getIsusing()){
			model.setViewName("redirect:/login");
			model.addObject("errorMessage", "账号被冻结！！请联系管理员！");
			return model;
		}
		session.setAttribute("loginuser", employee);
		model.setViewName("redirect:/index");
		return model;
	}
	
	@RequestMapping("/login_dialog")
	public String loginDialogController() {
		return "login_dialog";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser");
		return "login";
	}
	
	@RequestMapping(value = "/queryCount")
	@ResponseBody
	public Integer queryCountEmail(HttpSession session, Employee employee,
			Semail semail){
		employee = (Employee) session.getAttribute("loginuser");
		semail.setSendid(employee);
		semail.setIsview(false);
		return semailService.findByQueryProperty(semail).size();
	}
	
	@RequestMapping(value = "/newsindex")
	public ModelAndView queryNewsIndex(ModelAndView model) {
		List list = newsService.queryTitleList();
		model.addObject("list", list);
		model.setViewName("index_inc/newsindex");
		return model;
	}
}
