package cn.qnight.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.qnight.common.Pager;
import cn.qnight.common.Pager.OrderType;
import cn.qnight.model.entity.Deparment;
import cn.qnight.model.entity.Employee;
import cn.qnight.model.service.DeparmentService;
import cn.qnight.model.service.EmployeeService;
import cn.qnight.model.service.JobService;
import cn.qnight.model.service.RoleService;

@Controller
@RequestMapping(value = "/employee")
public class EmployeeController extends BaseController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private DeparmentService deparmentService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private JobService jobService;

	@RequestMapping(value = "/list")
	public ModelAndView queryList(ModelAndView model, Pager<Employee> pager, Employee employee, String depid) {
		if (depid != null) {
			Deparment deparment = deparmentService.find(depid);
			employee.setDepartmentid(deparment);
		}
		Map<String, OrderType> orders = new LinkedHashMap<String, Pager.OrderType>();
		orders.put("isusing", OrderType.desc);
		orders.put("createTime", OrderType.asc);
		pager.setOrders(orders);
		pager.setQueryObject(employee);
		List<Deparment> deparments = deparmentService.findAll();
		List<Deparment> deparments2 = new ArrayList<Deparment>();
		for (Deparment deparment : deparments) {
			if (deparment.getParentid() == null) {
				deparments2.add(deparment);
			}
		}
		employeeService.findByPager(pager);
		model.addObject("depid", depid);
		model.addObject("menuList", deparments2);
		model.setViewName("employee/employee_list");
		return model;
	}

	@RequestMapping("/add")
	public ModelAndView add(ModelAndView model, String depid) {
		model.addObject("dep", deparmentService.find(depid));
		model.setViewName("/employee/employee_add");
		return model;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(ModelAndView model, String depid, Employee employee, String roleindex, String jobindex) {
		employee.setRoleid(roleService.find(roleindex));
		employee.setDepartmentid(deparmentService.find(depid));
		employee.setJob(jobService.find(jobindex));
		employee.setCreateTime(new Date());
		employee.setIsusing(true);
		employee.setPassword("123456");
		model.addObject("depid", depid);
		try {
			employeeService.save(employee);
		} catch (Exception e) {
			// TODO: handle exception
			return ajaxDoneError("新增员工失败！！");
		}
		return ajaxDoneSuccess("新增员工成功！");
	}

	@RequestMapping(value = "/form")
	public ModelAndView editForm(ModelAndView model, String id, String depid) {
		Employee employee = employeeService.find(id);
		model.addObject("depid", depid);
		model.addObject("emp", employee);
		model.setViewName("/employee/employee_edit");
		return model;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(ModelAndView model, String depid, String empid, String realname, Boolean isusing) {
		Employee employee = employeeService.find(empid);
		employee.setDepartmentid(deparmentService.find(depid));
		employee.setUpdateTime(new Date());
		employee.setIsusing(isusing);
		employee.setRealname(realname);
		try {
			employeeService.save(employee);
		} catch (Exception e) {
			// TODO: handle exception
			return ajaxDoneError("更新员工信息失败！！");
		}
		return ajaxDoneSuccess("更新员工信息成功！！");
	}

	@RequestMapping(value = "/queryDep")
	public ModelAndView queryDep(ModelAndView model) {
		List<Deparment> deparments = deparmentService.findAll();
		List<Deparment> deparments2 = new ArrayList<Deparment>();
		for (Deparment deparment : deparments) {
			if (deparment.getParentid() == null) {
				deparments2.add(deparment);
			}
		}
		model.addObject("menuList", deparments2);
		model.setViewName("employee/dep_tree");
		return model;
	}

	@RequestMapping(value = "/export")
	public void exportEmployee(HttpServletResponse response, ModelAndView model) {
		HSSFWorkbook workbook = employeeService.export();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss"); // 定义文件名格式

		try {
			// 定义excle名称 ISO-8859-1防止名称乱码
			String msg = new String(("员工信息_" + format.format(new Date()) + ".xls").getBytes(), "ISO8859-1");
			// 以导出时间作为文件名
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment;filename=" + msg);
			ServletOutputStream out = response.getOutputStream();
			workbook.write(out);
			out.flush();
			out.close();
		} catch (IOException e) {

		}

	}

	@RequestMapping(value = "/download")
	public void downLoad(HttpServletResponse response) throws IOException {
		String file = "C:\\Users\\admin\\Pictures\\QQ图片20170206182541.png";
		try {
			String filename = new String(("QQ图片20170206182541.png").getBytes(), "ISO8859-1");
			response.addHeader("Content-Disposition", "attachment;filename=" + filename);
			response.setContentType("image/png");
			ServletOutputStream out = response.getOutputStream();
			FileInputStream fInputStream = new FileInputStream(file);
			BufferedInputStream bStream = new BufferedInputStream(fInputStream);
			byte[] b = new byte[1024];
			int i = 0;

			while ((i = bStream.read(b)) > 0) {
				out.write(b, 0, i);
			}
			fInputStream.close();
			out.flush();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
