package cn.qnight.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.JobDao;
import cn.qnight.model.entity.Job;
import cn.qnight.model.service.JobService;

@Service
@Transactional
public class JobServiceImpl extends BaseServiceImpl<Job, String> implements JobService {

	@Autowired
	public void setDao(JobDao dao) {
		this.dao = dao;
	}
}
