package cn.qnight.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.qnight.common.Pager;
import cn.qnight.common.SendMessageAuto;
import cn.qnight.model.entity.Employee;
import cn.qnight.model.entity.Schedule;
import cn.qnight.model.entity.Semail;
import cn.qnight.model.service.DeparmentService;
import cn.qnight.model.service.EmployeeService;
import cn.qnight.model.service.ScheduleService;
import cn.qnight.model.service.SemailService;

@Controller
@RequestMapping(value="/schedule")
public class ScheduleController extends BaseController{

	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private DeparmentService deparmentService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private SemailService semailService;
	
	@RequestMapping(value="/list")
	public ModelAndView queryScheduleList(ModelAndView model, Pager<Semail> pager,
			HttpSession session, Semail semail, String message) {
		if (message == null) {
			message = "1";
		}
		if (message.equals("1")) {
			semail.setIsview(false);
		}else if (message.equals("2")) {
			semail.setIsview(true);
		}
		model.addObject("schedulemessage", message);
		Employee employee = (Employee) session.getAttribute("loginuser");
		semail.setSendid(employee);
		pager.setQueryObject(semail);
		pager = semailService.findByPager(pager);
		model.addObject("pager", pager);
		model.setViewName("schedule/schedule_list");
		return model;
	}
	
	@RequestMapping(value="/tosend")
	public ModelAndView tosend(ModelAndView model, String id) {
		model.setViewName("schedule/schedule_tosend");
		Schedule schedule = null;
		if(id !=null) {
			schedule = scheduleService.find(id);
		}
		model.addObject("schedule", schedule);
		model.addObject("emp", employeeService.findAll());
		return model;
	}
	
	@RequestMapping(value = "/insert")
	public ModelAndView insert(ModelAndView model, HttpSession session, HttpServletRequest request,
			@RequestParam(value = "input_values[]", required = false) List<String> sendemp, Schedule schedule,
			String flag, @RequestParam(value = "responseto", required = false) String responseto) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		if(responseto != null) {
			Schedule schedule2 = scheduleService.find(responseto);
			schedule.setParentid(schedule2);
		}
		
