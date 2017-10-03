package cn.qnight.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.logging.SimpleFormatter;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.qnight.model.entity.Calendar;
import cn.qnight.model.entity.Employee;
import cn.qnight.model.service.CalendarService;
import cn.qnight.model.service.DeparmentService;
import cn.qnight.model.service.EmployeeService;

@Controller
@RequestMapping(value="/calendar")
public class CalendarController extends BaseController{
	
	@Autowired
	private CalendarService calendarService;
	
	@Autowired
	private DeparmentService deparmentService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/index")
	public ModelAndView canlendarIndex(ModelAndView model, HttpSession session, String userid) {
		Employee employee = (Employee) session.getAttribute("loginuser");
		Employee employee2 = new Employee();
		employee2.setDepartmentid(employee.getDepartmentid());
		List<Employee> list = employeeService.findByQueryProperty(employee2);
		list.remove(employeeService.find(employee.getId()));
		if (userid == null) {
			userid = employee.getId();
		}
		model.addObject("userid", userid);
		model.addObject("topreview", employeeService.find(userid).getRealname());
		model.addObject("list", list);
		
		model.setViewName("calendar/calendar_index");
		return model;
	}
	
	@RequestMapping(value="/queryCalendar")
	public @ResponseBody List<Calendar> queryCalendar(String userid) {
		Calendar calendar = new Calendar();
		calendar.setEmployee(userid);
		return calendarService.findByQueryProperty(calendar);
	}
	
	@RequestMapping(value = "/addCalendar")
	public String addCalendar() {
		return "calendar/calendar_add";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(String title, Boolean allDay, HttpSession session,
			String start0, String end0, String start1) throws ParseException {
		Employee employee = (Employee) session.getAttribute("loginuser");
		Calendar calendar = new Calendar();
		calendar.setEmployee(employee.getId());
		calendar.setTitle(title);
		calendar.setAllDay(allDay);
		
		if (allDay == true) {
			SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
			calendar.setStart(sFormat.parse(start1));
		} else {
			SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			calendar.setStart(sFormat.parse(start0));
			if (end0 != null && end0 != "") {
				calendar.setEnd(sFormat.parse(end0));
			}
		}
		calendar.setCreateTime(new Date());
		try {
			calendarService.save(calendar);
		} catch (Exception e) {
			// TODO: handle exception
			return ajaxDoneError("新增日程失败，请重试！");
		}
		return ajaxDoneSuccess("新增日程成功！");
	}
}
