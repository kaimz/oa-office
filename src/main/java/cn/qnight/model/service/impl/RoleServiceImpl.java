package cn.qnight.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.RoleDao;
import cn.qnight.model.entity.Role;
import cn.qnight.model.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl extends BaseServiceImpl<Role, String> implements RoleService{

	@Autowired
	public void setDao(RoleDao dao) {
		this.dao = dao;
	}
}
