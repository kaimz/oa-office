package cn.qnight.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.DeparmentDao;
import cn.qnight.model.entity.Deparment;
import cn.qnight.model.service.DeparmentService;

@Service
@Transactional
public class DeparmentServiceImpl extends BaseServiceImpl<Deparment, String> implements DeparmentService{

	@Autowired
	public void setDao(DeparmentDao dao) {
		this.dao = dao;
	}
}
