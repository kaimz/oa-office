package cn.qnight.model.dao.impl;

import org.springframework.stereotype.Repository;

import cn.qnight.model.dao.JobDao;
import cn.qnight.model.entity.Job;

@Repository
public class JobDaoImpl extends BaseDaoImpl<Job, String> implements JobDao{

}