		Employee employee = (Employee) session.getAttribute("loginuser");
		schedule.setCreateTime(new Date());
		schedule.setEmployeeid(employee);
		schedule.setIsdelete(false);
		if (flag.equals("1")) {
			schedule.setIscomplete(false);
			scheduleService.save(schedule);
			return ajaxDoneSuccess("保存草稿成功！");
		} else {
			schedule.setIscomplete(true);
			for (String string : sendemp) {
				Semail semail = new Semail();
				semail.setIsview(false);
				semail.setScheduleid(schedule);
				Employee employee2 = new Employee();
				employee2.setId(string);
				semail.setSendid(employee2);
				semail.setCreateTime(new Date());
				semailService.save(semail);
				SendMessageAuto sendMessageAuto = new SendMessageAuto();
				sendMessageAuto.sendMessageAuto(employee2.getId(), "您有新的邮件接收，请查看!");
			}
		}
		return ajaxDoneSuccess("发送邮件成功！");
	}
	
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public Map<String, String> upload(@RequestParam("filedata") MultipartFile file,HttpServletRequest request) throws IOException {
		Map<String, String> map =  new HashMap<String, String>();
		request.setCharacterEncoding("utf-8");
		String path = request.getSession().getServletContext().getRealPath("upload");
		
		String extensionName = file.getOriginalFilename().substring(file.getOriginalFilename()
				.lastIndexOf(".") + 1);
		String filename = UUID.randomUUID().toString();
		
		String myfilename = path+"//"+filename+"."+extensionName;
		File newdir = new File(path);
		if (!newdir.exists()) {
			newdir.mkdir();
		}
		//用流方式写入
		BufferedInputStream is = new BufferedInputStream(file.getInputStream());
		FileOutputStream fs = new FileOutputStream(new File(myfilename));
		int i=-1;
		while ((i=is.read())!=-1) {
			fs.write(i);
		}
		fs.flush();
		fs.close();
		is.close();
		InetAddress address = InetAddress.getLocalHost();
		String hostAddress = address.getHostAddress();
		map.put("err", "");
		map.put("msg", "/oa-office/upload/"+filename+"."+extensionName);
		
		return map;
	}
	
	@RequestMapping(value="/mark")
	public ModelAndView mark(@RequestParam("id") List<String> id) {
		for (String string : id) {
			Semail semail = semailService.find(string);
			semail.setIsview(true);
			semailService.save(semail);
		}
		
		return ajaxDoneSuccess("标记成功！");
	}
	
	@RequestMapping(value="/delete")
	public ModelAndView delete( @RequestParam("id") List<String> id) {
		try {
			for (String string : id) {
				semailService.delete(string);
			}
			return ajaxDoneSuccess("删除成功！");
		} catch (Exception e) {
			// TODO: handle exception
			return ajaxDoneError("删除失败！");
		}
		
	}
	
	@RequestMapping(value="/outbox/list")
	public ModelAndView outboxList(Pager<Schedule> pager, ModelAndView model, Schedule schedule, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("loginuser"); 
		schedule.setEmployeeid(employee);
		schedule.setIsdelete(false);
		schedule.setIscomplete(true);
		pager.setQueryObject(schedule);
		scheduleService.findByPager(pager);
		model.setViewName("schedule/schedule_outbox");
		return model;
	}
	
	@RequestMapping(value = "/outbox/delete", method=RequestMethod.POST)
	public ModelAndView outboxDelete( @RequestParam("id") List<String> id) {
		try {
			for (String string : id) {
				Schedule schedule = scheduleService.find(string);
				schedule.setIsdelete(true);
				scheduleService.save(schedule);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return ajaxDoneError("删除失败！");
		}
		return ajaxDoneSuccess("删除成功！");
		
	}
	
	@RequestMapping(value="/drafts/list") 
	public ModelAndView draftsList(ModelAndView model,Schedule schedule, Pager<Schedule> pager, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("loginuser");
		schedule.setEmployeeid(employee);
		schedule.setIscomplete(false);
		pager.setQueryObject(schedule);
		scheduleService.findByPager(pager);
		model.setViewName("schedule/schedule_drafts");
		return model;
	}
	
	@RequestMapping(value="/drafts/delete")
	public ModelAndView draftsDelete(@RequestParam("id") String[] id) {
		for (String string : id) {
			try {
				scheduleService.delete(string);
			} catch (Exception e) {
				// TODO: handle exception
				return ajaxDoneError("删除失败！");
			}
		}
		return ajaxDoneSuccess("删除成功！");
	}
	
	@RequestMapping(value="/list/detail/{id}/{schedulemessage}")
	public ModelAndView listDetail(ModelAndView model, @PathVariable("id")String id,
			Semail semail, @PathVariable("schedulemessage")String schedulemessage) {
		semail = semailService.find(id);
		model.setViewName("schedule/schedule_list_view");
		model.addObject("semail", semail);
		model.addObject("schedulemessage", schedulemessage);
		semail.setIsview(true);
		semailService.save(semail);
		return model;
	}
	
	@RequestMapping(value="/outbox/detail/{id}")
	public ModelAndView outboxDetail(ModelAndView model, @PathVariable("id")String id, Schedule schedule) {
		schedule = scheduleService.find(id);
		model.setViewName("schedule/schedule_outbox_view");
		model.addObject("schedule", schedule);
		return model;
	}
	
	@RequestMapping(value="/outbox/transpond/{id}")
	public ModelAndView outBoxTranspond(ModelAndView model, 
			@PathVariable("id")String id, Schedule baseSchedule) {
		baseSchedule = scheduleService.find(id);
		model.setViewName("/schedule/schedule_outbox_transpond");
		model.addObject("baseSchedule", baseSchedule);
		model.addObject("emp", employeeService.findAll());
		return model;
	}
	
	@RequestMapping(value="/drafts/detail/{id}")
	public ModelAndView draftsDetails(ModelAndView model, 
			@PathVariable("id") String id, Schedule baseSchedule) {
		baseSchedule = scheduleService.find(id);
		model.setViewName("/schedule/schedule_drafts_view");
		model.addObject("baseSchedule", baseSchedule);
		model.addObject("emp", employeeService.findAll());
		return model;
	}
	
}
