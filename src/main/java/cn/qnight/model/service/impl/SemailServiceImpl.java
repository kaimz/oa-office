package cn.qnight.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.SemailDao;
import cn.qnight.model.entity.Semail;
import cn.qnight.model.service.SemailService;

@Service
@Transactional
public class SemailServiceImpl extends BaseServiceImpl<Semail, String> implements SemailService{
	
	@Autowired
	public void setDao(SemailDao dao) {
		this.dao = dao;
	}
}
