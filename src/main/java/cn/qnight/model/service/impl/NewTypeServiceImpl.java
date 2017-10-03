package cn.qnight.model.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.NewTypeDao;
import cn.qnight.model.entity.NewType;
import cn.qnight.model.service.NewTypeService;

@Service
@Transactional
public class NewTypeServiceImpl extends BaseServiceImpl<NewType, String> implements NewTypeService {

	@Autowired
	public void setDao(NewTypeDao dao) {
		this.dao = dao;
	}
}
