package cn.qnight.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.qnight.common.Pager;
import cn.qnight.common.Pager.OrderType;
import cn.qnight.model.entity.Deparment;
import cn.qnight.model.entity.Employee;
import cn.qnight.model.service.DeparmentService;
import cn.qnight.model.service.EmployeeService;

@Controller
@RequestMapping(value = "/deparment")
public class DeparmentController extends BaseController{

	@Autowired
	private DeparmentService deparmentService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView model, Pager<Deparment> pager,
			Deparment deparment) {
		Map<String, OrderType> orders=new LinkedHashMap<String, Pager.OrderType>();
		orders.put("name", OrderType.desc);
		pager.setOrders(orders);
		pager.setQueryObject(deparment);
		deparmentService.findByPager(pager);
		model.setViewName("deparment/deparment_list");
		return model;
	}
	
	@RequestMapping(value = "/add")
	public String add() {
		return "deparment/deparment_add";
	}
	
	@RequestMapping(value = "/queryDep")
	public ModelAndView queryDep(ModelAndView model) {
		List<Deparment> deparments = deparmentService.findAll();
		List<Deparment> deparments2 = new ArrayList<Deparment>();
		for (Deparment deparment : deparments) {
			if(deparment.getParentid() == null){
				deparments2.add(deparment);
			}
		}
		model.addObject("menuList", deparments2);
		model.setViewName("deparment/deparment_tree");
		return model;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(Deparment deparment, String depid) {
		deparment.setParentid(deparmentService.find(depid));
		deparment.setCreateTime(new Date());
		try {
			deparmentService.save(deparment);
		} catch (Exception e) {
			// TODO: handle exception
			return ajaxDoneError("新增部门失败！！");
		}
		return ajaxDoneSuccess("新增部门成功！！");
	}
	
	@RequestMapping(value = "/delete/{id}")
	public ModelAndView delete(@PathVariable("id")String id, Deparment deparment,
			Employee employee) {
		deparment = deparmentService.find(id);
		employee.setDepartmentid(deparment);
		
		if (employeeService.findByQueryProperty(employee).size() > 0) {
			return ajaxDoneError("该部门下还有员工，还不能删除！！");
		}
		try {
			deparmentService.delete(id);
		} catch (Exception e) {
			// TODO: handle exception
			return ajaxDoneError("删除失败！！");
		}
		return ajaxDoneSuccess("删除部门成功！！");
	}
	
	@RequestMapping(value = "editor/{id}")
	public ModelAndView editor(@PathVariable("id")String id,
			Deparment deparment, ModelAndView model) {
		deparment = deparmentService.find(id);
		model.addObject("dep", deparment);
		model.setViewName("deparment/deparment_edit");
		return model;
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public ModelAndView edit(String depid, String id, String depname,
			String depdescription) {
		Deparment deparment = deparmentService.find(id);
		deparment.setParentid(deparmentService.find(depid));
		deparment.setUpdateTime(new Date());
		deparment.setDescription(depdescription);
		deparment.setName(depname);
		try {
			deparmentService.save(deparment);
		} catch (Exception e) {
			// TODO: handle exception
			return ajaxDoneError("修改部门信息失败！！");
		}
		return ajaxDoneSuccess("修改部门信息成功！！");
	}
}
