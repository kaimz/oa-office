package cn.qnight.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.CalendarDao;
import cn.qnight.model.entity.Calendar;
import cn.qnight.model.service.CalendarService;

@Service
@Transactional
public class CalendarServiceImpl extends BaseServiceImpl<Calendar, String> implements CalendarService{
	
	@Autowired
	public void setDao(CalendarDao dao) {
		this.dao = dao;
	}
}
