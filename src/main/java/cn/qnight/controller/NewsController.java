package cn.qnight.controller;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.qnight.common.Pager;
import cn.qnight.common.Pager.OrderType;
import cn.qnight.model.entity.Employee;
import cn.qnight.model.entity.News;
import cn.qnight.model.service.EmployeeService;
import cn.qnight.model.service.NewTypeService;
import cn.qnight.model.service.NewsService;
import javassist.compiler.TokenId;
import jsx3.app.Model;

@Controller
@RequestMapping(value = "/news")
public class NewsController extends BaseController{

	@Autowired
	private NewsService newsService;
	
	@Autowired
	private NewTypeService newTypeService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView model, News news, Pager<News> pager) {
		Map<String, OrderType> orders = new LinkedHashMap<String, OrderType>(); 
	    orders.put("isenble", OrderType.desc);
	    orders.put("createTime", OrderType.desc);
	    pager.setOrders(orders);
	    pager.setQueryObject(news);
	    newsService.findByPager(pager);
	    model.setViewName("news/news_list");
	    return model;
	}
	
	@RequestMapping(value = "/add")
	public ModelAndView add(ModelAndView model) {
		model.addObject("newType", newTypeService.findAll());
		model.setViewName("news/news_add");
		return model;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(News news, HttpSession session) {
		news.setNewstype(newTypeService.find(news.getNewstype().getId()));
		if (news.getId() == null || news.getId().equals("")) {
			news.setCreateTime(new Date());
			try {
				Employee employee = (Employee) session.getAttribute("loginuser");
				news.setEmployee(employee.getId());
				newsService.save(news);
			} catch (Exception e) {
				// TODO: handle exception
				return ajaxDoneError("发布新闻失败！！");
			}
			return ajaxDoneSuccess("发布新闻成功！！");
		} else {
			News news2 = newsService.find(news.getId());
			news2.setContent(news.getContent());
			news2.setIsenble(news.getIsenble());
			news2.setNewstype(news.getNewstype());
			news2.setDescription(news.getDescription());
			news2.setTitle(news.getTitle());
			news2.setUpdateTime(new Date());
			try {
				newsService.save(news2);
			} catch (Exception e) {
				// TODO: handle exception
				return ajaxDoneError("修改新闻失败！！");
			}
			return ajaxDoneSuccess("修改新闻成功！！");
		}
	}
	
	@RequestMapping(value = "/editor/{id}")
	public ModelAndView editor(ModelAndView model, @PathVariable("id")String id) {
		News news = newsService.find(id);
		model.addObject("newType", newTypeService.findAll());
		model.addObject("baseNews", news);
		model.setViewName("news/news_add");
		return model;
	}
	
	@RequestMapping(value = "/queryList")
	public @ResponseBody List<News> queryList() {
		return newsService.queryTitleList();
	}
	
	@RequestMapping(value = "/toid/{id}")
	public ModelAndView toid(ModelAndView model, @PathVariable("id") String id) {
		model.addObject("newsid", id);
		model.setViewName("redirect:/index");
		return model;
	}
	
	@RequestMapping(value = "/details/{id}")
	public ModelAndView details(ModelAndView model, @PathVariable("id") String id) {
		News news = newsService.find(id);
		model.addObject("news", news);
		model.addObject("creater", employeeService.find(news.getEmployee()).getRealname());
		model.setViewName("/news/news_details");
		return model;
	}
}
