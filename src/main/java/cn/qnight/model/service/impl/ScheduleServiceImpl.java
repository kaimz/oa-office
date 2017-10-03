package cn.qnight.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.ScheduleDao;
import cn.qnight.model.entity.Schedule;
import cn.qnight.model.service.ScheduleService;

@Service
@Transactional
public class ScheduleServiceImpl extends BaseServiceImpl<Schedule, String> implements ScheduleService {
	
	@Autowired
	public void setDao(ScheduleDao dao) {
		this.dao = dao;
	}
	
}


