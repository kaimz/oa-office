package cn.qnight.model.dao.impl;

import org.springframework.stereotype.Repository;

import cn.qnight.model.dao.CalendarDao;
import cn.qnight.model.entity.Calendar;

@Repository
public class CalendarDaoImpl extends BaseDaoImpl<Calendar, String> implements CalendarDao{

}
